-- DATOS DE OPERACIONES: 100 COMPRAS, 400 VENTAS Y 30 PAGOS
USE gestion_zapateria;
START TRANSACTION;

-- ==================== USUARIOS Y PROVEEDORES ====================
INSERT INTO usuario (nombre_usuario, contrasenia, rol, activo) VALUES
('admin_operaciones', 'Lionel Scaloni', 'ADMINISTRADOR', TRUE),
('mili_ventas', 'demo_mili', 'VENDEDOR', TRUE),
('migue_ventas', 'demo_migue', 'VENDEDOR', TRUE),
('marce_ventas', 'demo_marce', 'VENDEDOR', TRUE),
('profe_ventas', 'demo_profe', 'VENDEDOR', TRUE);

INSERT INTO proveedor (cuit, nombre, telefono, ejecutivo_cuenta, nro_cuenta_bancaria) VALUES
('30-71000001-1', 'Distribuidora Andina', '11-4100-1001', 'Leo Messi', '072000010000000001'),
('30-71000002-2', 'Calzados del Centro', '11-4100-1002', 'Lautaro Martinez', '072000020000000002'),
('30-71000003-3', 'Importadora Paso Firme', '11-4100-1003', 'Dibu Martinez', '072000030000000003'),
('30-71000004-4', 'Mayorista Sur', '11-4100-1004', 'Nico Paz', '072000040000000004'),
('30-71000005-5', 'Proveedora Infantil Sol', '11-4100-1005', 'Giuliano Simeone', '072000050000000005');

