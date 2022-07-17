select 
company_id, 
company_name,
segment,
string_agg(technology_name, ',') used_technologies_internet,
sum(internet) as ct_access_points,
sum(telephone) as ct_telephone_lines
from 
{{ref('rpt_capacity')}}
where department_id='76'
and year='2017'
and quarter = '4'
and municipality_id='76001'
and segment ilike '%Residencial - Estrato 1%'
group by 1,2,3