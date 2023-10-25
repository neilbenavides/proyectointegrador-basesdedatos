select c.nombre as categoria, sum(s.cantidad) as cantidad_total
from categorias c 
join productos p on c.id = p.categoria_id 
join stocks s on p.id = s.producto_id
group by c.nombre
order by  c.nombre;