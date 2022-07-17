select 
'internet' as service,
'count of access points' as description,
year, 
quarter, 
company_id,
segment_id,
segment, 
municipality_id,
municipality,
department_id,
department,
technology_id,
technology_name,
ct_access_points as ct_capacity
from {{ ref('base_capacity_internet_fixed_access_points') }}

union all

select 
'telephone' as service,
'count of telephone local lines' as description,
year, 
quarter, 
company_id, 
segment_id,
segment, 
municipality_id,
municipality,
department_id,
department,
null technology_id,
null technology_name,
ct_lines as ct_capacity
from {{ ref('base_capacity_telephone_local_lines') }}
