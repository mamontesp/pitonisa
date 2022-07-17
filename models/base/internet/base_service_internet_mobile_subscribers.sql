select 
'internet' as service,
'mobile' as service_type,
payment_mode_name as consumption_mode,
year, 
quarter, 
month,
company_id,
company_name, 
null segment_id,
null segment_name,
terminal_id,
terminal_name,
technology_id,
technology_name,
ct_subscribers
from {{ ref('stg_internet_mobile_subscribers') }}

union all

select 
'internet' as service,
'mobile' as service_type,
'subscription' as consumption_mode,
year, 
quarter, 
month,
company_id,
company_name, 
segment_id,
segment_name,
terminal_id,
terminal_name,
technology_id,
technology_name,
ct_subscribers::INTEGER
from {{ ref('stg_internet_mobile_fixed_charge_subscribers') }}
