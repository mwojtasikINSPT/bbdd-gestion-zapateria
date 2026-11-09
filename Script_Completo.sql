-- SCRIPT PRINCIPAL DE CREACIÓN Y CARGA INICIAL
-- Incluye estructura, restricciones, triggers y datos maestros.
-- No incluye los datos operativos de demostración.
--
-- Orden recomendado si se usa este Script:
-- 1. SCRIPT_COMPLETO.sql
-- 2. 04_Datos_Operaciones.sql
-- 3. 05_Consultas_Negocio.sql
-- 4. 06_Consultas_Validacion.sql

-- ============================================================================
-- 01_Estructura.sql - TABLAS Y CLAVES PRIMARIAS
-- ============================================================================
-- ATENCION: ejecutarlo reconstruye la base gestion_zapateria y elimina sus datos.
DROP DATABASE IF EXISTS gestion_zapateria;
CREATE DATABASE gestion_zapateria CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE gestion_zapateria;

CREATE TABLE categoria (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    activa BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
) ;

CREATE TABLE producto (
    id_producto INT NOT NULL AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(80) NOT NULL,
    color VARCHAR(40) NOT NULL,
    precio_actual DECIMAL(12,2) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY (id_producto)
) ;

CREATE TABLE producto_talle (
    id_producto INT NOT NULL,
    numero_calzado DECIMAL(4,1) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    CONSTRAINT pk_producto_talle PRIMARY KEY (id_producto, numero_calzado)
) ;

CREATE TABLE usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasenia VARCHAR(255) NOT NULL,
    rol VARCHAR(20) NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario)
) ;

CREATE TABLE proveedor (
    id_proveedor INT NOT NULL AUTO_INCREMENT,
    cuit VARCHAR(13) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(30),
    ejecutivo_cuenta VARCHAR(100),
    nro_cuenta_bancaria VARCHAR(50),
    CONSTRAINT pk_proveedor PRIMARY KEY (id_proveedor)
) ;

-- Cada venta se cobra mediante un unico medio de pago.
CREATE TABLE venta (
    id_venta INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descuento DECIMAL(5,2) NOT NULL DEFAULT 0,
    medio_pago VARCHAR(25) NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT pk_venta PRIMARY KEY (id_venta)
) ;

-- Cada detalle tiene identificador propio y referencia a la venta y al producto+talle.
CREATE TABLE detalle_venta (
    id_detalle_venta INT NOT NULL AUTO_INCREMENT,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    numero_calzado DECIMAL(4,1) NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario_venta DECIMAL(12,2) NOT NULL,
    CONSTRAINT pk_detalle_venta PRIMARY KEY (id_detalle_venta)
) ;

CREATE TABLE compra (
    id_compra INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nro_comprobante VARCHAR(50),
    id_proveedor INT NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT pk_compra PRIMARY KEY (id_compra)
) ;

CREATE TABLE detalle_compra (
    id_detalle_compra INT NOT NULL AUTO_INCREMENT,
    id_compra INT NOT NULL,
    id_producto INT NOT NULL,
    numero_calzado DECIMAL(4,1) NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario_compra DECIMAL(12,2) NOT NULL,
    CONSTRAINT pk_detalle_compra PRIMARY KEY (id_detalle_compra)
) ;

CREATE TABLE pago_proveedor (
    id_pago INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    monto DECIMAL(12,2) NOT NULL,
    medio_pago VARCHAR(30) NOT NULL,
    id_proveedor INT NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT pk_pago_proveedor PRIMARY KEY (id_pago)
) ;


-- ============================================================================
-- RESTRICCIONES
-- ============================================================================
USE gestion_zapateria;

-- No permite nombres de categorías y usuarios duplicados;
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
-- medio_pago de VENTA corresponde al cobro de TODA la venta, no de cada detalle.
-- producto.activo utiliza BOOLEAN NOT NULL DEFAULT TRUE en la estructura.sql
ALTER TABLE producto
  ADD CONSTRAINT chk_producto_precio CHECK (precio_actual >= 0);
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
-- Al registrar unidades compradas, se suman al stock del producto y talle.
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
              SET MESSAGE_TEXT = 'Error: No se puede reducir la compra porque las unidades ya fueron vendidas.';
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
-- La baja se rechaza si parte de esas unidades ya fue vendida.
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
          SET MESSAGE_TEXT = 'Error: No se puede anular la compra porque las unidades ya fueron vendidas.';
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
-- Al anular un detalle de venta, se devuelven sus unidades al stock.
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


