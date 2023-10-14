select sucursal_id, sum(cantidad) as total_productos
from stocks 
group by sucursal_id
order by sucursal_id asc;
