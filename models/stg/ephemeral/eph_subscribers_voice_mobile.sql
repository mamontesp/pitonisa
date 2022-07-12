{{ config(schema='stg') }}
{{ config(materialized='ephemeral') }}

select _airbyte_data::json->>'ANNO;TRIMESTRE;MODALIDAD;ID_PROVEEDOR;PROVEEDOR; ABONADOS ' as data
from raw._airbyte_raw_subscribers_voice_mobile