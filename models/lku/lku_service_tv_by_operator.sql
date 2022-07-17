select 
distinct company_id,
year, 
quarter,
'tv' as service,
'fixed' as service_type
from  
{{ ref('base_service_tv_subscribers') }}
group by 1,2,3