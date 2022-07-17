{{ config(schema='stg') }}

select distinct(company_id),
company_name
from {{ref('eph_companies')}}
where company_name not in 
(
select company_name 
from 
(select company_name, 
row_number() over (
	partition by company_id
	order by company_name) as rn
from 
{{ ref('duplicated_companies') }}) a
where rn > 1
)
