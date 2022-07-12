{{ config(schema='stg') }}

select split_part(data, ';', 1) as year,
	split_part(data, ';', 2) as quarter,
	split_part(data, ';', 3) as mode_id,
	split_part(data, ';', 4) as company_id,
	split_part(data, ';', 5) as company_name,
	split_part(data, ';', 6) as ct_subscribers
from {{ref('eph_subscribers_voice_mobile')}}
