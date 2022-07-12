{{ config(schema='stg') }}

select _airbyte_data::json->>'ANNO' as year,
_airbyte_data::json->>'TRIMESTRE' as quarter,
_airbyte_data::json->>'ID_EMPRESA' as company_id,
_airbyte_data::json->>'EMPRESA' as company_name,
_airbyte_data::json->>'ID_CONCEPTO' as concept_id,
_airbyte_data::json->>'CONCEPTO' as concept,
_airbyte_data::json->>'ID_SERVICIO' as service_id,
_airbyte_data::json->>'SERVICIO' as service,
_airbyte_data::json->>'INGRESOS' as reported_income
from raw._airbyte_raw_fixed_internet_income