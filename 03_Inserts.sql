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

