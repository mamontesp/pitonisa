select 
distinct company_id,
year, 
quarter,
'voice' as service,
'mobile' as service_type
from  
{{ ref('base_service_voice_mobile_subscribers') }}
group by 1,2,3