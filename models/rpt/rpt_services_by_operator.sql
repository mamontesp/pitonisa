select
  year,
  quarter,
  so.company_id,
  sc.company_name,
  {{ dbt_utils.pivot(
      column='service',
      values=dbt_utils.get_column_values(ref('lku_services_by_operator'), 'service')
  ) }}
from {{ ref('lku_services_by_operator') }} so
join {{ ref ('stg_companies')}} sc
on so.company_id = sc.company_id
group by 1,2,3,4