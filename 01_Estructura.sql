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
