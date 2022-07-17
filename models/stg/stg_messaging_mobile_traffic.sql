{{ config(schema='stg') }}

select _airbyte_data::json->>'ANNO' as year,
_airbyte_data::json->>'TRIMESTRE' as quarter,
_airbyte_data::json->>'ID_EMPRESA' as company_id,
_airbyte_data::json->>'EMPRESA' as company_name,
cast (replace(_airbyte_data::json->>'CANTIDAD', ',', '.') as NUMERIC)::BIGINT as ct_messages
from raw._airbyte_raw_traffic_messaging_mobile

