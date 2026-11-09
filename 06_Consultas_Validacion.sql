
-- CONSULTAS DE VALIDACIÓN
-- Verificaciones de integridad de datos.
-- MySQL 8.0.16 o superior.
-- Ejecutar después de cargar los datos.
-- No modifica información.

USE gestion_zapateria;

-- ----------------------------------
-- VALIDACIONES DE INTEGRIDAD REFERENCIAL
-- ----------------------------------

-- V1: Detectar detalles de ventas o compras con producto y talle inexistentes.
-- Resultado esperado: cero filas.

SELECT 'venta' AS origen, d.id_detalle_venta AS id_detalle
FROM detalle_venta d
LEFT JOIN producto_talle pt
    ON pt.id_producto = d.id_producto
    AND pt.numero_calzado = d.numero_calzado
WHERE pt.id_producto IS NULL

UNION ALL

SELECT 'compra', d.id_detalle_compra
FROM detalle_compra d
LEFT JOIN producto_talle pt
    ON pt.id_producto = d.id_producto
    AND pt.numero_calzado = d.numero_calzado
WHERE pt.id_producto IS NULL;



-- ----------------------------------
-- VALIDACIONES DE INTEGRIDAD DE OPERACIONES
-- ----------------------------------

-- V2: Detectar ventas o compras sin detalles asociados.
-- Resultado esperado: cero filas al confirmar operaciones.

SELECT 'venta' AS tipo, v.id_venta AS id_operacion
FROM venta v
LEFT JOIN detalle_venta d ON d.id_venta = v.id_venta
WHERE d.id_detalle_venta IS NULL

UNION ALL

SELECT 'compra', c.id_compra
FROM compra c
LEFT JOIN detalle_compra d ON d.id_compra = c.id_compra
WHERE d.id_detalle_compra IS NULL;


-- V3: Detectar productos con stock negativo.
-- Resultado esperado: cero filas.

SELECT id_producto, numero_calzado, stock
FROM producto_talle
WHERE stock < 0;


-- V4: Detectar cantidades o precios inválidos.
-- Resultado esperado: cero filas.

SELECT 'venta' AS origen, id_detalle_venta AS id_detalle
FROM detalle_venta
WHERE cantidad <= 0 OR precio_unitario_venta <= 0

UNION ALL

SELECT 'compra', id_detalle_compra
FROM detalle_compra
WHERE cantidad <= 0 OR precio_unitario_compra <= 0;


-- V5: Detectar ventas con descuentos fuera del rango permitido.
-- Resultado esperado: cero filas.

SELECT id_venta, fecha, descuento
FROM venta
WHERE descuento < 0
   OR descuento > 100
   OR descuento IS NULL;