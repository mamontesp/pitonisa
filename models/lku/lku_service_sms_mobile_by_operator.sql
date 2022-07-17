select 
distinct company_name,
year, 
quarter,
'sms' as service
from  
{{ ref('base_service_sms_mobile_traffic') }}
group by 1,2,3