alter table productos 
add constraint fk_productos_categorias
foreign key (categoria_id) references categorias (id);

alter table stocks  
add constraint fk_stocks_sucursales
foreign key (sucursal_id) references sucursales (id);

alter table stocks 
add constraint fk_stocks_productos
foreign key (producto_id) references productos (id);

alter table ordenes 
add constraint fk_ordenes_clientes
foreign key (cliente_id) references clientes (id);

alter table ordenes 
add constraint fk_ordenes_sucursales
foreign key (sucursal_id) references sucursales (id);

alter table items  
add constraint fk_items_ordenes
foreign key (orden_id) references ordenes (id);

alter table items  
add constraint fk_items_productos
foreign key (producto_id) references productos (id);