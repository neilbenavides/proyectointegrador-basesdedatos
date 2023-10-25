select s2.nombre as sucursal, sum(i.monto_venta) as total_ventas
from sucursales s2 
join ordenes o on s2.id = o.sucursal_id 
join items i on o.id = i.orden_id
group by s2.nombre
order by  s2.nombre;
