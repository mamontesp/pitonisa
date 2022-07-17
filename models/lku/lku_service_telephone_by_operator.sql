select 
distinct company_name,
year, 
quarter,
month,
'telephone' as service
from  
{{ ref('base_service_telephone_local_lines') }}
group by 1,2,3,4