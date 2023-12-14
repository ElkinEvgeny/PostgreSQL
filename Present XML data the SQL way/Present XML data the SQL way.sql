with test as
(select unnest(XPATH('data/user/first_name/text()', data))::TEXT as first_name, 
unnest(XPATH('data/user/last_name/text()', data))::TEXT as last_name,
unnest(XPATH('data/user/date_of_birth/text()', data))::TEXT as age,
unnest(XPATH('data/user/private/text()', data)):: TEXT as private,
unnest(XPATH('data/user/email_addresses/address[1]/text()', data))::TEXT as email_address
from users)
select first_name, last_name, date_part('year',age(age::date))::int as age, 
CASE  WHEN private ='true' THEN 'Hidden' WHEN email_address is null THEN 'None'
ELSE email_address END AS email_address  
from test
ORDER BY first_name, last_name;