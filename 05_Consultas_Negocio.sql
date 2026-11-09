-- CONSULTAS NEGOCIO
-- Consultas comerciales, operativas y gerenciales

USE gestion_zapateria;

-- ----------------------------------
-- CONSULTAS DE INVENTARIO
-- ----------------------------------

-- Stock total por producto (sumando todos sus talles)
SELECT p.id_producto, p.marca, p.modelo, p.color, SUM(pt.stock) AS stock_total
FROM producto p
JOIN producto_talle pt ON p.id_producto = pt.id_producto
GROUP BY p.id_producto, p.marca, p.modelo, p.color;

-- Productos con stock crítico (por ejemplo, stock menor a 3 unidades por talle)
SELECT p.marca, p.modelo, p.color, pt.numero_calzado, pt.stock
FROM producto_talle pt
JOIN producto p ON pt.id_producto = p.id_producto
WHERE pt.stock < 3
ORDER BY pt.stock ASC;

-- Listado de talles disponibles para un modelo específico (ej. "Air Max Urban")
SELECT pt.numero_calzado, pt.stock
FROM producto_talle pt
JOIN producto p ON pt.id_producto = p.id_producto
WHERE p.modelo = 'Air Max Urban' AND pt.stock > 0;

-- Productos que nunca registraron ventas
SELECT
    p.id_producto,
    p.marca,
    p.modelo,
    p.color,
    COALESCE(SUM(pt.stock), 0) AS stock_actual
FROM producto p
LEFT JOIN detalle_venta dv ON p.id_producto = dv.id_producto
LEFT JOIN producto_talle pt ON p.id_producto = pt.id_producto
WHERE dv.id_producto IS NULL
GROUP BY p.id_producto, p.marca, p.modelo, p.color
ORDER BY stock_actual DESC;


-- ----------------------------------
-- CONSULTAS DE VENTAS Y FACTURACIÓN
-- ----------------------------------

-- Detalle completo de una venta (con subtotales por ítem)
SELECT 
    v.id_venta,
    v.fecha,
    u.nombre_usuario AS vendedor,
    p.marca,
    p.modelo,
    dt.numero_calzado,
    dt.cantidad,
    dt.precio_unitario_venta,
    (dt.cantidad * dt.precio_unitario_venta) AS subtotal
FROM venta v
JOIN usuario u ON v.id_usuario = u.id_usuario
JOIN detalle_venta dt ON v.id_venta = dt.id_venta
JOIN producto p ON dt.id_producto = p.id_producto
WHERE v.id_venta = 3; -- Reemplazar por el ID deseado

-- Cálculo del total de una venta aplicando su descuento
SELECT 
    v.id_venta,
    v.descuento AS porcentaje_descuento,
    ROUND(SUM(dt.cantidad * dt.precio_unitario_venta), 2) AS bruto,
    ROUND(
        SUM(dt.cantidad * dt.precio_unitario_venta)
        * (1 - v.descuento / 100),
        2
    ) AS total_con_descuento
FROM venta v
JOIN detalle_venta dt ON v.id_venta = dt.id_venta
WHERE v.id_venta = 3
GROUP BY v.id_venta, v.descuento;

-- Facturación mensual con descuentos aplicados
SELECT
    YEAR(v.fecha) AS anio,
    MONTH(v.fecha) AS mes,
    COUNT(DISTINCT v.id_venta) AS cantidad_ventas,
    ROUND(SUM(dv.cantidad * dv.precio_unitario_venta), 2) AS facturacion_bruta,
    ROUND(SUM(dv.cantidad * dv.precio_unitario_venta * (1 - v.descuento / 100)), 2) AS facturacion_neta
FROM venta v
JOIN detalle_venta dv ON v.id_venta = dv.id_venta
GROUP BY YEAR(v.fecha), MONTH(v.fecha)
ORDER BY anio DESC, mes DESC;


-- ----------------------------------------------
-- CONSULTAS DE ANÁLISIS Y RENDIMIENTO COMERCIAL
-- ----------------------------------------------
-- Top 5 productos más vendidos
SELECT p.marca, p.modelo, SUM(dt.cantidad) AS unidades_vendidas
FROM detalle_venta dt
JOIN producto p ON dt.id_producto = p.id_producto
GROUP BY p.id_producto, p.marca, p.modelo
ORDER BY unidades_vendidas DESC
LIMIT 5;

-- Ventas realizadas y facturación total por vendedor
SELECT
    u.nombre_usuario,
    u.rol,
    COUNT(v.id_venta) AS total_ventas_realizadas,
    ROUND(COALESCE(SUM(v.total_venta), 0), 2) AS total_facturado
FROM usuario u
LEFT JOIN (
    SELECT
        v.id_venta,
        v.id_usuario,
        SUM(dv.cantidad * dv.precio_unitario_venta)
            * (1 - v.descuento / 100) AS total_venta
    FROM venta v
    JOIN detalle_venta dv ON v.id_venta = dv.id_venta
    GROUP BY v.id_venta, v.id_usuario, v.descuento
) v ON u.id_usuario = v.id_usuario
WHERE u.rol = 'VENDEDOR'
GROUP BY u.id_usuario, u.nombre_usuario, u.rol
ORDER BY total_facturado DESC;

