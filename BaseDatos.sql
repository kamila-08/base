-- SCHEMA: pr1

-- DROP SCHEMA IF EXISTS pr1 ;

CREATE SCHEMA IF NOT EXISTS pr1
    AUTHORIZATION postgres;
	
CREATE SCHEMA pr1;

--Tabla de usuarios--
CREATE TABLE pr1.usuarios(
id_usuario int PRIMARY KEY,
nombre varchar  not null,
apellido varchar not null,
email varchar not null,
contraseña varchar not null
);

--Tabla de productos--
CREATE TABLE pr1.productos(
id_producto int PRIMARY KEY,
nombre VARCHAR not null,
descripcion VARCHAR not null,
precio varchar not null,
id_categoria int not null,
FOREIGN KEY (id_categoria) REFERENCES pr1.Categorias(id_categoria)
);

--Tabla de categorias--
CREATE TABLE pr1.Categorias (
id_categoria int PRIMARY KEY,
nombre VARCHAR not null
);

--Tabla de pedidos--
CREATE TABLE pr1.Pedidos (
id_pedido int PRIMARY KEY,
id_usuario int not null,
fecha date not null,
total varchar not null,
FOREIGN KEY (id_usuario) REFERENCES pr1.usuarios(id_usuario)
);

--Tabla de detalles pedido--
CREATE TABLE pr1.DetallesPedido (
id_detalle int PRIMARY KEY,
id_pedido int not null,
id_producto int not null,
cantidad int not null,
subtotal varchar not null,
FOREIGN KEY (id_pedido) REFERENCES pr1.Pedidos(id_pedido),
FOREIGN KEY (id_producto) REFERENCES pr1.productos(id_producto)
);

--Tabla de direcciones--
CREATE TABLE pr1.Direcciones (
id_direccion int PRIMARY KEY,
id_usuario int not null,
calle VARCHAr not null,
numero VARCHAR not null,
ciudad VARCHAR not null,
estado VARCHAR not null,
pais VARCHAR not null,
codigo_postal VARCHAR not null,
FOREIGN KEY (id_usuario) REFERENCES pr1.usuarios(id_usuario)
);