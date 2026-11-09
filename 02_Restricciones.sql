-- ============================================================================
-- RESTRICCIONES
-- ============================================================================
USE gestion_zapateria;

-- No permite nombres de categorías y usuarios duplicados

ALTER TABLE categoria
  ADD CONSTRAINT uq_categoria_nombre UNIQUE (nombre);
ALTER TABLE usuario
  ADD CONSTRAINT uq_usuario_nombre UNIQUE (nombre_usuario);
ALTER TABLE proveedor
  ADD CONSTRAINT uq_proveedor_cuit UNIQUE (cuit);
ALTER TABLE compra
  ADD CONSTRAINT uq_compra_comprobante_proveedor UNIQUE (id_proveedor, nro_comprobante);

-- Para cada compra o venta, se utiliza una sola línea por producto+talle.
-- La PK es el id del detalle; esta UNIQUE NO es la clave primaria.

ALTER TABLE detalle_venta
  ADD CONSTRAINT uq_detalle_venta_producto_talle
  UNIQUE (id_venta, id_producto, numero_calzado);
ALTER TABLE detalle_compra
  ADD CONSTRAINT uq_detalle_compra_producto_talle
  UNIQUE (id_compra, id_producto, numero_calzado);

-- CHECK no permite cantidades/precios inválidos.
-- medio_pago de VENTA corresponde al cobro de TODA la venta, no de cada detalle
-- producto.activo utiliza BOOLEAN NOT NULL DEFAULT TRUE en la estructura.sql

ALTER TABLE producto
  ADD CONSTRAINT chk_producto_precio CHECK (precio_actual > 0);
ALTER TABLE producto_talle
  ADD CONSTRAINT chk_producto_talle_numero CHECK (numero_calzado BETWEEN 16 AND 50),
  ADD CONSTRAINT chk_producto_talle_stock CHECK (stock >= 0);
ALTER TABLE usuario
  ADD CONSTRAINT chk_usuario_rol CHECK (rol IN ('ADMINISTRADOR', 'VENDEDOR'));
ALTER TABLE venta
  ADD CONSTRAINT chk_venta_descuento CHECK (descuento BETWEEN 0 AND 100),
  ADD CONSTRAINT chk_venta_medio_pago
  CHECK (medio_pago IN (
      'TARJETA_CREDITO',
      'TARJETA_DEBITO',
      'TRANSFERENCIA',
      'EFECTIVO'
  ));
ALTER TABLE detalle_venta
  ADD CONSTRAINT chk_detalle_venta_cantidad CHECK (cantidad > 0),
  ADD CONSTRAINT chk_detalle_venta_precio CHECK (precio_unitario_venta > 0);
ALTER TABLE detalle_compra
  ADD CONSTRAINT chk_detalle_compra_cantidad CHECK (cantidad > 0),
  ADD CONSTRAINT chk_detalle_compra_precio CHECK (precio_unitario_compra > 0);
ALTER TABLE pago_proveedor
  ADD CONSTRAINT chk_pago_proveedor_monto CHECK (monto > 0),
  ADD CONSTRAINT chk_pago_proveedor_medio_pago
  CHECK (medio_pago IN (
      'TARJETA_CREDITO',
      'TARJETA_DEBITO',
      'TRANSFERENCIA',
      'EFECTIVO'
  ));

-- INTEGRIDAD REFERENCIAL: primero padre, luego hijo.
-- RESTRICT conserva historial. No se borra VENTA/COMPRA con detalles.
-- RESTRICT en PRODUCTO->PRODUCTO_TALLE para proteger los talles existentes;
-- los detalles referencian al talle tambien con ON DELETE RESTRICT.

ALTER TABLE producto
  ADD CONSTRAINT fk_producto_categoria
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
  ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE producto_talle
  ADD CONSTRAINT fk_producto_talle_producto
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
  ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE venta
  ADD CONSTRAINT fk_venta_usuario
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
  ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE compra
  ADD CONSTRAINT fk_compra_proveedor
  FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
  ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT fk_compra_usuario
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
  ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE detalle_venta
  ADD CONSTRAINT fk_detalle_venta_venta
  FOREIGN KEY (id_venta) REFERENCES venta(id_venta)
  ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT fk_detalle_venta_producto_talle
  FOREIGN KEY (id_producto, numero_calzado)
  REFERENCES producto_talle(id_producto, numero_calzado)
  ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE detalle_compra
  ADD CONSTRAINT fk_detalle_compra_compra
  FOREIGN KEY (id_compra) REFERENCES compra(id_compra)
  ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT fk_detalle_compra_producto_talle
  FOREIGN KEY (id_producto, numero_calzado)
  REFERENCES producto_talle(id_producto, numero_calzado)
  ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE pago_proveedor
  ADD CONSTRAINT fk_pago_proveedor_proveedor
  FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
  ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT fk_pago_proveedor_usuario
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
  ON DELETE RESTRICT ON UPDATE CASCADE;


