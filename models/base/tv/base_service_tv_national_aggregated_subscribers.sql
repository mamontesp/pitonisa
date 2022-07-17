select 
year, 
quarter,
month,
company_id,
company_name,
company_type,
segment_id,
segment,
municipality_id,
municipality,
department_id,
department,
technology_id,
technology_name,
sum(ct_subscribers) as ct_subscribers
from {{ ref('stg_tv_subscribers') }}
where municipality_id <> '99999'
group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14

union all

select 
year, 
quarter,
month,
company_id,
company_name,
company_type,
segment_id,
segment,
municipality_id,
municipality,
department_id,
department,
technology_id,
technology_name,
ct_subscribers
from {{ ref('stg_tv_subscribers') }}
where municipality_id = '99999'
