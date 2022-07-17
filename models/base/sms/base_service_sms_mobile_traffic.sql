select
  {{ dbt_utils.star(ref('stg_messaging_mobile_traffic')) }}
from {{ ref('stg_messaging_mobile_traffic') }}