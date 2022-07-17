select
  year,
  quarter,
  bs.company_id,
  sc.company_name,
  technology_id,
  technology_name,
  {{ dbt_utils.pivot(
      column='service',
      values=dbt_utils.get_column_values(ref('base_service_all'), 'service'),
      then_value='ct_service'
  ) }}
from {{ ref('base_service_all') }} bs
join {{ ref ('stg_companies')}} sc
on bs.company_id = sc.company_id
group by 1,2,3,4,5,6