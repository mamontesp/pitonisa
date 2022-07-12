{{ config(schema='stg') }}

select _airbyte_data::json->>'ANNO' as year,
_airbyte_data::json->>'TRIMESTRE' as quarter,
_airbyte_data::json->>'MES' as month,
_airbyte_data::json->>'ID_EMPRESA' as company_id,
_airbyte_data::json->>'EMPRESA' as company_name,
_airbyte_data::json->>'ID_SEGMENTO' as segment_id,
_airbyte_data::json->>'SEGMENTO' as segment,
_airbyte_data::json->>'ID_MUNICIPIO' as municipality_id,
_airbyte_data::json->>'MUNICIPIO' as municipality,
_airbyte_data::json->>'ID_DEPARTAMENTO' as department_id,
_airbyte_data::json->>'DEPARTAMENTO' as department,
_airbyte_data::json->>'ID_UBICACION' as location_id,
_airbyte_data::json->>'UBICACION' as location,
_airbyte_data::json->>'LINEAS' as ct_lines
from raw._airbyte_raw_local_telephone_lines