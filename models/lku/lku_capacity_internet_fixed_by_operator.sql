select 
distinct company_id,
year, 
quarter,
'internet' as service,
'mobile' as service_type
from  
{{ ref('base_capacity_internet_fixed_access_points') }}
group by 1,2,3