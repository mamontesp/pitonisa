select 
distinct company_name,
year, 
quarter,
'internet_fixed' as service
from  
{{ ref('base_service_internet_fixed_2010_2022_access_points') }}
group by 1,2,3