-- ==================== COMPRAS ====================
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-01 08:00:00', 'COMP-0001', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 33, 35.0, 2, 64400.00),
(@id_compra, 14, 35.0, 3, 42750.00),
(@id_compra, 32, 35.0, 4, 49300.00),
(@id_compra, 27, 35.0, 5, 44840.00),
(@id_compra, 17, 35.0, 6, 45920.00),
(@id_compra, 21, 35.0, 2, 41040.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-01 15:00:00', 'COMP-0002', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 16, 35.0, 3, 27930.00),
(@id_compra, 21, 36.0, 4, 41760.00),
(@id_compra, 34, 35.0, 5, 40120.00),
(@id_compra, 31, 35.0, 6, 40320.00),
(@id_compra, 12, 35.0, 2, 38760.00),
(@id_compra, 26, 35.0, 3, 44080.00),
(@id_compra, 32, 36.0, 4, 50150.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-01 22:00:00', 'COMP-0003', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 28, 35.0, 4, 45240.00),
(@id_compra, 35, 35.0, 5, 42480.00),
(@id_compra, 60, 39.0, 6, 53200.00),
(@id_compra, 24, 35.0, 2, 55860.00),
(@id_compra, 13, 35.0, 3, 30160.00),
(@id_compra, 25, 35.0, 4, 57820.00),
(@id_compra, 26, 36.0, 5, 42560.00),
(@id_compra, 27, 36.0, 6, 43320.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-02 05:00:00', 'COMP-0004', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 20, 35.0, 5, 42480.00),
(@id_compra, 64, 21.0, 6, 17920.00),
(@id_compra, 53, 21.0, 2, 29640.00),
(@id_compra, 63, 21.0, 3, 16240.00),
(@id_compra, 4, 35.0, 4, 31860.00),
(@id_compra, 14, 36.0, 5, 42000.00),
(@id_compra, 18, 35.0, 6, 48450.00),
(@id_compra, 6, 35.0, 2, 33640.00),
(@id_compra, 30, 35.0, 3, 38350.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-02 12:00:00', 'COMP-0005', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 31, 36.0, 6, 40320.00),
(@id_compra, 24, 36.0, 2, 55860.00),
(@id_compra, 33, 36.0, 3, 66700.00),
(@id_compra, 38, 35.0, 4, 46020.00),
(@id_compra, 63, 22.0, 5, 15680.00),
(@id_compra, 26, 37.0, 6, 43320.00),
(@id_compra, 65, 21.0, 2, 18560.00),
(@id_compra, 27, 37.0, 3, 44840.00),
(@id_compra, 21, 37.0, 4, 40320.00),
(@id_compra, 43, 21.0, 5, 20520.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-02 19:00:00', 'COMP-0006', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 29, 35.0, 2, 44460.00),
(@id_compra, 17, 36.0, 3, 47560.00),
(@id_compra, 34, 36.0, 4, 40120.00),
(@id_compra, 19, 35.0, 5, 47600.00),
(@id_compra, 16, 36.0, 6, 27930.00),
(@id_compra, 3, 35.0, 2, 45240.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-03 02:00:00', 'COMP-0007', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 15, 35.0, 3, 28420.00),
(@id_compra, 29, 36.0, 4, 46020.00),
(@id_compra, 22, 35.0, 5, 67200.00),
(@id_compra, 50, 21.0, 6, 19950.00),
(@id_compra, 36, 35.0, 2, 55100.00),
(@id_compra, 17, 37.0, 3, 48380.00),
(@id_compra, 64, 22.0, 4, 17920.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-03 09:00:00', 'COMP-0008', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 25, 36.0, 4, 57820.00),
(@id_compra, 46, 21.0, 5, 19040.00),
(@id_compra, 32, 37.0, 6, 48450.00),
(@id_compra, 30, 36.0, 2, 37700.00),
(@id_compra, 53, 22.0, 3, 30680.00),
(@id_compra, 28, 36.0, 4, 43680.00),
(@id_compra, 60, 40.0, 5, 54150.00),
(@id_compra, 67, 21.0, 6, 14500.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-03 16:00:00', 'COMP-0009', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 61, 35.0, 5, 50400.00),
(@id_compra, 13, 36.0, 6, 29640.00),
(@id_compra, 62, 21.0, 2, 16240.00),
(@id_compra, 49, 21.0, 3, 28320.00),
(@id_compra, 6, 36.0, 4, 32480.00),
(@id_compra, 17, 38.0, 5, 46740.00),
(@id_compra, 32, 38.0, 6, 49300.00),
(@id_compra, 38, 36.0, 2, 46020.00),
(@id_compra, 15, 36.0, 3, 27440.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-03 23:00:00', 'COMP-0010', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 16, 37.0, 6, 27930.00),
(@id_compra, 31, 37.0, 2, 41760.00),
(@id_compra, 12, 36.0, 3, 40120.00),
(@id_compra, 35, 36.0, 4, 40320.00),
(@id_compra, 22, 36.0, 5, 68400.00),
(@id_compra, 20, 36.0, 6, 41760.00),
(@id_compra, 18, 36.0, 2, 50150.00),
(@id_compra, 45, 21.0, 3, 19040.00),
(@id_compra, 5, 35.0, 4, 41610.00),
(@id_compra, 57, 21.0, 5, 24360.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-04 06:00:00', 'COMP-0011', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 20, 37.0, 2, 41760.00),
(@id_compra, 16, 38.0, 3, 28910.00),
(@id_compra, 22, 37.0, 4, 67200.00),
(@id_compra, 15, 37.0, 5, 27930.00),
(@id_compra, 12, 37.0, 6, 39440.00),
(@id_compra, 24, 37.0, 2, 57820.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-04 13:00:00', 'COMP-0012', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 33, 37.0, 3, 67850.00),
(@id_compra, 22, 38.0, 4, 67200.00),
(@id_compra, 36, 36.0, 5, 54150.00),
(@id_compra, 51, 21.0, 6, 24360.00),
(@id_compra, 62, 22.0, 2, 16520.00),
(@id_compra, 4, 36.0, 3, 30240.00),
(@id_compra, 12, 38.0, 4, 38760.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-04 20:00:00', 'COMP-0013', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 34, 37.0, 4, 38080.00),
(@id_compra, 45, 22.0, 5, 19380.00),
(@id_compra, 22, 39.0, 6, 69600.00),
(@id_compra, 3, 36.0, 2, 46020.00),
(@id_compra, 29, 37.0, 3, 43680.00),
(@id_compra, 30, 37.0, 4, 37050.00),
(@id_compra, 12, 39.0, 5, 39440.00),
(@id_compra, 56, 21.0, 6, 20650.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-05 03:00:00', 'COMP-0014', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 39, 21.0, 5, 21660.00),
(@id_compra, 25, 37.0, 6, 56840.00),
(@id_compra, 14, 37.0, 2, 44250.00),
(@id_compra, 54, 21.0, 3, 26880.00),
(@id_compra, 38, 37.0, 4, 44460.00),
(@id_compra, 22, 40.0, 5, 69600.00),
(@id_compra, 18, 37.0, 6, 50150.00),
(@id_compra, 32, 39.0, 2, 47600.00),
(@id_compra, 40, 21.0, 3, 23940.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-05 10:00:00', 'COMP-0015', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 40, 22.0, 6, 24360.00),
(@id_compra, 14, 38.0, 2, 44250.00),
(@id_compra, 42, 21.0, 3, 23520.00),
(@id_compra, 28, 37.0, 4, 44460.00),
(@id_compra, 33, 38.0, 5, 66700.00),
(@id_compra, 20, 38.0, 6, 42480.00),
(@id_compra, 26, 38.0, 2, 42560.00),
(@id_compra, 37, 35.0, 3, 37050.00),
(@id_compra, 19, 36.0, 4, 49300.00),
(@id_compra, 62, 23.0, 5, 16520.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-05 17:00:00', 'COMP-0016', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 50, 22.0, 2, 20650.00),
(@id_compra, 1, 35.0, 3, 47600.00),
(@id_compra, 25, 38.0, 4, 55860.00),
(@id_compra, 49, 22.0, 5, 27840.00),
(@id_compra, 12, 40.0, 6, 40120.00),
(@id_compra, 31, 38.0, 2, 40320.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-06 00:00:00', 'COMP-0017', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 54, 22.0, 3, 26880.00),
(@id_compra, 44, 21.0, 4, 20520.00),
(@id_compra, 65, 22.0, 5, 18560.00),
(@id_compra, 67, 22.0, 6, 14750.00),
(@id_compra, 28, 38.0, 2, 43680.00),
(@id_compra, 7, 35.0, 3, 35340.00),
(@id_compra, 51, 22.0, 4, 24360.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-06 07:00:00', 'COMP-0018', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 19, 37.0, 4, 48450.00),
(@id_compra, 26, 39.0, 5, 44080.00),
(@id_compra, 67, 23.0, 6, 14750.00),
(@id_compra, 35, 37.0, 2, 40320.00),
(@id_compra, 36, 37.0, 3, 54150.00),
(@id_compra, 34, 38.0, 4, 39440.00),
(@id_compra, 27, 38.0, 5, 44840.00),
(@id_compra, 24, 38.0, 6, 54880.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-06 14:00:00', 'COMP-0019', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 37, 36.0, 5, 37700.00),
(@id_compra, 20, 39.0, 6, 42480.00),
(@id_compra, 13, 37.0, 2, 29120.00),
(@id_compra, 50, 23.0, 3, 19950.00),
(@id_compra, 12, 35.0, 4, 39440.00),
(@id_compra, 30, 38.0, 5, 38350.00),
(@id_compra, 33, 39.0, 6, 64400.00),
(@id_compra, 14, 39.0, 2, 42750.00),
(@id_compra, 18, 38.0, 3, 49300.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-06 21:00:00', 'COMP-0020', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 33, 40.0, 6, 67850.00),
(@id_compra, 14, 40.0, 2, 42000.00),
(@id_compra, 35, 38.0, 3, 41040.00),
(@id_compra, 56, 22.0, 4, 20300.00),
(@id_compra, 32, 40.0, 5, 50150.00),
(@id_compra, 12, 36.0, 6, 38080.00),
(@id_compra, 50, 24.0, 2, 19950.00),
(@id_compra, 30, 39.0, 3, 37700.00),
(@id_compra, 45, 23.0, 4, 20060.00),
(@id_compra, 47, 21.0, 5, 25200.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-07 04:00:00', 'COMP-0021', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 50, 25.0, 2, 19600.00),
(@id_compra, 64, 23.0, 3, 18240.00),
(@id_compra, 66, 21.0, 4, 14500.00),
(@id_compra, 46, 22.0, 5, 20060.00),
(@id_compra, 1, 36.0, 6, 47600.00),
(@id_compra, 36, 38.0, 2, 54150.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-07 11:00:00', 'COMP-0022', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 28, 39.0, 3, 44460.00),
(@id_compra, 53, 23.0, 4, 30160.00),
(@id_compra, 37, 37.0, 5, 38350.00),
(@id_compra, 32, 35.0, 6, 47600.00),
(@id_compra, 13, 38.0, 2, 29640.00),
(@id_compra, 25, 39.0, 3, 56840.00),
(@id_compra, 65, 23.0, 4, 18880.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-07 18:00:00', 'COMP-0023', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 17, 39.0, 4, 47560.00),
(@id_compra, 14, 35.0, 5, 44250.00),
(@id_compra, 16, 39.0, 6, 27440.00),
(@id_compra, 22, 35.0, 2, 68400.00),
(@id_compra, 38, 38.0, 3, 45240.00),
(@id_compra, 8, 35.0, 4, 57820.00),
(@id_compra, 49, 23.0, 5, 26880.00),
(@id_compra, 30, 40.0, 6, 37050.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-08 01:00:00', 'COMP-0024', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 39, 22.0, 5, 22420.00),
(@id_compra, 59, 35.0, 6, 45920.00),
(@id_compra, 41, 21.0, 2, 21660.00),
(@id_compra, 40, 23.0, 3, 24360.00),
(@id_compra, 49, 24.0, 4, 28320.00),
(@id_compra, 56, 23.0, 5, 19600.00),
(@id_compra, 15, 38.0, 6, 27930.00),
(@id_compra, 12, 37.0, 2, 39440.00),
(@id_compra, 45, 24.0, 3, 20060.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-08 08:00:00', 'COMP-0025', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 1, 37.0, 6, 47600.00),
(@id_compra, 20, 40.0, 2, 41040.00),
(@id_compra, 13, 39.0, 3, 30160.00),
(@id_compra, 62, 24.0, 4, 16520.00),
(@id_compra, 10, 35.0, 5, 32480.00),
(@id_compra, 15, 39.0, 6, 27930.00),
(@id_compra, 18, 39.0, 2, 49300.00),
(@id_compra, 26, 40.0, 3, 44840.00),
(@id_compra, 64, 24.0, 4, 17920.00),
(@id_compra, 17, 40.0, 5, 46740.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-08 15:00:00', 'COMP-0026', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 10, 36.0, 2, 33060.00),
(@id_compra, 34, 39.0, 3, 39440.00),
(@id_compra, 16, 40.0, 4, 28910.00),
(@id_compra, 38, 39.0, 5, 43680.00),
(@id_compra, 18, 40.0, 6, 48450.00),
(@id_compra, 57, 22.0, 2, 24360.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-08 22:00:00', 'COMP-0027', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 21, 38.0, 3, 41760.00),
(@id_compra, 51, 23.0, 4, 24780.00),
(@id_compra, 37, 38.0, 5, 36400.00),
(@id_compra, 12, 38.0, 6, 38760.00),
(@id_compra, 32, 36.0, 2, 49300.00),
(@id_compra, 27, 39.0, 3, 44840.00),
(@id_compra, 45, 25.0, 4, 19040.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-09 05:00:00', 'COMP-0028', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 64, 25.0, 4, 18880.00),
(@id_compra, 34, 40.0, 5, 38080.00),
(@id_compra, 12, 39.0, 6, 38760.00),
(@id_compra, 65, 24.0, 2, 18560.00),
(@id_compra, 67, 24.0, 3, 14750.00),
(@id_compra, 38, 40.0, 4, 43680.00),
(@id_compra, 28, 40.0, 5, 44460.00),
(@id_compra, 52, 21.0, 6, 26100.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-09 12:00:00', 'COMP-0029', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 33, 35.0, 5, 64400.00),
(@id_compra, 16, 35.0, 6, 27930.00),
(@id_compra, 34, 35.0, 2, 39440.00),
(@id_compra, 51, 24.0, 3, 24780.00),
(@id_compra, 43, 22.0, 4, 20160.00),
(@id_compra, 40, 24.0, 5, 23940.00),
(@id_compra, 18, 35.0, 6, 49300.00),
(@id_compra, 23, 35.0, 2, 70800.00),
(@id_compra, 21, 39.0, 3, 40320.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-09 19:00:00', 'COMP-0030', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 37, 39.0, 6, 37050.00),
(@id_compra, 45, 26.0, 2, 19720.00),
(@id_compra, 4, 37.0, 3, 31860.00),
(@id_compra, 53, 24.0, 4, 29120.00),
(@id_compra, 35, 39.0, 5, 41040.00),
(@id_compra, 67, 25.0, 6, 14500.00),
(@id_compra, 24, 39.0, 2, 57820.00),
(@id_compra, 28, 35.0, 3, 43680.00),
(@id_compra, 22, 36.0, 4, 68400.00),
(@id_compra, 57, 23.0, 5, 24360.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-10 02:00:00', 'COMP-0031', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 15, 40.0, 2, 28420.00),
(@id_compra, 35, 40.0, 3, 42480.00),
(@id_compra, 25, 40.0, 4, 54880.00),
(@id_compra, 18, 36.0, 5, 48450.00),
(@id_compra, 39, 23.0, 6, 22040.00),
(@id_compra, 46, 23.0, 2, 20060.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-10 09:00:00', 'COMP-0032', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 44, 22.0, 3, 21240.00),
(@id_compra, 48, 21.0, 4, 29120.00),
(@id_compra, 13, 40.0, 5, 29640.00),
(@id_compra, 54, 23.0, 6, 27840.00),
(@id_compra, 3, 37.0, 2, 46020.00),
(@id_compra, 64, 26.0, 3, 17920.00),
(@id_compra, 30, 35.0, 4, 37050.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-10 16:00:00', 'COMP-0033', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 24, 40.0, 4, 54880.00),
(@id_compra, 13, 35.0, 5, 29640.00),
(@id_compra, 28, 36.0, 6, 45240.00),
(@id_compra, 67, 26.0, 2, 14750.00),
(@id_compra, 41, 22.0, 3, 21280.00),
(@id_compra, 33, 36.0, 4, 65550.00),
(@id_compra, 30, 36.0, 5, 37700.00),
(@id_compra, 37, 40.0, 6, 38350.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-10 23:00:00', 'COMP-0034', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 16, 36.0, 5, 27930.00),
(@id_compra, 25, 35.0, 6, 56840.00),
(@id_compra, 31, 39.0, 2, 42480.00),
(@id_compra, 49, 25.0, 3, 26880.00),
(@id_compra, 35, 35.0, 4, 41040.00),
(@id_compra, 24, 35.0, 5, 56840.00),
(@id_compra, 27, 40.0, 6, 44840.00),
(@id_compra, 54, 24.0, 2, 26880.00),
(@id_compra, 64, 27.0, 3, 18240.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-11 06:00:00', 'COMP-0035', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 36, 39.0, 6, 55100.00),
(@id_compra, 26, 35.0, 2, 44840.00),
(@id_compra, 18, 37.0, 3, 47600.00),
(@id_compra, 17, 35.0, 4, 46740.00),
(@id_compra, 12, 40.0, 5, 39440.00),
(@id_compra, 48, 22.0, 6, 30680.00),
(@id_compra, 25, 36.0, 2, 54880.00),
(@id_compra, 39, 24.0, 3, 21660.00),
(@id_compra, 6, 37.0, 4, 33640.00),
(@id_compra, 27, 35.0, 5, 44840.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-11 13:00:00', 'COMP-0036', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 34, 36.0, 2, 40120.00),
(@id_compra, 32, 37.0, 3, 47600.00),
(@id_compra, 16, 37.0, 4, 27930.00),
(@id_compra, 22, 37.0, 5, 69600.00),
(@id_compra, 24, 36.0, 6, 57820.00),
(@id_compra, 43, 23.0, 2, 20160.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-11 20:00:00', 'COMP-0037', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 42, 22.0, 3, 23520.00),
(@id_compra, 16, 38.0, 4, 27930.00),
(@id_compra, 17, 36.0, 5, 47560.00),
(@id_compra, 25, 37.0, 6, 57820.00),
(@id_compra, 3, 38.0, 2, 43680.00),
(@id_compra, 45, 27.0, 3, 19380.00),
(@id_compra, 33, 37.0, 4, 66700.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-12 03:00:00', 'COMP-0038', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 58, 39.0, 4, 48450.00),
(@id_compra, 15, 35.0, 5, 28420.00),
(@id_compra, 33, 38.0, 6, 67850.00),
(@id_compra, 55, 21.0, 2, 26880.00),
(@id_compra, 16, 39.0, 3, 27930.00),
(@id_compra, 21, 40.0, 4, 41760.00),
(@id_compra, 29, 38.0, 5, 46020.00),
(@id_compra, 38, 35.0, 6, 43680.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-12 10:00:00', 'COMP-0039', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 19, 38.0, 5, 49300.00),
(@id_compra, 40, 25.0, 6, 24780.00),
(@id_compra, 15, 36.0, 2, 27440.00),
(@id_compra, 56, 24.0, 3, 19950.00),
(@id_compra, 24, 37.0, 4, 56840.00),
(@id_compra, 46, 24.0, 5, 20060.00),
(@id_compra, 13, 36.0, 6, 29120.00),
(@id_compra, 34, 37.0, 2, 38760.00),
(@id_compra, 51, 25.0, 3, 24360.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-12 17:00:00', 'COMP-0040', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 21, 35.0, 6, 42480.00),
(@id_compra, 14, 36.0, 2, 42000.00),
(@id_compra, 7, 36.0, 3, 35340.00),
(@id_compra, 32, 38.0, 4, 49300.00),
(@id_compra, 19, 39.0, 5, 50150.00),
(@id_compra, 33, 39.0, 6, 64400.00),
(@id_compra, 56, 25.0, 2, 19950.00),
(@id_compra, 38, 36.0, 3, 45240.00),
(@id_compra, 42, 23.0, 4, 24780.00),
(@id_compra, 46, 25.0, 5, 19040.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-13 00:00:00', 'COMP-0041', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 32, 39.0, 2, 47600.00),
(@id_compra, 21, 36.0, 3, 41040.00),
(@id_compra, 66, 22.0, 4, 14500.00),
(@id_compra, 17, 37.0, 5, 48380.00),
(@id_compra, 49, 26.0, 6, 26880.00),
(@id_compra, 23, 36.0, 2, 68400.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-13 07:00:00', 'COMP-0042', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 43, 24.0, 3, 20520.00),
(@id_compra, 16, 40.0, 4, 28420.00),
(@id_compra, 12, 35.0, 5, 40120.00),
(@id_compra, 4, 38.0, 6, 30240.00),
(@id_compra, 27, 36.0, 2, 43320.00),
(@id_compra, 53, 25.0, 3, 30160.00),
(@id_compra, 14, 37.0, 4, 44250.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-13 14:00:00', 'COMP-0043', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 56, 26.0, 4, 20300.00),
(@id_compra, 54, 25.0, 5, 28320.00),
(@id_compra, 4, 39.0, 6, 30240.00),
(@id_compra, 26, 36.0, 2, 43320.00),
(@id_compra, 35, 36.0, 3, 41760.00),
(@id_compra, 15, 37.0, 4, 28910.00),
(@id_compra, 6, 38.0, 5, 32480.00),
(@id_compra, 21, 37.0, 6, 41040.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-13 21:00:00', 'COMP-0044', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 20, 35.0, 5, 42480.00),
(@id_compra, 32, 40.0, 6, 47600.00),
(@id_compra, 17, 38.0, 2, 46740.00),
(@id_compra, 24, 38.0, 3, 56840.00),
(@id_compra, 1, 38.0, 4, 50150.00),
(@id_compra, 26, 37.0, 5, 42560.00),
(@id_compra, 64, 28.0, 6, 18240.00),
(@id_compra, 48, 23.0, 2, 30160.00),
(@id_compra, 37, 35.0, 3, 38350.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-14 04:00:00', 'COMP-0045', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 38, 37.0, 6, 43680.00),
(@id_compra, 40, 26.0, 2, 23940.00),
(@id_compra, 54, 26.0, 3, 27840.00),
(@id_compra, 36, 40.0, 4, 56050.00),
(@id_compra, 34, 38.0, 5, 38080.00),
(@id_compra, 31, 40.0, 6, 41040.00),
(@id_compra, 15, 38.0, 2, 28420.00),
(@id_compra, 24, 39.0, 3, 57820.00),
(@id_compra, 66, 23.0, 4, 14000.00),
(@id_compra, 46, 26.0, 5, 19380.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-14 11:00:00', 'COMP-0046', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 15, 39.0, 2, 27930.00),
(@id_compra, 35, 37.0, 3, 41760.00),
(@id_compra, 40, 27.0, 4, 24780.00),
(@id_compra, 28, 37.0, 5, 43680.00),
(@id_compra, 32, 35.0, 6, 48450.00),
(@id_compra, 46, 27.0, 2, 19720.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-14 18:00:00', 'COMP-0047', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 64, 29.0, 3, 18560.00),
(@id_compra, 57, 24.0, 4, 24780.00),
(@id_compra, 29, 39.0, 5, 43680.00),
(@id_compra, 14, 38.0, 6, 42750.00),
(@id_compra, 17, 39.0, 2, 47560.00),
(@id_compra, 30, 37.0, 3, 38350.00),
(@id_compra, 8, 36.0, 4, 54880.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-15 01:00:00', 'COMP-0048', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 29, 40.0, 4, 46020.00),
(@id_compra, 6, 39.0, 5, 32480.00),
(@id_compra, 17, 40.0, 6, 46740.00),
(@id_compra, 34, 39.0, 2, 39440.00),
(@id_compra, 35, 38.0, 3, 42480.00),
(@id_compra, 14, 39.0, 4, 42000.00),
(@id_compra, 49, 27.0, 5, 27360.00),
(@id_compra, 18, 38.0, 6, 49300.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-15 08:00:00', 'COMP-0049', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 62, 25.0, 5, 15680.00),
(@id_compra, 32, 36.0, 6, 48450.00),
(@id_compra, 64, 30.0, 2, 18560.00),
(@id_compra, 54, 27.0, 3, 28320.00),
(@id_compra, 12, 36.0, 4, 38080.00),
(@id_compra, 10, 37.0, 5, 33060.00),
(@id_compra, 13, 37.0, 6, 30160.00),
(@id_compra, 31, 35.0, 2, 42480.00),
(@id_compra, 47, 22.0, 3, 25200.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-15 15:00:00', 'COMP-0050', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 34, 40.0, 6, 38760.00),
(@id_compra, 18, 39.0, 2, 49300.00),
(@id_compra, 23, 37.0, 3, 70800.00),
(@id_compra, 29, 35.0, 4, 43680.00),
(@id_compra, 31, 36.0, 5, 41040.00),
(@id_compra, 27, 37.0, 6, 44080.00),
(@id_compra, 1, 39.0, 2, 50150.00),
(@id_compra, 32, 37.0, 3, 47600.00),
(@id_compra, 62, 26.0, 4, 15960.00),
(@id_compra, 54, 28.0, 5, 27840.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-15 22:00:00', 'COMP-0051', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 4, 40.0, 2, 31320.00),
(@id_compra, 30, 38.0, 3, 38350.00),
(@id_compra, 65, 25.0, 4, 17920.00),
(@id_compra, 33, 40.0, 5, 65550.00),
(@id_compra, 16, 35.0, 6, 28420.00),
(@id_compra, 23, 38.0, 2, 70800.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-16 05:00:00', 'COMP-0052', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 49, 28.0, 3, 28320.00),
(@id_compra, 29, 36.0, 4, 43680.00),
(@id_compra, 33, 35.0, 5, 65550.00),
(@id_compra, 54, 29.0, 6, 27840.00),
(@id_compra, 14, 40.0, 2, 44250.00),
(@id_compra, 30, 39.0, 3, 36400.00),
(@id_compra, 66, 24.0, 4, 14250.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-16 12:00:00', 'COMP-0053', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 14, 35.0, 4, 42000.00),
(@id_compra, 21, 38.0, 5, 41040.00),
(@id_compra, 5, 36.0, 6, 42340.00),
(@id_compra, 62, 27.0, 2, 16520.00),
(@id_compra, 33, 36.0, 3, 64400.00),
(@id_compra, 12, 37.0, 4, 38760.00),
(@id_compra, 30, 40.0, 5, 37700.00),
(@id_compra, 22, 38.0, 6, 70800.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-16 19:00:00', 'COMP-0054', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 50, 26.0, 5, 19950.00),
(@id_compra, 1, 40.0, 6, 49300.00),
(@id_compra, 37, 36.0, 2, 38350.00),
(@id_compra, 13, 38.0, 3, 29120.00),
(@id_compra, 23, 39.0, 4, 68400.00),
(@id_compra, 25, 38.0, 5, 56840.00),
(@id_compra, 66, 25.0, 6, 14750.00),
(@id_compra, 18, 40.0, 2, 47600.00),
(@id_compra, 2, 35.0, 3, 35340.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-17 02:00:00', 'COMP-0055', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 55, 22.0, 6, 27840.00),
(@id_compra, 3, 39.0, 2, 46020.00),
(@id_compra, 14, 36.0, 3, 42000.00),
(@id_compra, 33, 37.0, 4, 65550.00),
(@id_compra, 12, 38.0, 5, 39440.00),
(@id_compra, 17, 35.0, 6, 48380.00),
(@id_compra, 25, 39.0, 2, 54880.00),
(@id_compra, 47, 23.0, 3, 25650.00),
(@id_compra, 35, 39.0, 4, 41760.00),
(@id_compra, 34, 35.0, 5, 40120.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-17 09:00:00', 'COMP-0056', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 14, 37.0, 2, 44250.00),
(@id_compra, 20, 36.0, 3, 40320.00),
(@id_compra, 31, 37.0, 4, 41040.00),
(@id_compra, 38, 38.0, 5, 45240.00),
(@id_compra, 27, 38.0, 6, 44840.00),
(@id_compra, 21, 39.0, 2, 40320.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-17 16:00:00', 'COMP-0057', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 31, 38.0, 3, 40320.00),
(@id_compra, 40, 28.0, 4, 23940.00),
(@id_compra, 38, 39.0, 5, 45240.00),
(@id_compra, 42, 24.0, 6, 24780.00),
(@id_compra, 13, 39.0, 2, 29120.00),
(@id_compra, 52, 22.0, 3, 25650.00),
(@id_compra, 37, 37.0, 4, 37700.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-17 23:00:00', 'COMP-0058', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 12, 39.0, 4, 38760.00),
(@id_compra, 38, 40.0, 5, 45240.00),
(@id_compra, 65, 26.0, 6, 18880.00),
(@id_compra, 67, 27.0, 2, 14000.00),
(@id_compra, 64, 31.0, 3, 18240.00),
(@id_compra, 26, 38.0, 4, 44080.00),
(@id_compra, 32, 38.0, 5, 50150.00),
(@id_compra, 34, 36.0, 6, 38080.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-18 06:00:00', 'COMP-0059', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 55, 23.0, 5, 27840.00),
(@id_compra, 64, 32.0, 6, 18880.00),
(@id_compra, 25, 40.0, 2, 54880.00),
(@id_compra, 20, 37.0, 3, 41040.00),
(@id_compra, 21, 40.0, 4, 41760.00),
(@id_compra, 56, 27.0, 5, 20650.00),
(@id_compra, 26, 39.0, 6, 42560.00),
(@id_compra, 3, 40.0, 2, 44460.00),
(@id_compra, 48, 24.0, 3, 30160.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-18 13:00:00', 'COMP-0060', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 42, 25.0, 6, 24780.00),
(@id_compra, 17, 36.0, 2, 45920.00),
(@id_compra, 32, 39.0, 3, 48450.00),
(@id_compra, 23, 40.0, 4, 69600.00),
(@id_compra, 63, 23.0, 5, 16520.00),
(@id_compra, 62, 28.0, 6, 15680.00),
(@id_compra, 66, 26.0, 2, 14250.00),
(@id_compra, 51, 26.0, 3, 24360.00),
(@id_compra, 25, 35.0, 4, 57820.00),
(@id_compra, 27, 39.0, 5, 42560.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-18 20:00:00', 'COMP-0061', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 53, 26.0, 2, 29120.00),
(@id_compra, 36, 35.0, 3, 54150.00),
(@id_compra, 18, 35.0, 4, 49300.00),
(@id_compra, 27, 40.0, 5, 44840.00),
(@id_compra, 14, 38.0, 6, 42000.00),
(@id_compra, 50, 27.0, 2, 19950.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-19 03:00:00', 'COMP-0062', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 36, 36.0, 3, 54150.00),
(@id_compra, 14, 39.0, 4, 43500.00),
(@id_compra, 38, 35.0, 5, 46020.00),
(@id_compra, 12, 40.0, 6, 38080.00),
(@id_compra, 22, 39.0, 2, 68400.00),
(@id_compra, 24, 40.0, 3, 56840.00),
(@id_compra, 17, 37.0, 4, 48380.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-19 10:00:00', 'COMP-0063', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 18, 36.0, 4, 49300.00),
(@id_compra, 33, 38.0, 5, 67850.00),
(@id_compra, 34, 37.0, 6, 38080.00),
(@id_compra, 37, 38.0, 2, 37050.00),
(@id_compra, 66, 27.0, 3, 14500.00),
(@id_compra, 20, 38.0, 4, 42480.00),
(@id_compra, 36, 37.0, 5, 53200.00),
(@id_compra, 54, 30.0, 6, 27360.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-19 17:00:00', 'COMP-0064', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 60, 41.0, 5, 56050.00),
(@id_compra, 25, 36.0, 6, 54880.00),
(@id_compra, 20, 39.0, 2, 41040.00),
(@id_compra, 10, 38.0, 3, 33640.00),
(@id_compra, 18, 37.0, 4, 50150.00),
(@id_compra, 13, 40.0, 5, 29120.00),
(@id_compra, 38, 36.0, 6, 44460.00),
(@id_compra, 31, 39.0, 2, 41760.00),
(@id_compra, 30, 35.0, 3, 38350.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-20 00:00:00', 'COMP-0065', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 18, 38.0, 6, 47600.00),
(@id_compra, 66, 28.0, 2, 14250.00),
(@id_compra, 13, 35.0, 3, 30160.00),
(@id_compra, 5, 37.0, 4, 43070.00),
(@id_compra, 37, 39.0, 5, 36400.00),
(@id_compra, 41, 23.0, 6, 21660.00),
(@id_compra, 35, 40.0, 2, 41760.00),
(@id_compra, 19, 40.0, 3, 50150.00),
(@id_compra, 34, 38.0, 4, 38080.00),
(@id_compra, 48, 25.0, 5, 29640.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-20 07:00:00', 'COMP-0066', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 36, 38.0, 2, 54150.00),
(@id_compra, 64, 33.0, 3, 18560.00),
(@id_compra, 13, 36.0, 4, 30680.00),
(@id_compra, 11, 35.0, 5, 42000.00),
(@id_compra, 10, 39.0, 6, 33060.00),
(@id_compra, 45, 28.0, 2, 19720.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-20 14:00:00', 'COMP-0067', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 60, 42.0, 3, 55100.00),
(@id_compra, 43, 25.0, 4, 21240.00),
(@id_compra, 30, 36.0, 5, 36400.00),
(@id_compra, 64, 34.0, 6, 18240.00),
(@id_compra, 26, 40.0, 2, 44080.00),
(@id_compra, 35, 35.0, 3, 42480.00),
(@id_compra, 14, 40.0, 4, 42000.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-20 21:00:00', 'COMP-0068', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 36, 39.0, 4, 56050.00),
(@id_compra, 26, 35.0, 5, 42560.00),
(@id_compra, 42, 26.0, 6, 23940.00),
(@id_compra, 34, 39.0, 2, 39440.00),
(@id_compra, 49, 29.0, 3, 28320.00),
(@id_compra, 14, 35.0, 4, 42000.00),
(@id_compra, 32, 40.0, 5, 48450.00),
(@id_compra, 23, 35.0, 6, 69600.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-21 04:00:00', 'COMP-0069', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 41, 24.0, 5, 21280.00),
(@id_compra, 22, 40.0, 6, 68400.00),
(@id_compra, 44, 23.0, 2, 20880.00),
(@id_compra, 17, 38.0, 3, 48380.00),
(@id_compra, 60, 43.0, 4, 53200.00),
(@id_compra, 48, 26.0, 5, 29640.00),
(@id_compra, 52, 23.0, 6, 26100.00),
(@id_compra, 23, 36.0, 2, 70800.00),
(@id_compra, 34, 40.0, 3, 38080.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-21 11:00:00', 'COMP-0070', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 35, 36.0, 6, 41040.00),
(@id_compra, 53, 27.0, 2, 30160.00),
(@id_compra, 40, 29.0, 3, 24780.00),
(@id_compra, 57, 25.0, 4, 23520.00),
(@id_compra, 26, 36.0, 5, 43320.00),
(@id_compra, 16, 36.0, 6, 28420.00),
(@id_compra, 19, 35.0, 2, 50150.00),
(@id_compra, 25, 37.0, 3, 54880.00),
(@id_compra, 5, 38.0, 4, 41610.00),
(@id_compra, 54, 31.0, 5, 27840.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-21 18:00:00', 'COMP-0071', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 38, 37.0, 2, 45240.00),
(@id_compra, 12, 35.0, 3, 40120.00),
(@id_compra, 26, 37.0, 4, 42560.00),
(@id_compra, 22, 35.0, 5, 68400.00),
(@id_compra, 28, 38.0, 6, 45240.00),
(@id_compra, 34, 35.0, 2, 40120.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-22 01:00:00', 'COMP-0072', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 62, 29.0, 3, 16520.00),
(@id_compra, 28, 39.0, 4, 43680.00),
(@id_compra, 17, 39.0, 5, 46740.00),
(@id_compra, 44, 24.0, 6, 20880.00),
(@id_compra, 66, 29.0, 2, 14750.00),
(@id_compra, 5, 39.0, 3, 40880.00),
(@id_compra, 35, 37.0, 4, 41040.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-22 08:00:00', 'COMP-0073', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 34, 36.0, 4, 38080.00),
(@id_compra, 3, 41.0, 5, 44460.00),
(@id_compra, 25, 38.0, 6, 56840.00),
(@id_compra, 51, 27.0, 2, 24780.00),
(@id_compra, 18, 39.0, 3, 47600.00),
(@id_compra, 47, 24.0, 4, 25650.00),
(@id_compra, 17, 40.0, 5, 47560.00),
(@id_compra, 12, 36.0, 6, 40120.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-22 15:00:00', 'COMP-0074', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 54, 32.0, 5, 27360.00),
(@id_compra, 38, 38.0, 6, 45240.00),
(@id_compra, 31, 40.0, 2, 42480.00),
(@id_compra, 32, 35.0, 3, 47600.00),
(@id_compra, 20, 40.0, 4, 41040.00),
(@id_compra, 25, 39.0, 5, 56840.00),
(@id_compra, 58, 40.0, 6, 50150.00),
(@id_compra, 36, 40.0, 2, 53200.00),
(@id_compra, 13, 37.0, 3, 29640.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-22 22:00:00', 'COMP-0075', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 15, 40.0, 6, 28420.00),
(@id_compra, 22, 36.0, 2, 70800.00),
(@id_compra, 49, 30.0, 3, 26880.00),
(@id_compra, 32, 36.0, 4, 48450.00),
(@id_compra, 16, 37.0, 5, 28420.00),
(@id_compra, 65, 27.0, 6, 18880.00),
(@id_compra, 48, 27.0, 2, 29120.00),
(@id_compra, 7, 37.0, 3, 35340.00),
(@id_compra, 26, 38.0, 4, 44080.00),
(@id_compra, 17, 35.0, 5, 48380.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-23 05:00:00', 'COMP-0076', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 36, 35.0, 2, 56050.00),
(@id_compra, 47, 25.0, 3, 25200.00),
(@id_compra, 37, 40.0, 4, 37050.00),
(@id_compra, 11, 36.0, 5, 43500.00),
(@id_compra, 34, 37.0, 6, 40120.00),
(@id_compra, 17, 36.0, 2, 45920.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-23 12:00:00', 'COMP-0077', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 32, 37.0, 3, 47600.00),
(@id_compra, 38, 39.0, 4, 44460.00),
(@id_compra, 24, 35.0, 5, 56840.00),
(@id_compra, 30, 37.0, 6, 38350.00),
(@id_compra, 47, 26.0, 2, 25200.00),
(@id_compra, 19, 36.0, 3, 48450.00),
(@id_compra, 54, 33.0, 4, 27840.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-23 19:00:00', 'COMP-0078', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 39, 25.0, 4, 21660.00),
(@id_compra, 14, 36.0, 5, 43500.00),
(@id_compra, 29, 37.0, 6, 46020.00),
(@id_compra, 31, 35.0, 2, 40320.00),
(@id_compra, 48, 28.0, 3, 29640.00),
(@id_compra, 24, 36.0, 4, 56840.00),
(@id_compra, 15, 35.0, 5, 28910.00),
(@id_compra, 35, 38.0, 6, 40320.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-24 02:00:00', 'COMP-0079', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 52, 24.0, 5, 26100.00),
(@id_compra, 35, 39.0, 6, 42480.00),
(@id_compra, 14, 37.0, 2, 42000.00),
(@id_compra, 65, 28.0, 3, 18240.00),
(@id_compra, 28, 40.0, 4, 45240.00),
(@id_compra, 12, 37.0, 5, 40120.00),
(@id_compra, 25, 40.0, 6, 54880.00),
(@id_compra, 64, 21.0, 2, 18240.00),
(@id_compra, 30, 38.0, 3, 37700.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-24 09:00:00', 'COMP-0080', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 25, 35.0, 6, 57820.00),
(@id_compra, 54, 34.0, 2, 26880.00),
(@id_compra, 37, 35.0, 3, 37050.00),
(@id_compra, 15, 36.0, 4, 28420.00),
(@id_compra, 12, 38.0, 5, 40120.00),
(@id_compra, 34, 38.0, 6, 38080.00),
(@id_compra, 24, 37.0, 2, 55860.00),
(@id_compra, 16, 38.0, 3, 28420.00),
(@id_compra, 20, 35.0, 4, 42480.00),
(@id_compra, 22, 37.0, 5, 67200.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-24 16:00:00', 'COMP-0081', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 23, 37.0, 2, 67200.00),
(@id_compra, 16, 39.0, 3, 27930.00),
(@id_compra, 34, 39.0, 4, 39440.00),
(@id_compra, 26, 39.0, 5, 44840.00),
(@id_compra, 11, 37.0, 6, 42000.00),
(@id_compra, 55, 24.0, 2, 27360.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-24 23:00:00', 'COMP-0082', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 38, 40.0, 3, 44460.00),
(@id_compra, 12, 39.0, 4, 39440.00),
(@id_compra, 47, 27.0, 5, 26550.00),
(@id_compra, 15, 37.0, 6, 27440.00),
(@id_compra, 13, 38.0, 2, 29640.00),
(@id_compra, 35, 40.0, 3, 41760.00),
(@id_compra, 37, 36.0, 4, 38350.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-25 06:00:00', 'COMP-0083', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 36, 36.0, 4, 55100.00),
(@id_compra, 42, 27.0, 5, 24780.00),
(@id_compra, 37, 37.0, 6, 36400.00),
(@id_compra, 44, 25.0, 2, 20520.00),
(@id_compra, 18, 40.0, 3, 49300.00),
(@id_compra, 35, 35.0, 4, 42480.00),
(@id_compra, 53, 28.0, 5, 29120.00),
(@id_compra, 52, 25.0, 6, 25650.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-25 13:00:00', 'COMP-0084', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 45, 29.0, 5, 20060.00),
(@id_compra, 48, 29.0, 6, 29120.00),
(@id_compra, 47, 28.0, 2, 25650.00),
(@id_compra, 37, 38.0, 3, 37700.00),
(@id_compra, 18, 35.0, 4, 50150.00),
(@id_compra, 42, 28.0, 5, 23520.00),
(@id_compra, 23, 38.0, 6, 68400.00),
(@id_compra, 4, 41.0, 2, 31320.00),
(@id_compra, 31, 36.0, 3, 42480.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-25 20:00:00', 'COMP-0085', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 60, 44.0, 6, 53200.00),
(@id_compra, 36, 37.0, 2, 54150.00),
(@id_compra, 8, 37.0, 3, 56840.00),
(@id_compra, 27, 35.0, 4, 44840.00),
(@id_compra, 38, 35.0, 5, 43680.00),
(@id_compra, 13, 39.0, 6, 29640.00),
(@id_compra, 17, 37.0, 2, 47560.00),
(@id_compra, 26, 40.0, 3, 44840.00),
(@id_compra, 65, 29.0, 4, 17920.00),
(@id_compra, 14, 38.0, 5, 42750.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-26 03:00:00', 'COMP-0086', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 35, 36.0, 2, 41040.00),
(@id_compra, 64, 22.0, 3, 18560.00),
(@id_compra, 13, 40.0, 4, 30680.00),
(@id_compra, 34, 40.0, 5, 38080.00),
(@id_compra, 38, 36.0, 6, 44460.00),
(@id_compra, 39, 26.0, 2, 22040.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-26 10:00:00', 'COMP-0087', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 67, 28.0, 3, 14500.00),
(@id_compra, 27, 36.0, 4, 44840.00),
(@id_compra, 45, 30.0, 5, 19040.00),
(@id_compra, 15, 38.0, 6, 27930.00),
(@id_compra, 52, 26.0, 2, 26100.00),
(@id_compra, 18, 36.0, 3, 50150.00),
(@id_compra, 14, 39.0, 4, 42000.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-26 17:00:00', 'COMP-0088', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 62, 30.0, 4, 16520.00),
(@id_compra, 39, 27.0, 5, 21280.00),
(@id_compra, 22, 38.0, 6, 68400.00),
(@id_compra, 30, 39.0, 2, 37700.00),
(@id_compra, 12, 40.0, 3, 40120.00),
(@id_compra, 37, 39.0, 4, 36400.00),
(@id_compra, 61, 36.0, 5, 51300.00),
(@id_compra, 15, 39.0, 6, 28420.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-27 00:00:00', 'COMP-0089', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 35, 37.0, 5, 40320.00),
(@id_compra, 46, 28.0, 6, 19380.00),
(@id_compra, 14, 40.0, 2, 43500.00),
(@id_compra, 57, 26.0, 3, 24780.00),
(@id_compra, 28, 35.0, 4, 43680.00),
(@id_compra, 12, 35.0, 5, 38760.00),
(@id_compra, 51, 28.0, 6, 24360.00),
(@id_compra, 16, 40.0, 2, 28910.00),
(@id_compra, 22, 39.0, 3, 67200.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-27 07:00:00', 'COMP-0090', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 35, 38.0, 6, 41040.00),
(@id_compra, 21, 35.0, 2, 41760.00),
(@id_compra, 38, 37.0, 3, 46020.00),
(@id_compra, 54, 21.0, 4, 26880.00),
(@id_compra, 36, 38.0, 5, 54150.00),
(@id_compra, 15, 40.0, 6, 28420.00),
(@id_compra, 29, 38.0, 2, 46020.00),
(@id_compra, 13, 35.0, 3, 29120.00),
(@id_compra, 18, 37.0, 4, 48450.00),
(@id_compra, 57, 27.0, 5, 24360.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-27 14:00:00', 'COMP-0091', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 56, 28.0, 2, 20300.00),
(@id_compra, 44, 26.0, 3, 21240.00),
(@id_compra, 27, 37.0, 4, 42560.00),
(@id_compra, 28, 36.0, 5, 44460.00),
(@id_compra, 4, 42.0, 6, 31320.00),
(@id_compra, 25, 36.0, 2, 57820.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-27 21:00:00', 'COMP-0092', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 38, 38.0, 3, 46020.00),
(@id_compra, 35, 39.0, 4, 40320.00),
(@id_compra, 12, 36.0, 5, 38760.00),
(@id_compra, 27, 38.0, 6, 44080.00),
(@id_compra, 43, 26.0, 2, 21240.00),
(@id_compra, 23, 39.0, 3, 67200.00),
(@id_compra, 37, 40.0, 4, 37050.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-28 04:00:00', 'COMP-0093', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 36, 39.0, 4, 53200.00),
(@id_compra, 29, 39.0, 5, 44460.00),
(@id_compra, 47, 29.0, 6, 26100.00),
(@id_compra, 13, 36.0, 2, 30680.00),
(@id_compra, 21, 36.0, 3, 40320.00),
(@id_compra, 14, 35.0, 4, 42750.00),
(@id_compra, 48, 30.0, 5, 30160.00),
(@id_compra, 61, 37.0, 6, 53100.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-28 11:00:00', 'COMP-0094', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 24, 38.0, 5, 55860.00),
(@id_compra, 23, 40.0, 6, 69600.00),
(@id_compra, 32, 38.0, 2, 50150.00),
(@id_compra, 8, 38.0, 3, 54880.00),
(@id_compra, 7, 38.0, 4, 35340.00),
(@id_compra, 10, 40.0, 5, 33640.00),
(@id_compra, 65, 30.0, 6, 18880.00),
(@id_compra, 44, 27.0, 2, 20160.00),
(@id_compra, 39, 28.0, 3, 21660.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-28 18:00:00', 'COMP-0095', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 29, 40.0, 6, 45240.00),
(@id_compra, 50, 28.0, 2, 20650.00),
(@id_compra, 37, 35.0, 3, 36400.00),
(@id_compra, 35, 40.0, 4, 41040.00),
(@id_compra, 54, 22.0, 5, 27840.00),
(@id_compra, 19, 37.0, 6, 50150.00),
(@id_compra, 23, 35.0, 2, 67200.00),
(@id_compra, 21, 37.0, 3, 41040.00),
(@id_compra, 57, 28.0, 4, 24360.00),
(@id_compra, 15, 35.0, 5, 28910.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-29 01:00:00', 'COMP-0096', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 48, 31.0, 2, 30680.00),
(@id_compra, 53, 29.0, 3, 29120.00),
(@id_compra, 21, 38.0, 4, 41040.00),
(@id_compra, 17, 38.0, 5, 47560.00),
(@id_compra, 65, 31.0, 6, 18880.00),
(@id_compra, 32, 39.0, 2, 47600.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-29 08:00:00', 'COMP-0097', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 36, 40.0, 3, 53200.00),
(@id_compra, 19, 38.0, 4, 48450.00),
(@id_compra, 4, 43.0, 5, 31320.00),
(@id_compra, 61, 38.0, 6, 53100.00),
(@id_compra, 20, 36.0, 2, 40320.00),
(@id_compra, 23, 36.0, 3, 68400.00),
(@id_compra, 34, 35.0, 4, 39440.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-29 15:00:00', 'COMP-0098', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 31, 37.0, 4, 41040.00),
(@id_compra, 12, 37.0, 5, 39440.00),
(@id_compra, 29, 35.0, 6, 46020.00),
(@id_compra, 58, 41.0, 2, 47600.00),
(@id_compra, 14, 36.0, 3, 42750.00),
(@id_compra, 40, 30.0, 4, 24360.00),
(@id_compra, 13, 37.0, 5, 30680.00),
(@id_compra, 23, 37.0, 6, 67200.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-29 22:00:00', 'COMP-0099', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 34, 36.0, 5, 39440.00),
(@id_compra, 16, 35.0, 6, 28910.00),
(@id_compra, 14, 37.0, 2, 42000.00),
(@id_compra, 1, 41.0, 3, 48450.00),
(@id_compra, 26, 35.0, 4, 44080.00),
(@id_compra, 29, 36.0, 5, 46020.00),
(@id_compra, 33, 39.0, 6, 64400.00),
(@id_compra, 36, 35.0, 2, 54150.00),
(@id_compra, 21, 39.0, 3, 41760.00);
INSERT INTO compra (fecha, nro_comprobante, id_proveedor, id_usuario) VALUES
('2025-09-30 05:00:00', 'COMP-0100', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
SET @id_compra := LAST_INSERT_ID();
INSERT INTO detalle_compra (id_compra, id_producto, numero_calzado, cantidad, precio_unitario_compra) VALUES
(@id_compra, 36, 36.0, 6, 56050.00),
(@id_compra, 40, 31.0, 2, 23520.00),
(@id_compra, 56, 29.0, 3, 19950.00),
(@id_compra, 35, 35.0, 4, 41760.00),
(@id_compra, 19, 39.0, 5, 50150.00),
(@id_compra, 31, 38.0, 6, 40320.00),
(@id_compra, 7, 39.0, 2, 35340.00),
(@id_compra, 52, 27.0, 3, 26100.00),
(@id_compra, 33, 40.0, 4, 67850.00),
(@id_compra, 18, 38.0, 5, 47600.00);

-- ==================== VENTAS ====================
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-01 10:00:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 30, 39.0, 2, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-03 11:13:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 34, 36.0, 1, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-05 12:26:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 14, 36.0, 1, 75000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-08 13:39:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 14, 37.0, 1, 75000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-10 14:52:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 17, 36.0, 1, 82000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-13 10:00:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 38, 36.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-13 11:51:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 36.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-13 14:34:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 38.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-13 17:17:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 40.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-13 18:08:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 30, 37.0, 2, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-14 11:11:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 22, 40.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-14 12:02:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 40.0, 1, 49000.00),
(@id_venta, 27, 36.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-14 15:45:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 36, 39.0, 1, 95000.00),
(@id_venta, 30, 35.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-14 18:28:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 36, 39.0, 1, 95000.00),
(@id_venta, 19, 36.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-14 19:19:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 31, 39.0, 1, 72000.00),
(@id_venta, 24, 36.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-15 12:22:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 17, 35.0, 1, 82000.00),
(@id_venta, 20, 39.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-15 13:13:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 23, 35.0, 1, 120000.00),
(@id_venta, 31, 38.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-15 16:56:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 32, 35.0, 1, 85000.00),
(@id_venta, 36, 39.0, 2, 95000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-15 19:39:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 40.0, 2, 76000.00),
(@id_venta, 15, 37.0, 1, 49000.00),
(@id_venta, 30, 39.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-16 10:50:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 37.0, 1, 49000.00),
(@id_venta, 12, 40.0, 1, 68000.00),
(@id_venta, 24, 37.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-16 13:33:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 17, 38.0, 1, 82000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-16 14:24:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 36, 40.0, 1, 95000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-16 17:07:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 36.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-17 11:01:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 19, 36.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-17 14:44:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 12, 40.0, 1, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-17 15:35:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 16, 37.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-17 18:18:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 35.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-18 12:12:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 19, 35.0, 2, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-18 15:55:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 35.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-18 16:46:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 36.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-18 19:29:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 36.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-19 10:40:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 38.0, 1, 115000.00),
(@id_venta, 38, 39.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-19 13:23:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 40.0, 1, 78000.00),
(@id_venta, 32, 35.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-19 16:06:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 34, 38.0, 1, 68000.00),
(@id_venta, 31, 35.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-19 17:57:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 24, 40.0, 1, 98000.00),
(@id_venta, 23, 40.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-20 15:05:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 39.0, 1, 72000.00),
(@id_venta, 64, 29.0, 2, 32000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-22 16:18:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 35.0, 2, 78000.00),
(@id_venta, 21, 37.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-24 17:31:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 48, 30.0, 1, 52000.00),
(@id_venta, 15, 35.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-27 18:44:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 4, 42.0, 1, 54000.00),
(@id_venta, 23, 40.0, 1, 120000.00),
(@id_venta, 13, 37.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-10-29 19:57:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 22, 35.0, 1, 120000.00),
(@id_venta, 17, 35.0, 1, 82000.00),
(@id_venta, 24, 37.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-01 10:00:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 16, 37.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-02 11:13:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 37.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-03 12:26:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 51, 27.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-04 13:39:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 32, 35.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-05 14:52:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 18, 35.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-06 15:05:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 30, 35.0, 2, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-07 16:18:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 66, 29.0, 1, 25000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-08 17:31:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 30, 38.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-09 18:44:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 40.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-10 19:57:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 25, 38.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-11 10:10:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 43, 25.0, 1, 36000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-12 11:23:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 39.0, 1, 78000.00),
(@id_venta, 28, 35.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-13 12:36:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 16, 40.0, 1, 49000.00),
(@id_venta, 25, 37.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-14 13:49:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 38, 35.0, 1, 78000.00),
(@id_venta, 53, 21.0, 2, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-15 14:02:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 36, 40.0, 2, 95000.00),
(@id_venta, 67, 27.0, 1, 25000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-16 15:15:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 38.0, 1, 78000.00),
(@id_venta, 36, 35.0, 1, 95000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-17 16:28:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 39.0, 1, 78000.00),
(@id_venta, 30, 37.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-18 17:41:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 40.0, 1, 78000.00),
(@id_venta, 32, 36.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-19 18:54:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 40.0, 1, 72000.00),
(@id_venta, 48, 30.0, 1, 52000.00),
(@id_venta, 57, 24.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-20 19:07:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 21.0, 1, 42000.00),
(@id_venta, 31, 37.0, 1, 72000.00),
(@id_venta, 22, 35.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-21 10:20:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 35.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-22 11:33:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 40.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-23 12:46:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 45, 27.0, 1, 34000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-24 13:59:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 22, 36.0, 2, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-25 14:12:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 65, 24.0, 1, 32000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-26 15:25:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 13, 39.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-27 16:38:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 40.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-28 17:51:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 30, 36.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-29 18:04:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 39.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-11-30 19:17:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 62, 26.0, 1, 28000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-01 10:00:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 35.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-03 11:13:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 16, 40.0, 1, 49000.00),
(@id_venta, 17, 39.0, 2, 82000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-05 12:26:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 22, 37.0, 2, 120000.00),
(@id_venta, 21, 37.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-08 13:39:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 8, 38.0, 1, 98000.00),
(@id_venta, 13, 35.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-10 14:52:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 17, 40.0, 1, 82000.00),
(@id_venta, 50, 25.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-13 15:05:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 36.0, 1, 78000.00),
(@id_venta, 19, 40.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-15 16:18:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 39.0, 1, 72000.00),
(@id_venta, 29, 37.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-17 17:31:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 3, 36.0, 1, 78000.00),
(@id_venta, 31, 39.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-20 18:44:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 66, 23.0, 1, 25000.00),
(@id_venta, 38, 40.0, 1, 78000.00),
(@id_venta, 16, 37.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-22 10:00:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 49, 25.0, 1, 48000.00),
(@id_venta, 45, 26.0, 1, 34000.00),
(@id_venta, 42, 28.0, 2, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-22 11:51:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 28.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-22 12:42:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 21.0, 2, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-22 14:34:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 35.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-22 15:25:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 19, 39.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-22 17:17:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 40, 30.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-22 18:08:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 49, 25.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-23 11:11:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 31, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-23 12:02:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 39.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-23 13:53:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 7, 37.0, 1, 62000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-23 15:45:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 48, 22.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-23 16:36:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 30, 39.0, 2, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-23 18:28:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 29.0, 1, 35000.00),
(@id_venta, 50, 26.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-23 19:19:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 34, 37.0, 1, 68000.00),
(@id_venta, 54, 29.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-24 10:30:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 13, 36.0, 1, 52000.00),
(@id_venta, 56, 22.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-24 12:22:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 62, 27.0, 1, 28000.00),
(@id_venta, 17, 35.0, 1, 82000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-24 13:13:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 47, 23.0, 1, 45000.00),
(@id_venta, 62, 23.0, 1, 28000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-24 14:04:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 37.0, 1, 78000.00),
(@id_venta, 45, 25.0, 1, 34000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-24 16:56:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 62, 24.0, 1, 28000.00),
(@id_venta, 58, 40.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-24 17:47:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 67, 23.0, 1, 25000.00),
(@id_venta, 31, 37.0, 2, 72000.00),
(@id_venta, 52, 26.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-24 19:39:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 32, 37.0, 2, 85000.00),
(@id_venta, 36, 35.0, 1, 95000.00),
(@id_venta, 45, 22.0, 1, 34000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-25 10:50:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 35.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-25 11:41:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 23, 37.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-25 13:33:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 31, 40.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-25 14:24:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 40.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-25 17:07:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 25.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-25 18:58:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 62, 25.0, 1, 28000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-26 11:01:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 39.0, 1, 115000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-26 12:52:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 26.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-26 14:44:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 40, 27.0, 2, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-26 15:35:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 53, 23.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-26 18:18:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 62, 21.0, 1, 28000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-26 19:09:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 13, 36.0, 1, 52000.00),
(@id_venta, 55, 22.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-27 10:20:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 21.0, 1, 35000.00),
(@id_venta, 29, 35.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-27 12:12:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 36.0, 1, 76000.00),
(@id_venta, 54, 26.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-27 13:03:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 40.0, 1, 72000.00),
(@id_venta, 50, 25.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-27 15:55:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 64, 22.0, 1, 32000.00),
(@id_venta, 53, 26.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-27 16:46:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 42, 24.0, 1, 42000.00),
(@id_venta, 21, 36.0, 2, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-27 19:29:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 40.0, 2, 115000.00),
(@id_venta, 22, 39.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-28 10:40:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 13, 36.0, 1, 52000.00),
(@id_venta, 33, 40.0, 1, 115000.00),
(@id_venta, 43, 21.0, 1, 36000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-28 11:31:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 12, 40.0, 1, 68000.00),
(@id_venta, 40, 31.0, 1, 42000.00),
(@id_venta, 54, 26.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-28 13:23:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 66, 24.0, 1, 25000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-28 14:14:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 35.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-28 16:06:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 34, 40.0, 1, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-28 17:57:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 7, 35.0, 1, 62000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2025-12-29 19:57:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 49, 25.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-01 10:00:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 48, 29.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-03 11:13:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 40.0, 2, 115000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-05 12:26:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 37, 35.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-07 13:39:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 62, 26.0, 1, 28000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-09 14:52:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 61, 35.0, 1, 90000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-11 15:05:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 40.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-13 16:18:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 7, 39.0, 1, 62000.00),
(@id_venta, 40, 22.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-15 17:31:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 43, 21.0, 1, 36000.00),
(@id_venta, 52, 26.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-17 18:44:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 38, 37.0, 1, 78000.00),
(@id_venta, 21, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-19 19:57:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 40.0, 1, 78000.00),
(@id_venta, 18, 39.0, 2, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-21 10:10:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 44, 21.0, 2, 36000.00),
(@id_venta, 53, 27.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-23 11:23:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 23, 37.0, 1, 120000.00),
(@id_venta, 37, 35.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-25 12:36:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 40, 25.0, 1, 42000.00),
(@id_venta, 50, 26.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-27 13:49:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 62, 30.0, 1, 28000.00),
(@id_venta, 51, 25.0, 1, 42000.00),
(@id_venta, 54, 24.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-01-29 14:02:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 34.0, 1, 48000.00),
(@id_venta, 58, 41.0, 1, 85000.00),
(@id_venta, 29, 38.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-01 10:00:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 46, 27.0, 1, 34000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-03 11:13:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 66, 28.0, 1, 25000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-05 12:26:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 23.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-07 13:39:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 64, 25.0, 1, 32000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-09 14:52:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 38.0, 2, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-11 15:05:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 24, 35.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-13 16:18:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 21, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-15 17:31:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 65, 26.0, 1, 32000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-17 18:44:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 46, 28.0, 1, 34000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-19 19:57:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 37, 38.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-21 10:10:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 50, 26.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-23 11:23:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 32, 35.0, 1, 85000.00),
(@id_venta, 40, 22.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-25 12:36:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 60, 42.0, 1, 95000.00),
(@id_venta, 41, 24.0, 2, 38000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-02-27 13:49:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 40, 31.0, 1, 42000.00),
(@id_venta, 4, 43.0, 1, 54000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-01 10:00:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 41, 21.0, 1, 38000.00),
(@id_venta, 48, 26.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-03 11:13:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 6, 37.0, 1, 58000.00),
(@id_venta, 21, 39.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-05 12:26:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 51, 25.0, 1, 42000.00),
(@id_venta, 7, 37.0, 1, 62000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-07 13:39:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 16, 40.0, 1, 49000.00),
(@id_venta, 49, 30.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-09 14:52:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 16, 38.0, 1, 49000.00),
(@id_venta, 6, 37.0, 1, 58000.00),
(@id_venta, 3, 41.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-11 15:05:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 40, 26.0, 1, 42000.00),
(@id_venta, 22, 38.0, 1, 120000.00),
(@id_venta, 60, 44.0, 1, 95000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-13 16:18:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 39.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-15 17:31:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 48, 22.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-17 18:44:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 19, 36.0, 2, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-19 19:57:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 24, 38.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-21 10:10:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 17, 37.0, 1, 82000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-23 11:23:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 35.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-25 12:36:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 32, 36.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-27 13:49:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 23, 35.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-03-29 14:02:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 21.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-01 10:00:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 47, 29.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-03 11:13:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 40.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-05 12:26:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 67, 27.0, 1, 25000.00),
(@id_venta, 48, 30.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-07 13:39:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 28.0, 1, 42000.00),
(@id_venta, 14, 37.0, 1, 75000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-09 14:52:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 27.0, 1, 35000.00),
(@id_venta, 56, 28.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-11 15:05:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 37.0, 1, 115000.00),
(@id_venta, 21, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-13 16:18:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 50, 21.0, 1, 35000.00),
(@id_venta, 20, 40.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-15 17:31:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 8, 38.0, 1, 98000.00),
(@id_venta, 27, 40.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-17 18:44:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 24, 36.0, 1, 98000.00),
(@id_venta, 40, 24.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-19 19:57:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 66, 28.0, 1, 25000.00),
(@id_venta, 55, 21.0, 1, 48000.00),
(@id_venta, 43, 25.0, 2, 36000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-21 10:10:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 43, 23.0, 1, 36000.00),
(@id_venta, 53, 28.0, 2, 52000.00),
(@id_venta, 6, 36.0, 1, 58000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-23 11:23:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 19, 37.0, 2, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-25 12:36:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 25.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-27 13:49:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 42, 21.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-04-29 14:02:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 38.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-01 10:00:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 46, 28.0, 1, 34000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-02 11:13:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 27.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-04 12:26:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 67, 21.0, 1, 25000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-06 13:39:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 31, 39.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-08 14:52:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 66, 24.0, 1, 25000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-10 15:05:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 22, 38.0, 2, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-12 16:18:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 23.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-14 17:31:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 22.0, 1, 35000.00),
(@id_venta, 27, 36.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-16 18:44:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 49, 27.0, 1, 48000.00),
(@id_venta, 46, 22.0, 1, 34000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-18 19:57:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 7, 38.0, 1, 62000.00),
(@id_venta, 66, 25.0, 1, 25000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-20 10:10:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 47, 27.0, 1, 45000.00),
(@id_venta, 52, 22.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-22 11:23:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 35.0, 1, 78000.00),
(@id_venta, 25, 39.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-24 12:36:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 19, 37.0, 1, 85000.00),
(@id_venta, 45, 21.0, 1, 34000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-26 13:49:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 35.0, 1, 49000.00),
(@id_venta, 24, 36.0, 2, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-28 14:02:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 8, 35.0, 2, 98000.00),
(@id_venta, 23, 40.0, 1, 120000.00),
(@id_venta, 42, 23.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-05-30 15:15:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 38.0, 1, 115000.00),
(@id_venta, 17, 39.0, 1, 82000.00),
(@id_venta, 39, 23.0, 1, 38000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-01 10:00:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 35.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-01 11:13:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 31, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-02 12:26:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 37.0, 1, 115000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-03 13:39:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 35.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-04 14:52:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 35.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-05 15:05:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 34, 40.0, 1, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-06 16:18:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 37.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-07 17:31:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 62, 29.0, 2, 28000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-07 18:44:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 39.0, 1, 115000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-08 19:57:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-09 10:10:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 39.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-10 11:23:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 21.0, 1, 35000.00),
(@id_venta, 18, 39.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-11 12:36:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 40.0, 1, 78000.00),
(@id_venta, 28, 40.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-12 13:49:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 32, 35.0, 1, 85000.00),
(@id_venta, 56, 24.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-13 14:02:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 39.0, 1, 49000.00),
(@id_venta, 55, 22.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-13 15:15:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 49, 28.0, 1, 48000.00),
(@id_venta, 27, 37.0, 2, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-14 16:28:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 35.0, 2, 76000.00),
(@id_venta, 32, 37.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-15 17:41:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 1, 39.0, 1, 85000.00),
(@id_venta, 30, 37.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-16 18:54:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 38.0, 1, 72000.00),
(@id_venta, 24, 39.0, 1, 98000.00),
(@id_venta, 29, 35.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-17 19:07:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 39, 28.0, 1, 38000.00),
(@id_venta, 30, 40.0, 1, 65000.00),
(@id_venta, 18, 38.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-18 10:20:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 23, 40.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-19 11:33:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 36.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-19 12:46:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 39.0, 1, 115000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-20 13:59:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 39.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-21 14:12:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 18, 39.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-22 15:25:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 22, 38.0, 2, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-23 16:38:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 62, 24.0, 1, 28000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-24 17:51:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 40.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-25 18:04:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 21, 40.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-25 19:17:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 36.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-26 10:30:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 38.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-27 11:43:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 35.0, 1, 115000.00),
(@id_venta, 30, 37.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-28 12:56:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 38, 36.0, 1, 78000.00),
(@id_venta, 26, 40.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-29 13:09:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 40.0, 1, 72000.00),
(@id_venta, 30, 40.0, 2, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-06-30 14:22:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 21, 38.0, 2, 72000.00),
(@id_venta, 20, 35.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-01 10:00:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 58, 40.0, 1, 85000.00),
(@id_venta, 25, 40.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-01 11:13:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 21, 36.0, 1, 72000.00),
(@id_venta, 15, 35.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-02 12:26:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 36.0, 1, 76000.00),
(@id_venta, 21, 35.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-03 13:39:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 18, 36.0, 1, 85000.00),
(@id_venta, 45, 27.0, 1, 34000.00),
(@id_venta, 26, 37.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-04 14:52:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 24, 38.0, 1, 98000.00),
(@id_venta, 24, 36.0, 1, 98000.00),
(@id_venta, 30, 40.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-05 15:05:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 35.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-06 16:18:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 31, 37.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-07 17:31:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 30, 36.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-08 18:44:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 18, 38.0, 2, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-08 19:57:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 50, 28.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-09 10:10:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 32, 38.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-10 11:23:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 40.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-11 12:36:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 25, 40.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-12 13:49:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 39.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-13 14:02:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 36.0, 1, 115000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-14 15:15:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 25, 40.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-15 16:28:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 12, 36.0, 1, 68000.00),
(@id_venta, 62, 27.0, 1, 28000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-16 17:41:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 19, 37.0, 2, 85000.00),
(@id_venta, 19, 38.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-16 18:54:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 36.0, 1, 72000.00),
(@id_venta, 24, 40.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-17 19:07:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 32, 40.0, 1, 85000.00),
(@id_venta, 16, 35.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-18 10:20:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 38.0, 1, 115000.00),
(@id_venta, 5, 37.0, 1, 73000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-19 11:33:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 25, 35.0, 1, 98000.00),
(@id_venta, 35, 38.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-20 12:46:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 18, 36.0, 1, 85000.00),
(@id_venta, 65, 31.0, 1, 32000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-21 13:59:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 20, 39.0, 1, 72000.00),
(@id_venta, 33, 35.0, 1, 115000.00),
(@id_venta, 21, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-22 14:12:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 35.0, 1, 76000.00),
(@id_venta, 54, 26.0, 1, 48000.00),
(@id_venta, 32, 38.0, 2, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-23 15:25:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 19, 40.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-24 16:38:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 65, 31.0, 2, 32000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-24 17:51:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 25, 35.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-25 18:04:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 39.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-26 19:17:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 22, 36.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-27 10:30:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 38.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-28 11:43:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 40.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-29 12:56:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 22, 39.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-30 13:09:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 24, 38.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-07-31 14:22:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 24, 35.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-01 10:00:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 12, 39.0, 2, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-05 11:13:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 7, 36.0, 1, 62000.00),
(@id_venta, 55, 21.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-10 10:00:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 22.0, 1, 42000.00),
(@id_venta, 54, 28.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-10 11:51:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 22.0, 1, 42000.00),
(@id_venta, 56, 26.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-10 12:42:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 26.0, 1, 42000.00),
(@id_venta, 45, 24.0, 1, 34000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-10 14:34:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 49, 26.0, 1, 48000.00),
(@id_venta, 57, 27.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-10 15:25:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 30.0, 1, 48000.00),
(@id_venta, 53, 22.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-10 16:16:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 28.0, 1, 42000.00),
(@id_venta, 53, 24.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-10 17:17:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 53, 22.0, 1, 52000.00),
(@id_venta, 41, 22.0, 2, 38000.00),
(@id_venta, 54, 22.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-10 18:08:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 47, 27.0, 2, 45000.00),
(@id_venta, 48, 23.0, 1, 52000.00),
(@id_venta, 56, 29.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-10 19:59:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 52, 24.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-11 10:10:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 52, 25.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-11 11:11:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 53, 22.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-11 12:02:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 31.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-11 13:53:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 32.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-11 15:45:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 50, 24.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-11 16:36:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 24.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-11 17:27:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 53, 25.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-11 18:28:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 52, 24.0, 2, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-11 19:19:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 26.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-12 10:30:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 24.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-12 11:21:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 27.0, 1, 35000.00),
(@id_venta, 45, 26.0, 1, 34000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-12 12:22:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 46, 21.0, 1, 34000.00),
(@id_venta, 57, 23.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-12 13:13:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 24.0, 1, 42000.00),
(@id_venta, 54, 34.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-12 14:04:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 52, 27.0, 1, 45000.00),
(@id_venta, 56, 29.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-12 16:56:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 23.0, 1, 35000.00),
(@id_venta, 62, 29.0, 1, 28000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-12 17:47:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 28.0, 1, 42000.00),
(@id_venta, 52, 22.0, 2, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-12 18:38:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 25.0, 2, 48000.00),
(@id_venta, 53, 24.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-12 19:39:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 53, 24.0, 1, 52000.00),
(@id_venta, 39, 25.0, 1, 38000.00),
(@id_venta, 51, 23.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-13 10:50:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 66, 26.0, 1, 25000.00),
(@id_venta, 55, 24.0, 1, 48000.00),
(@id_venta, 53, 24.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-13 11:41:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 52, 25.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-13 12:32:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 22.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-13 13:33:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 24.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-13 14:24:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 24.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-13 15:15:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 42, 25.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-13 17:07:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 53, 29.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-13 18:58:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 30.0, 2, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-13 19:49:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 55, 22.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-14 11:01:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 55, 22.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-14 12:52:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 27.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-14 13:43:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 25.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-14 14:44:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 64, 33.0, 1, 32000.00),
(@id_venta, 54, 31.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-14 15:35:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 64, 26.0, 1, 32000.00),
(@id_venta, 52, 25.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-14 16:26:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 22.0, 1, 48000.00),
(@id_venta, 57, 28.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-14 18:18:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 44, 21.0, 1, 36000.00),
(@id_venta, 39, 27.0, 2, 38000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-14 19:09:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 55, 22.0, 2, 48000.00),
(@id_venta, 56, 24.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-15 10:20:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 28.0, 1, 48000.00),
(@id_venta, 53, 29.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-15 12:12:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 28.0, 1, 48000.00),
(@id_venta, 56, 27.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-15 13:03:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 44, 21.0, 1, 36000.00),
(@id_venta, 54, 23.0, 1, 48000.00),
(@id_venta, 52, 24.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-15 14:54:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 45, 21.0, 1, 34000.00),
(@id_venta, 54, 28.0, 1, 48000.00),
(@id_venta, 66, 23.0, 1, 25000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-15 15:55:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 31.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-15 16:46:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 52, 27.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-15 17:37:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 53, 28.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-15 19:29:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 53, 23.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-16 10:40:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 53, 29.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-16 11:31:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 26.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-16 13:23:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 52, 27.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-16 14:14:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 25.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-16 15:05:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 21.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-16 16:06:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 57, 25.0, 1, 42000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-16 17:57:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 56, 23.0, 1, 35000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-16 18:48:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 64, 25.0, 1, 32000.00),
(@id_venta, 43, 24.0, 1, 36000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-17 12:26:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 12, 40.0, 1, 68000.00),
(@id_venta, 4, 43.0, 2, 54000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-22 13:39:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 34, 39.0, 2, 68000.00),
(@id_venta, 39, 22.0, 1, 38000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-08-27 14:52:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 10, 39.0, 1, 58000.00),
(@id_venta, 48, 21.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-01 10:00:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 60, 44.0, 1, 95000.00),
(@id_venta, 22, 35.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-03 11:13:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 35.0, 1, 76000.00),
(@id_venta, 54, 32.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-05 12:26:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 40.0, 1, 115000.00),
(@id_venta, 15, 35.0, 1, 49000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-07 13:39:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 49, 27.0, 1, 48000.00),
(@id_venta, 5, 38.0, 1, 73000.00),
(@id_venta, 37, 36.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-09 14:52:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 36.0, 1, 49000.00),
(@id_venta, 4, 41.0, 1, 54000.00),
(@id_venta, 64, 27.0, 1, 32000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-11 15:05:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 43, 23.0, 1, 36000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-13 16:18:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 12, 35.0, 1, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-15 17:31:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 36.0, 2, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-17 18:44:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 65, 27.0, 1, 32000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-19 19:57:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 38, 37.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-21 10:10:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 55, 24.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-23 11:23:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 37, 36.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-25 12:36:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 34, 38.0, 1, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-27 13:49:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 52, 25.0, 1, 45000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-09-29 14:02:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 23, 37.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-01 10:00:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 39, 28.0, 1, 38000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-04 11:13:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 30, 38.0, 2, 65000.00),
(@id_venta, 12, 38.0, 1, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-07 12:26:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 14, 35.0, 1, 75000.00),
(@id_venta, 35, 38.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-11 13:39:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 31, 40.0, 1, 72000.00),
(@id_venta, 13, 37.0, 1, 52000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-12 10:00:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 23, 37.0, 1, 120000.00),
(@id_venta, 21, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-12 11:51:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 37.0, 1, 115000.00),
(@id_venta, 31, 35.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-12 14:34:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 13, 38.0, 1, 52000.00),
(@id_venta, 17, 36.0, 1, 82000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-12 17:17:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 23, 40.0, 1, 120000.00),
(@id_venta, 31, 38.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-13 11:11:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 40.0, 1, 72000.00),
(@id_venta, 33, 38.0, 1, 115000.00),
(@id_venta, 25, 38.0, 2, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-13 12:02:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 29, 38.0, 1, 78000.00),
(@id_venta, 17, 36.0, 2, 82000.00),
(@id_venta, 27, 37.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-13 15:45:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 35.0, 2, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-13 18:28:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 30, 35.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-14 12:22:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 32, 37.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-14 13:13:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 34, 35.0, 1, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-14 16:56:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-14 19:39:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 18, 38.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-15 10:50:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 19, 40.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-15 13:33:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 36.0, 1, 115000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-15 14:24:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 14, 37.0, 1, 75000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-15 17:07:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 35.0, 2, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-16 11:01:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 37.0, 1, 115000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-16 14:44:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 22, 38.0, 1, 120000.00),
(@id_venta, 25, 36.0, 1, 98000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-16 15:35:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 19, 38.0, 1, 85000.00),
(@id_venta, 12, 35.0, 1, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-16 18:18:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 38, 39.0, 1, 78000.00),
(@id_venta, 35, 39.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-17 12:12:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 34, 38.0, 1, 68000.00),
(@id_venta, 33, 40.0, 1, 115000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-17 15:55:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 39.0, 1, 76000.00),
(@id_venta, 12, 36.0, 1, 68000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-17 16:46:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 36, 37.0, 1, 95000.00),
(@id_venta, 28, 37.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-17 19:29:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 15, 35.0, 1, 49000.00),
(@id_venta, 36, 36.0, 2, 95000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-18 10:40:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 27, 39.0, 2, 76000.00),
(@id_venta, 20, 37.0, 1, 72000.00),
(@id_venta, 37, 36.0, 1, 65000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-18 13:23:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 21, 38.0, 1, 72000.00),
(@id_venta, 36, 40.0, 1, 95000.00),
(@id_venta, 18, 39.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-18 16:06:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 14, 35.0, 1, 75000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-18 17:57:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 40.0, 1, 78000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-21 14:52:00', 0.00, 'TARJETA_DEBITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 35.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-25 15:05:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 39.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-10-28 16:18:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 21, 37.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-01 10:00:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 35, 37.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-01 11:13:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 33, 37.0, 1, 115000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-02 12:26:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 54, 28.0, 1, 48000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-02 13:39:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 21, 35.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-03 14:52:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 26, 39.0, 1, 76000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-04 15:05:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 36, 40.0, 1, 95000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-04 16:18:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 22, 39.0, 1, 120000.00),
(@id_venta, 21, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-05 17:31:00', 0.00, 'TRANSFERENCIA', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 14, 38.0, 1, 75000.00),
(@id_venta, 31, 36.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-05 18:44:00', 0.00, 'TARJETA_CREDITO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 23, 37.0, 1, 120000.00),
(@id_venta, 22, 37.0, 1, 120000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-06 19:57:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'mili_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 36.0, 1, 78000.00),
(@id_venta, 32, 40.0, 1, 85000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-07 10:10:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 17, 37.0, 1, 82000.00),
(@id_venta, 39, 22.0, 2, 38000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-07 11:23:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 6, 35.0, 2, 58000.00),
(@id_venta, 31, 40.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-08 12:36:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'migue_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 12, 36.0, 1, 68000.00),
(@id_venta, 17, 40.0, 1, 82000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-08 13:49:00', 10.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'profe_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 43, 22.0, 1, 36000.00),
(@id_venta, 25, 36.0, 1, 98000.00),
(@id_venta, 35, 38.0, 1, 72000.00);
INSERT INTO venta (fecha, descuento, medio_pago, id_usuario) VALUES
('2026-11-09 14:02:00', 0.00, 'EFECTIVO', (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'marce_ventas'));
SET @id_venta := LAST_INSERT_ID();
INSERT INTO detalle_venta (id_venta, id_producto, numero_calzado, cantidad, precio_unitario_venta) VALUES
(@id_venta, 28, 39.0, 1, 78000.00),
(@id_venta, 33, 40.0, 1, 115000.00),
(@id_venta, 50, 24.0, 1, 35000.00);

-- ==================== PAGOS A PROVEEDORES ====================
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2025-10-10 11:00:00', 180000.00, 'TRANSFERENCIA', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2025-10-23 11:00:00', 215000.00, 'EFECTIVO', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2025-11-05 11:00:00', 250000.00, 'TARJETA_DEBITO', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2025-11-18 11:00:00', 285000.00, 'TRANSFERENCIA', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2025-12-01 11:00:00', 320000.00, 'EFECTIVO', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2025-12-14 11:00:00', 355000.00, 'TARJETA_DEBITO', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2025-12-27 11:00:00', 390000.00, 'TRANSFERENCIA', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-01-09 11:00:00', 180000.00, 'EFECTIVO', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-01-22 11:00:00', 215000.00, 'TARJETA_DEBITO', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-02-04 11:00:00', 250000.00, 'TRANSFERENCIA', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-02-17 11:00:00', 285000.00, 'EFECTIVO', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-03-02 11:00:00', 320000.00, 'TARJETA_DEBITO', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-03-15 11:00:00', 355000.00, 'TRANSFERENCIA', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-03-28 11:00:00', 390000.00, 'EFECTIVO', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-04-10 11:00:00', 180000.00, 'TARJETA_DEBITO', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-04-23 11:00:00', 215000.00, 'TRANSFERENCIA', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-05-06 11:00:00', 250000.00, 'EFECTIVO', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-05-19 11:00:00', 285000.00, 'TARJETA_DEBITO', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-06-01 11:00:00', 320000.00, 'TRANSFERENCIA', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-06-14 11:00:00', 355000.00, 'EFECTIVO', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-06-27 11:00:00', 390000.00, 'TARJETA_DEBITO', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-07-10 11:00:00', 180000.00, 'TRANSFERENCIA', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-07-23 11:00:00', 215000.00, 'EFECTIVO', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-08-05 11:00:00', 250000.00, 'TARJETA_DEBITO', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-08-18 11:00:00', 285000.00, 'TRANSFERENCIA', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-08-31 11:00:00', 320000.00, 'EFECTIVO', 1, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-09-13 11:00:00', 355000.00, 'TARJETA_DEBITO', 2, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-09-26 11:00:00', 390000.00, 'TRANSFERENCIA', 3, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-10-09 11:00:00', 180000.00, 'EFECTIVO', 4, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));
INSERT INTO pago_proveedor (fecha, monto, medio_pago, id_proveedor, id_usuario) VALUES
('2026-10-22 11:00:00', 215000.00, 'TARJETA_DEBITO', 5, (SELECT id_usuario FROM usuario WHERE nombre_usuario = 'admin_operaciones'));

COMMIT;

-- ==================== VALIDACION ====================
SELECT (SELECT COUNT(*) FROM compra WHERE nro_comprobante LIKE 'COMP-%') AS compras, (SELECT COUNT(*) FROM venta) AS ventas, (SELECT COUNT(*) FROM pago_proveedor) AS pagos;
SELECT u.nombre_usuario, COUNT(*) AS ventas FROM venta v JOIN usuario u ON u.id_usuario=v.id_usuario GROUP BY u.id_usuario,u.nombre_usuario ORDER BY ventas DESC;
SELECT DATE_FORMAT(fecha,'%Y-%m') AS mes, COUNT(*) AS ventas FROM venta GROUP BY DATE_FORMAT(fecha,'%Y-%m') ORDER BY mes;
SELECT id_compra, COUNT(*) AS productos FROM detalle_compra GROUP BY id_compra HAVING COUNT(*) NOT BETWEEN 6 AND 10;
SELECT id_producto, numero_calzado, stock FROM producto_talle WHERE stock < 0;
