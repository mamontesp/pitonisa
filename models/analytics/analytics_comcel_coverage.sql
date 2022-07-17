/*COMCEL coverage*/

select * 
from 
{{ref('rpt_services_by_operator')}}
where company_id = '800153993'
order by year, quarter