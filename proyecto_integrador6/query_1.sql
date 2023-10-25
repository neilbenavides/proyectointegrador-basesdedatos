select c.nombre as categorias, avg(p.precio_unitario) as precio_promedio
from categorias c 
join productos p on c.id = p.categoria_id 
group by c.nombre
order by c.nombre;