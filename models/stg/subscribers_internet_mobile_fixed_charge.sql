{{ config(schema='stg') }}

select split_part(data, ';', 1) as year,
	split_part(data, ';', 2) as quarter,
	split_part(data, ';', 3) as quarter_month,
	split_part(data, ';', 4) as segment_id,
	split_part(data, ';', 5) as segment_name,
	split_part(data, ';', 6) as company_id,
	split_part(data, ';', 7) as company_name,
	split_part(data, ';', 8) as terminal_id,
	split_part(data, ';', 9) as terminal_name,
	split_part(data, ';', 10) as technology_id,
	split_part(data, ';', 11) as technology_name,
	split_part(data, ';', 12) as ct_subscribers
from {{ref('eph_subscribers_internet_mobile_fixed_charge')}}