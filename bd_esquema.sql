CREATE database sistema_gimnasio; 
USE sistema_gimnasio;

CREATE TABLE membresias(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	duracion SMALLINT NOT NULL,
	precio DECIMAL (5,2) NOT NULL
);
CREATE TABLE usuarios(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	usuario VARCHAR(255) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	password VARCHAR(255) NOT NULL
);

CREATE TABLE miembros(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	matricula VARCHAR(50) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
	direccion VARCHAR(255) NOT NULL,
	edad TINYINT NOT NULL,
	sufreEnfermedad BOOLEAN,
	tieneSeguro BOOLEAN,
	enfermedad VARCHAR(255),
	institucion VARCHAR(255),
	nombreContacto VARCHAR(255) NOT NULL,
	telefonoContacto VARCHAR(255) NOT NULL,
	imagen VARCHAR(255),
	estado ENUM("ACTIVO", "VENCIDO"),
	fechaRegistro DATETIME NOT NULL,
	fechaInicio DATETIME,
	idMembresia BIGINT 
);

ALTER TABLE miembros ADD COLUMN fechaFin DATETIME AFTER fechaInicio;


CREATE TABLE visitas(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idMiembro BIGINT,
	idUsuario BIGINT NOT NULL,
	idMembresia BIGINT,
	fecha DATETIME NOT NULL
);

CREATE TABLE pagos(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	matricula VARCHAR(50) NOT NULL,
	idMembresia BIGINT NOT NULL,
	idUsuario BIGINT NOT NULL,
	fecha DATETIME NOT NULL,
	monto DECIMAL(5,2) NOT NULL
);

CREATE TABLE gastos(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    total DECIMAL(7,2) NOT NULL,
    id_entrenador BIGINT NOT NULL
);

CREATE TABLE ajustes(
	nombre VARCHAR(255),
	logo VARCHAR(255),
	direccion VARCHAR(255),
	telefono VARCHAR(15)
);


CREATE TABLE  entrenadores (
 id_entrenador  BIGINT NOT NULL,
 usuario VARCHAR(255) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
);

ALTER TABLE entrenadores ADD COLUMN password VARCHAR(255); 
ALTER TABLE pagos ADD COLUMN id_entrenador BIGINT NOT NULL;





CREATE TABLE productos (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	codigo VARCHAR(100) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	precioCompra DECIMAL(6,2) NOT NULL,
	precioVenta DECIMAL(6,2) NOT NULL,
	ganancia DECIMAL(6,2) NOT NULL,
	existencia DECIMAL(4,2) NOT NULL
	
);

CREATE TABLE ventas(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha DATETIME NOT NULL,
	total DECIMAL(6,2) NOT NULL,
	total_pagado DECIMAL(6,2) NOT NULL,
	id_entrenador BIGINT UNSIGNED NOT NULL,
	id_cliente BIGINT UNSIGNED 
);

CREATE TABLE productos_venta(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_producto BIGINT UNSIGNED NOT NULL,
	cantidad DECIMAL(3,2) NOT NULL,
	precio DECIMAL(6,2) NOT NULL,
	ganancia DECIMAL(6,2) NOT NULL,
	subtotal DECIMAL(6,2) NOT NULL,
	id_venta BIGINT UNSIGNED NOT NULL
);

CREATE TABLE movimientos_caja(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	total DECIMAL(6,2) NOT NULL,
	tipo ENUM("INGRESO", "RETIRO"),
	motivo VARCHAR(255),
	fecha DATETIME NOT NULL,
	id_entrenador BIGINT UNSIGNED NOT NULL
);
ALTER TABLE membresias MODIFY dias SMALLINT;
ALTER TABLE visitas MODIFY id_miembro BIGINT UNSIGNED  NULL;
ALTER TABLE pagos MODIFY id_miembro BIGINT UNSIGNED  NULL;
