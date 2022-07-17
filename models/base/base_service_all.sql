select 
'internet' as service,
'count of subscriptors' as description,
year, 
quarter, 
company_id,
company_name, 
segment_id,
segment_name, 
technology_id,
technology_name,
ct_subscribers as ct_service
from {{ ref('base_service_internet_mobile_subscribers') }}

union all

select 
'sms' as service,
'count of sms' as description,
year, 
quarter, 
company_id,
company_name, 
null segment_id,
null segment_name, 
null technology_id,
null technology_name,
ct_messages as ct_service
from {{ ref('base_service_sms_mobile_traffic') }}

union all 

select 
'tv' as service,
'count of subscriptors' as description,
year, 
quarter, 
company_id,
company_name, 
segment_id,
segment_name, 
technology_id,
technology_name,
ct_subscribers as ct_service
from {{ ref('base_service_tv_subscribers') }}

union all

select 
'voice' as service,
'count of subscriptors' as description,
year, 
quarter, 
company_id,
company_name, 
null segment_id,
null segment_name, 
null technology_id,
null technology_name,
ct_subscribers as ct_service
from {{ ref('base_service_voice_mobile_subscribers') }}