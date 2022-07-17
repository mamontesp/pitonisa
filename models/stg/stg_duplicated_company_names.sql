select 
c.company_id, 
c.company_name 
from (select distinct company_id, 
	count(company_id) 
	from {{ref('stg_companies')}} 
	group by 1 
	having count(company_id)>1)t 
join dwh_stg.stg_companies c 
on t.company_id=c.company_id 
order by c.company_id
