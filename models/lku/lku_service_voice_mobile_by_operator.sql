select 
distinct company_name,
year, 
quarter,
'voice_mobile' as service
from  
{{ ref('base_service_voice_mobile_subscribers') }}
group by 1,2,3