USE gestion_zapateria;

-- -----------------------------
-- CARGA CATEGORIAS
-- -----------------------------

INSERT INTO categoria (nombre, descripcion, activa) VALUES
('Zapatillas de hombre', 'Calzado deportivo masculino', TRUE),
('Zapatillas de dama', 'Calzado deportivo femenino', TRUE),
('Zapatos de dama', 'Calzado formal y de vestir femenino', TRUE),
('Botas de dama', 'Calzado de caña alta para mujer', TRUE),
('Botinetas', 'Calzado de caña corta para mujer', TRUE),
('Sandalias de niñas', 'Calzado abierto para verano', TRUE),
('Ojotas unisex', 'Calzado informal para playa y hogar', TRUE),
('Mocasines de hombre', 'Calzado sin cordones formal para hombre', TRUE),
('Pantuflas', 'Calzado de uso doméstico unisex', TRUE),
('Zapatos escolares', 'Calzado para uso escolar', TRUE),
('Calzado de seguridad', 'Calzado de protección laboral', TRUE),
('Zapatillas de niño', 'Calzado deportivo infantil masculino', TRUE),
('Zapatillas de niña', 'Calzado deportivo infantil femenino', TRUE);


-- -----------------------------
-- CARGA PRODUCTOS POR CATEGORIAS
-- -----------------------------

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('Nike', 'Air Max Urban', 'Negro', 85000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de hombre')),
('UrbanStep', 'Street Pro', 'Blanco', 62000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de hombre')),
('Adidas', 'Galaxy Run', 'Azul', 78000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de hombre')),
('Flexor', 'Sport Classic', 'Gris', 54000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de hombre')),
('Puma', 'Velocity X', 'Verde', 73000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de hombre'));

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('Flexor', 'Mocasín Clásico', 'Negro', 58000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Mocasines de hombre')),
('UrbanStep', 'Mocasín Urbano', 'Marrón', 62000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Mocasines de hombre')),
('Prüne', 'Mocasín Elegance', 'Negro', 98000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Mocasines de hombre')),
('PasoFirme', 'Mocasín Confort', 'Suela', 54000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Mocasines de hombre')),
('Flexor', 'Mocasín Clásico', 'Bordó', 58000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Mocasines de hombre')),
('NobleWalk', 'Mocasín Formal', 'Marrón', 75000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Mocasines de hombre'));

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('Adidas', 'Cloud Comfort', 'Blanco', 68000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de dama')),
('LunaStep', 'Urban Chic', 'Rosa', 52000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de dama')),
('Puma', 'Soft Move', 'Beige', 75000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de dama')),
('BellaWalk', 'Fashion Light', 'Negro', 49000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de dama')),
('BellaWalk', 'Fashion Light', 'Blanco', 49000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de dama')),
('Nike', 'Court Vision', 'Lila', 82000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de dama'));

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('Vizzano', 'Bota Elegance', 'Negro', 85000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botas de dama')),
('Vizzano', 'Bota Elegance', 'Marrón', 85000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botas de dama')),
('LunaStep', 'Bota Nevada', 'Beige', 72000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botas de dama')),
('LunaStep', 'Bota Nevada', 'Negro', 72000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botas de dama')),
('Prüne', 'Bota Urbana', 'Negro', 120000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botas de dama')),
('Prüne', 'Bota Urbana', 'Suela', 120000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botas de dama')),
('Via Marte', 'Bota Texana', 'Marrón', 98000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botas de dama')),
('Via Marte', 'Bota Texana', 'Negro', 98000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botas de dama')),
('BellaWalk', 'Bota Chelsea', 'Bordó', 76000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botas de dama')),
('BellaWalk', 'Bota Chelsea', 'Negro', 76000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botas de dama'));

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('Vizzano', 'Botineta Chelsea', 'Negro', 78000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botinetas')),
('Vizzano', 'Botineta Chelsea', 'Marrón', 78000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botinetas')),
('LunaStep', 'Botineta Urbana', 'Beige', 65000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botinetas')),
('BellaWalk', 'Botineta Clásica', 'Negro', 72000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botinetas')),
('Via Marte', 'Botineta Confort', 'Marrón', 85000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botinetas')),
('Prüne', 'Botineta Elegance', 'Beige', 115000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Botinetas'));

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('Vizzano', 'Stiletto Elegance', 'Negro', 68000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos de dama')),
('BellaWalk', 'Stiletto Clásico', 'Beige', 72000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos de dama')),
('Prüne', 'Zapato Oxford', 'Marrón', 95000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos de dama')),
('Via Marte', 'Zapato de Taco Bajo', 'Negro', 65000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos de dama')),
('LunaStep', 'Stiletto Suede', 'Bordó', 78000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos de dama'));

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('ColeKids', 'Slip On Escolar', 'Blanco', 38000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos escolares')),
('ColeKids', 'Deportivo Velcro', 'Blanco', 42000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos escolares')),
('ColeKids', 'Slip On Escolar', 'Negro', 38000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos escolares')),
('ColeKids', 'Deportivo Velcro', 'Negro', 42000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos escolares')),
('ColeKids', 'Guillermina Clásica', 'Negro', 36000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos escolares')),
('ColeKids', 'Guillermina Clásica', 'Marrón', 36000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos escolares')),
('ColeKids', 'Mocasín Escolar', 'Negro', 34000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos escolares')),
('ColeKids', 'Mocasín Escolar', 'Marrón', 34000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatos escolares'));

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('Nike', 'Star Runner', 'Rosa', 45000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niña')),
('Adidas', 'Runfalcon', 'Blanco', 52000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niña')),
('Puma', 'Smash V2', 'Lila', 48000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niña')),
('Topper', 'Tilly', 'Negro', 35000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niña')),
('Fila', 'Classic Kids', 'Celeste', 42000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niña'));

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('Nike', 'Star Runner', 'Azul', 45000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niño')),
('Adidas', 'Runfalcon', 'Negro', 52000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niño')),
('Puma', 'Smash V2', 'Rojo', 48000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niño')),
('Puma', 'Smash V2', 'Azul', 48000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niño')),
('Topper', 'Tilly', 'Gris', 35000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niño')),
('Fila', 'Classic Kids', 'Blanco', 42000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Zapatillas de niño'));

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('SafeStep', 'Worker Hombre', 'Negro', 85000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Calzado de seguridad')),
('SafeStep', 'Worker Dama', 'Negro', 82000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Calzado de seguridad')),
('ProtecShoes', 'Industrial Pro', 'Marrón', 95000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Calzado de seguridad')),
('ProtecShoes', 'Industrial Lady', 'Negro', 90000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Calzado de seguridad'));

INSERT INTO producto (marca, modelo, color, precio_actual, id_categoria) VALUES
('LunaKids', 'Sandalia Flor', 'Rosa', 28000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Sandalias de niñas')),
('LunaKids', 'Sandalia Flor', 'Blanco', 28000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Sandalias de niñas')),
('PequePasos', 'Sandalia Mariposa', 'Lila', 32000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Sandalias de niñas')),
('PequePasos', 'Sandalia Mariposa', 'Dorado', 32000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Sandalias de niñas')),
('MiniSol', 'Sandalia Verano', 'Rosa', 25000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Sandalias de niñas')),
('MiniSol', 'Sandalia Verano', 'Beige', 25000.00, (SELECT id_categoria FROM categoria WHERE nombre = 'Sandalias de niñas'));


-- ---------------------------------
-- CARGA STOCK
-- ---------------------------------
-- TODOS CON STOCK INICIAL ENTRE 1 Y 5

-- Zapatillas para niña: números 21 al 34
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 21 AS numero_calzado UNION ALL SELECT 22
    UNION ALL SELECT 23 UNION ALL SELECT 24
    UNION ALL SELECT 25 UNION ALL SELECT 26
    UNION ALL SELECT 27 UNION ALL SELECT 28
    UNION ALL SELECT 29 UNION ALL SELECT 30
    UNION ALL SELECT 31 UNION ALL SELECT 32
    UNION ALL SELECT 33 UNION ALL SELECT 34
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Zapatillas de niña';

-- Zapatillas para niño: números 21 al 34
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 21 AS numero_calzado UNION ALL SELECT 22
    UNION ALL SELECT 23 UNION ALL SELECT 24
    UNION ALL SELECT 25 UNION ALL SELECT 26
    UNION ALL SELECT 27 UNION ALL SELECT 28
    UNION ALL SELECT 29 UNION ALL SELECT 30
    UNION ALL SELECT 31 UNION ALL SELECT 32
    UNION ALL SELECT 33 UNION ALL SELECT 34
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Zapatillas de niño';

-- Zapatos escolares: números 21 al 40
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 21 AS numero_calzado UNION ALL SELECT 22
    UNION ALL SELECT 23 UNION ALL SELECT 24
    UNION ALL SELECT 25 UNION ALL SELECT 26
    UNION ALL SELECT 27 UNION ALL SELECT 28
    UNION ALL SELECT 29 UNION ALL SELECT 30
    UNION ALL SELECT 31 UNION ALL SELECT 32
    UNION ALL SELECT 33 UNION ALL SELECT 34
    UNION ALL SELECT 35 UNION ALL SELECT 36
    UNION ALL SELECT 37 UNION ALL SELECT 38
    UNION ALL SELECT 39 UNION ALL SELECT 40
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Zapatos escolares';

-- Zapatillas para hombre: número 35 al 45
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 35 AS numero_calzado UNION ALL SELECT 36
    UNION ALL SELECT 37 UNION ALL SELECT 38
    UNION ALL SELECT 39 UNION ALL SELECT 40
    UNION ALL SELECT 41 UNION ALL SELECT 42
    UNION ALL SELECT 43 UNION ALL SELECT 44
    UNION ALL SELECT 45
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Zapatillas de hombre';

-- Mocasines para hombre: número 35 al 45
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 35 AS numero_calzado UNION ALL SELECT 36
    UNION ALL SELECT 37 UNION ALL SELECT 38
    UNION ALL SELECT 39 UNION ALL SELECT 40
    UNION ALL SELECT 41 UNION ALL SELECT 42
    UNION ALL SELECT 43 UNION ALL SELECT 44
    UNION ALL SELECT 45
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Mocasines de hombre';

-- Zapatillas para dama: número 35 al 40
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 35 AS numero_calzado UNION ALL SELECT 36
    UNION ALL SELECT 37 UNION ALL SELECT 38
    UNION ALL SELECT 39 UNION ALL SELECT 40
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Zapatillas de dama';

-- Botas para dama: número 35 al 40
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 35 AS numero_calzado UNION ALL SELECT 36
    UNION ALL SELECT 37 UNION ALL SELECT 38
    UNION ALL SELECT 39 UNION ALL SELECT 40
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Botas de dama';

-- Botinetas para dama: número 35 al 40
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 35 AS numero_calzado UNION ALL SELECT 36
    UNION ALL SELECT 37 UNION ALL SELECT 38
    UNION ALL SELECT 39 UNION ALL SELECT 40
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Botinetas';

-- Zapatos para dama: número 35 al 40
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 35 AS numero_calzado UNION ALL SELECT 36
    UNION ALL SELECT 37 UNION ALL SELECT 38
    UNION ALL SELECT 39 UNION ALL SELECT 40
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Zapatos de dama';

-- Calzado de seguridad para hombre: numeros 39 al 45
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 39 AS numero_calzado UNION ALL SELECT 40
    UNION ALL SELECT 41 UNION ALL SELECT 42
    UNION ALL SELECT 43 UNION ALL SELECT 44
    UNION ALL SELECT 45
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Calzado de seguridad'
  AND p.modelo IN ('Worker Hombre', 'Industrial Pro');

-- Calzado de seguridad para dama: numeros 35 al 40
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 35 AS numero_calzado UNION ALL SELECT 36
    UNION ALL SELECT 37 UNION ALL SELECT 38
    UNION ALL SELECT 39 UNION ALL SELECT 40
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Calzado de seguridad'
  AND p.modelo IN ('Worker Dama', 'Industrial Lady');
  
  -- Sandalias de niñas: numeros 21 al 34
INSERT INTO producto_talle (id_producto, numero_calzado, stock)
SELECT p.id_producto, t.numero_calzado, (1 + MOD(p.id_producto * 7 + t.numero_calzado * 3, 5))
FROM producto p
CROSS JOIN (
    SELECT 21 AS numero_calzado UNION ALL SELECT 22
    UNION ALL SELECT 23 UNION ALL SELECT 24
    UNION ALL SELECT 25 UNION ALL SELECT 26
    UNION ALL SELECT 27 UNION ALL SELECT 28
    UNION ALL SELECT 29 UNION ALL SELECT 30
    UNION ALL SELECT 31 UNION ALL SELECT 32
    UNION ALL SELECT 33 UNION ALL SELECT 34
) t
JOIN categoria c ON c.id_categoria = p.id_categoria
WHERE c.nombre = 'Sandalias de niñas';

