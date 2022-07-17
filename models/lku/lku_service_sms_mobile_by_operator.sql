select 
distinct company_id,
year, 
quarter,
'sms' as service,
'mobile' as service_type
from  
{{ ref('base_service_sms_mobile_traffic') }}
group by 1,2,3