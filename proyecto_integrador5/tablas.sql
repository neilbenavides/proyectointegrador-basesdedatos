create table categorias (
id serial primary key not null,
nombre varchar(50) 
);

create table productos (
id serial primary key not null,
nombre varchar(50),
marca varchar(50),
categoria_id integer not null,
precio_unitario integer
);

create table sucursales (
id serial primary key not null,
nombre varchar(50),
direccion varchar(50)
);

create table clientes (
id serial primary key not null,
nombre varchar(50),
telefono varchar(50)
);

create table ordenes (
id serial primary key not null,
cliente_id integer not null,
sucursal_id integer not null,
fecha varchar(50),
total integer
);

create table stocks (
id serial primary key not null,
sucursal_id integer not null,
producto_id integer not null,
cantidad integer
);

create table items (
id serial primary key not null,
orden_id integer not null,
producto_id integer not null,
cantidad integer,
monto_venta integer
);