-- Rentabilidad estimada por producto
SELECT
    p.marca,
    p.modelo,
    p.color,
    SUM(dv.cantidad) AS unidades_vendidas,
    ROUND(SUM(dv.cantidad * dv.precio_unitario_venta * (1 - v.descuento / 100)), 2) AS ingresos_netos,
    ROUND(SUM(dv.cantidad) * COALESCE(c.costo_promedio, 0), 2) AS costo_estimado,
    ROUND(
        SUM(dv.cantidad * dv.precio_unitario_venta * (1 - v.descuento / 100))
        - SUM(dv.cantidad) * COALESCE(c.costo_promedio, 0), 2
    ) AS ganancia_estimada
FROM producto p
JOIN detalle_venta dv ON p.id_producto = dv.id_producto
JOIN venta v ON dv.id_venta = v.id_venta
LEFT JOIN (
    SELECT
        id_producto,
        SUM(cantidad * precio_unitario_compra) / SUM(cantidad) AS costo_promedio
    FROM detalle_compra
    GROUP BY id_producto
) c ON p.id_producto = c.id_producto
GROUP BY p.id_producto, p.marca, p.modelo, p.color, c.costo_promedio
ORDER BY ganancia_estimada DESC;

-- Cantidad vendida de un producto entre determinadas fechas
SELECT p.marca, p.modelo, p.color,
       SUM(dv.cantidad) AS unidades_vendidas
FROM producto p
JOIN detalle_venta dv ON p.id_producto = dv.id_producto
JOIN venta v ON dv.id_venta = v.id_venta
WHERE p.marca = 'Adidas'
  AND p.modelo = 'Cloud Comfort'
  AND v.fecha >= '2026-07-02'
  AND v.fecha < '2026-08-06'
GROUP BY p.id_producto, p.marca, p.modelo, p.color;

-- Categoría que genera mayor facturación
SELECT c.nombre AS categoria,
       SUM(dv.cantidad * dv.precio_unitario_venta * (1 - v.descuento / 100)) AS facturacion_neta
FROM categoria c
JOIN producto p ON p.id_categoria = c.id_categoria
JOIN detalle_venta dv ON dv.id_producto = p.id_producto
JOIN venta v ON v.id_venta = dv.id_venta
GROUP BY c.id_categoria, c.nombre
ORDER BY facturacion_neta DESC
LIMIT 1;

-- Productos sin ventas en los últimos 90 días
SELECT p.marca, p.modelo, p.color
FROM producto p
WHERE NOT EXISTS (
    SELECT 1
    FROM detalle_venta dv
    JOIN venta v ON v.id_venta = dv.id_venta
    WHERE dv.id_producto = p.id_producto
      AND v.fecha >= (
        SELECT MAX(fecha) 
        FROM venta
    ) - INTERVAL 90 DAY
)
ORDER BY p.marca, p.modelo;

-- Productos con stock elevado y pocas ventas
SELECT p.marca, p.modelo, p.color,
       COALESCE(s.stock_total, 0) AS stock_total,
       COALESCE(v.unidades_vendidas, 0) AS unidades_vendidas
FROM producto p
LEFT JOIN (
    SELECT id_producto, SUM(stock) AS stock_total
    FROM producto_talle
    GROUP BY id_producto
) s ON s.id_producto = p.id_producto
LEFT JOIN (
    SELECT dv.id_producto, SUM(dv.cantidad) AS unidades_vendidas
    FROM detalle_venta dv
    JOIN venta ve ON ve.id_venta = dv.id_venta
    WHERE ve.fecha >= CURDATE() - INTERVAL 90 DAY
    GROUP BY dv.id_producto
) v ON v.id_producto = p.id_producto
WHERE COALESCE(s.stock_total, 0) > 20
  AND COALESCE(v.unidades_vendidas, 0) < 5
ORDER BY stock_total DESC;


-- ----------------------------------------------
-- CONSULTAS DE COMPRAS Y PROVEEDORES
-- ----------------------------------------------
-- Estado de cuenta por proveedor
SELECT
    p.nombre AS proveedor,
    COALESCE(c.total_compras, 0) AS total_compras,
    COALESCE(pg.total_pagos, 0) AS total_pagos,
    COALESCE(c.total_compras, 0) - COALESCE(pg.total_pagos, 0) AS saldo_pendiente
FROM proveedor p
LEFT JOIN (
    SELECT
        c.id_proveedor,
        SUM(dc.cantidad * dc.precio_unitario_compra) AS total_compras
    FROM compra c
    JOIN detalle_compra dc ON c.id_compra = dc.id_compra
    GROUP BY c.id_proveedor
) c ON p.id_proveedor = c.id_proveedor
LEFT JOIN (
    SELECT
        id_proveedor,
        SUM(monto) AS total_pagos
    FROM pago_proveedor
    GROUP BY id_proveedor
) pg ON p.id_proveedor = pg.id_proveedor
ORDER BY saldo_pendiente DESC;

-- Compras mensuales por proveedor
SELECT
    YEAR(c.fecha) AS anio,
    MONTH(c.fecha) AS mes,
    p.nombre AS proveedor,
    COUNT(DISTINCT c.id_compra) AS cantidad_compras,
    SUM(dc.cantidad) AS unidades_compradas,
    ROUND(SUM(dc.cantidad * dc.precio_unitario_compra), 2) AS total_comprado
FROM compra c
JOIN proveedor p ON c.id_proveedor = p.id_proveedor
JOIN detalle_compra dc ON c.id_compra = dc.id_compra
GROUP BY YEAR(c.fecha), MONTH(c.fecha), p.id_proveedor, p.nombre
ORDER BY anio DESC, mes DESC, total_comprado DESC;


