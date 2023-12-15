select count(id) as products, country 
from products
where country in ('United States of America','Canada')
Group by country
order by products desc