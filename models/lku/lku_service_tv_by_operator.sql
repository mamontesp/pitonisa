select 
distinct company_name,
year, 
quarter,
'tv' as service
from  
{{ ref('base_service_tv_subscribers') }}
group by 1,2,3