select 
distinct company_id,
year, 
quarter,
month,
'telephone' as service
from  
{{ ref('base_capacity_telephone_local_lines') }}
group by 1,2,3,4