-- ============================================================================
-- INDICES
-- No se duplican índices de PK, UNIQUE ni los usados por claves foráneas.
-- ============================================================================

USE gestion_zapateria;
CREATE INDEX idx_producto_marca_modelo ON producto(marca, modelo);
CREATE INDEX idx_producto_talle_stock ON producto_talle(stock);
CREATE INDEX idx_venta_fecha ON venta(fecha);
CREATE INDEX idx_compra_fecha ON compra(fecha);
CREATE INDEX idx_pago_proveedor_fecha ON pago_proveedor(fecha);
CREATE INDEX idx_usuario_rol_activo ON usuario(rol, activo);


-- ============================================================================
-- DISPARADORES (6 TRIGGERS)
-- 1: compra INSERT: Aumenta stock al ingresar un detalle de compra.
-- 2: compra UPDATE: Ajusta el stock si cambia cantidad o producto/talle.
-- 3: compra DELETE: Revierte el stock de un detalle de compra anulado.
-- 4: venta INSERT: Descuenta stock si hay disponible, sino da error.
-- 5: venta UPDATE: Ajusta stock al cambiar cantidad o producto/talle.
-- 6: venta DELETE: Devuelve al stock las unidades de una venta anulada.
-- ============================================================================

USE gestion_zapateria;
DELIMITER $$

-- [1] ALTA DE DETALLE_COMPRA
-- Al registrar unidades compradas, se suman al stock del producto y talle

CREATE TRIGGER trg_compra_insert
AFTER INSERT ON detalle_compra
FOR EACH ROW
BEGIN
    UPDATE producto_talle
       SET stock = stock + NEW.cantidad
     WHERE id_producto = NEW.id_producto
       AND numero_calzado = NEW.numero_calzado;
END$$

-- [2] MODIFICACION DE DETALLE_COMPRA
-- Si cambia la cantidad comprada:
--   - Si aumenta: suma la diferencia al stock.
--   - Si disminuye: descuenta la diferencia (controlando que el stock no quede negativo).
-- Si cambia el producto o talle:
--   - Resta las unidades del producto/talle anterior y las suma al nuevo.

CREATE TRIGGER trg_compra_update
AFTER UPDATE ON detalle_compra
FOR EACH ROW
BEGIN
    DECLARE stock_origen INT;
    DECLARE diferencia INT;

    -- Caso 1: Se modifica la cantidad del mismo producto y talle    
    IF OLD.id_producto = NEW.id_producto AND OLD.numero_calzado = NEW.numero_calzado THEN
        SET diferencia = NEW.cantidad - OLD.cantidad;

        SELECT stock INTO stock_origen
          FROM producto_talle
         WHERE id_producto = NEW.id_producto
           AND numero_calzado = NEW.numero_calzado;

        -- Si se reduce la compra (diferencia < 0), verificamos no dejar stock negativo
        IF (stock_origen + diferencia) < 0 THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Error: No se puede reducir la cantidad comprada porque el stock quedaría negativo';
        ELSE
            UPDATE producto_talle
               SET stock = stock + diferencia
             WHERE id_producto = NEW.id_producto
               AND numero_calzado = NEW.numero_calzado;
        END IF;

    -- Caso 2: Se modificó el producto o el talle comprado
    ELSE
        SELECT stock INTO stock_origen
          FROM producto_talle
         WHERE id_producto = OLD.id_producto
           AND numero_calzado = OLD.numero_calzado;

        IF stock_origen < OLD.cantidad THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Error: No hay suficiente stock para revertir la compra en el producto/talle anterior.';
        ELSE
            -- Quita del producto/talle viejo
            UPDATE producto_talle
               SET stock = stock - OLD.cantidad
             WHERE id_producto = OLD.id_producto
               AND numero_calzado = OLD.numero_calzado;

            -- Suma al nuevo producto/talle
            UPDATE producto_talle
               SET stock = stock + NEW.cantidad
             WHERE id_producto = NEW.id_producto
               AND numero_calzado = NEW.numero_calzado;
        END IF;
    END IF;
