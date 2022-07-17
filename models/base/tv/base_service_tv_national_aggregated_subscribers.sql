select 
year, 
quarter,
month,
company_id,
company_name,
company_type,
segment_id,
segment_name,
technology_id,
technology_name,
sum(ct_subscribers) as ct_subscribers
from {{ ref('stg_tv_subscribers') }}
group by 1,2,3,4,5,6,7,8,9,10