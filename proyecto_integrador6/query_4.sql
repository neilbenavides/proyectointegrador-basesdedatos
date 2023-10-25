select c.nombre as nomnbre_cliente, sum(i.monto_venta) as mayor_compra
from clientes c 
join ordenes o on c.id = o.cliente_id 
join items i on o.id = i.orden_id
group by c.nombre 
order by sum(i.monto_venta) desc
limit 1;