END$$

-- [3] BAJA DE DETALLE_COMPRA
-- Al anular un detalle de compra, se quitan del stock las unidades ingresadas.
-- La baja se rechaza si parte de esas unidades ya fue vendida

CREATE TRIGGER trg_compra_delete
AFTER DELETE ON detalle_compra
FOR EACH ROW
BEGIN
    UPDATE producto_talle
       SET stock = stock - OLD.cantidad
     WHERE id_producto = OLD.id_producto
       AND numero_calzado = OLD.numero_calzado
       AND stock >= OLD.cantidad;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT = 'Error: No se puede eliminar el detalle de compra porque el stock quedaría negativo';
    END IF;
END$$

-- [4] ALTA DE DETALLE_VENTA
-- Descuenta del stock solo si hay disponibilidad suficiente; si no alcanza, aborta la venta.

CREATE TRIGGER trg_venta_insert
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE stock_disponible INT;

    SELECT stock INTO stock_disponible
      FROM producto_talle
     WHERE id_producto = NEW.id_producto
       AND numero_calzado = NEW.numero_calzado;

    IF stock_disponible < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT = 'Error: Stock insuficiente para realizar la venta.';
    ELSE
        UPDATE producto_talle
           SET stock = stock - NEW.cantidad
         WHERE id_producto = NEW.id_producto
           AND numero_calzado = NEW.numero_calzado;
    END IF;
END$$

-- [5] MODIFICACION DE DETALLE_VENTA
-- Si cambia la cantidad vendida:
--   - Si aumenta la venta: resta la diferencia si hay stock suficiente.
--   - Si disminuye la venta: devuelve la diferencia al stock.
-- Si cambia el producto o talle:
--   - Verifica stock en el nuevo, devuelve lo del anterior y descuenta del nuevo.

CREATE TRIGGER trg_venta_update
AFTER UPDATE ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE stock_origen INT;
    DECLARE stock_destino INT;
    DECLARE diferencia INT;

    -- Caso 1: Se modifica la cantidad sobre el mismo producto y talle
    IF OLD.id_producto = NEW.id_producto AND OLD.numero_calzado = NEW.numero_calzado THEN
        SET diferencia = NEW.cantidad - OLD.cantidad;

        SELECT stock INTO stock_origen
          FROM producto_talle
         WHERE id_producto = NEW.id_producto
           AND numero_calzado = NEW.numero_calzado;

        -- Si se aumenta la cantidad vendida (diferencia > 0), comprobamos disponibilidad
        IF diferencia > 0 AND stock_origen < diferencia THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Error: Stock insuficiente para aumentar la cantidad de la venta.';
        ELSE
            UPDATE producto_talle
               SET stock = stock - diferencia
             WHERE id_producto = NEW.id_producto
               AND numero_calzado = NEW.numero_calzado;
        END IF;

    -- Caso 2: Se modificó el producto o el talle vendido
    ELSE
        SELECT stock INTO stock_destino
          FROM producto_talle
         WHERE id_producto = NEW.id_producto
           AND numero_calzado = NEW.numero_calzado;

        IF stock_destino < NEW.cantidad THEN
            SIGNAL SQLSTATE '45000'
              SET MESSAGE_TEXT = 'Error: Stock insuficiente para el nuevo producto o talle.';
        ELSE
            -- Devuelve el stock del producto/talle viejo
            UPDATE producto_talle
               SET stock = stock + OLD.cantidad
             WHERE id_producto = OLD.id_producto
               AND numero_calzado = OLD.numero_calzado;

            -- Descuenta del nuevo producto/talle
            UPDATE producto_talle
               SET stock = stock - NEW.cantidad
             WHERE id_producto = NEW.id_producto
               AND numero_calzado = NEW.numero_calzado;
        END IF;
    END IF;
END$$

-- [6] BAJA DE DETALLE_VENTA
-- Al anular un detalle de venta, se devuelven sus unidades al stock

CREATE TRIGGER trg_venta_delete
AFTER DELETE ON detalle_venta
FOR EACH ROW
BEGIN
    UPDATE producto_talle
       SET stock = stock + OLD.cantidad
     WHERE id_producto = OLD.id_producto
       AND numero_calzado = OLD.numero_calzado;
END$$

DELIMITER ;
