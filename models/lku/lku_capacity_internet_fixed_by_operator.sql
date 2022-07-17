select 
distinct company_id,
year, 
quarter,
'internet_fixed' as service
from  
{{ ref('base_capacity_internet_fixed_access_points') }}
group by 1,2,3