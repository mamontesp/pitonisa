{{ config(schema='stg') }}

select _airbyte_data::json->>'ANNO' as year,
_airbyte_data::json->>'TRIMESTRE' as quarter,
_airbyte_data::json->>'ID_EMPRESA' as company_id,
_airbyte_data::json->>'EMPRESA' as company_name,
_airbyte_data::json->>'ID_SEGMENTO' as segment_id,
_airbyte_data::json->>'SEGMENTO' as segment,
_airbyte_data::json->>'ID_MUNICIPIO' as municipality_id,
_airbyte_data::json->>'MUNICIPIO' as municipality,
_airbyte_data::json->>'ID_DEPARTAMENTO' as department_id,
_airbyte_data::json->>'DEPARTAMENTO' as department,
_airbyte_data::json->>'ID_TECNOLOGIA' as technology_id,
_airbyte_data::json->>'TECNOLOGIA' as technology_name,
_airbyte_data::json->>'VELOCIDAD_EFECTIVA_DOWNSTREAM' as eff_downstream_speed,
_airbyte_data::json->>'VELOCIDAD_EFECTIVA_UPSTREAM' as eff_upstream_speed,
cast(_airbyte_data::json->>'ACCESOS' as BIGINT) as ct_access_points
from raw._airbyte_raw_fixed_internet_2017_2022