Select count(s.sale) as sale_count,RANK() OVER (PARTITION BY a.id ORDER BY a.id desc) as sale_rank,a.id,a.name
from people as a
inner join sales as s
on a.id=s.people_id
group by a.id,a.name