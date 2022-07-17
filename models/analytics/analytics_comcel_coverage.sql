/*COMCEL coverage*/

select * 
from 
dwh_rpt.rpt_services_by_operator 
where company_id = '800153993'
order by year, quarter