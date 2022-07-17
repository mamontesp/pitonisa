select 
distinct company_id,
year, 
quarter,
'internet' as service,
'mobile' as service_type
from  
{{ ref('base_service_internet_mobile_subscribers') }}
group by 1,2,3