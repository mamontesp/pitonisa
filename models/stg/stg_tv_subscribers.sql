{{ config(schema='stg') }}

select _airbyte_data::json->>'ANNO' as year,
_airbyte_data::json->>'TRIMESTRE' as quarter,
_airbyte_data::json->>'MES' as month,
_airbyte_data::json->>'ESAL' as esal_id,
_airbyte_data::json->>'ID_OPERADOR' as company_id,
_airbyte_data::json->>'OPERADOR' as company_name,
_airbyte_data::json->>'TIPO_OPERADOR' as company_type,
_airbyte_data::json->>'SEGMENTO' as segment_id,
_airbyte_data::json->>'DESC_SEGMENTO' as segment_name,
_airbyte_data::json->>'ID_MUNICIPIO' as municipality_id,
_airbyte_data::json->>'MUNICIPIO' as municipality,
_airbyte_data::json->>'DEPARTAMENTO' as department,
_airbyte_data::json->>'ID_DEPARTAMENTO' as department_id,
_airbyte_data::json->>'TIPO_TECNOLOGIA' as technology_id,
_airbyte_data::json->>'DES_TIPO_TECNOLOGIA_TELEVISION' as technology_name,
cast(_airbyte_data::json->>'SUSCRIPTORES'as BIGINT)  as ct_subscribers
from raw._airbyte_raw_subscribers_tv
