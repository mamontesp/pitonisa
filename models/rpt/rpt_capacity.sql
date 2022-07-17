select
  year,
  quarter, 
  sc.company_id, 
  sc.company_name,
  segment_id,
  segment,
  municipality_id,
  municipality,
  department_id,
  department,
  technology_id,
  technology_name,
  {{ dbt_utils.pivot(
      column='service',
      values=dbt_utils.get_column_values(ref('base_capacity_all'), 'service'),
      then_value='ct_capacity'
  ) }}
from {{ ref('base_capacity_all') }} bc
join {{ ref ('stg_companies')}} sc
on bc.company_id = sc.company_id
group by 1,2,3,4,5,6,7,8,9,10,11,12