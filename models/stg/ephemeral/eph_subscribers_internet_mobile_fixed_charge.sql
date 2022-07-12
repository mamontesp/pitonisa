{{ config(schema='stg') }}
{{ config(materialized='ephemeral') }}

select _airbyte_data::json->>'ANNO;TRIMESTRE;MES_DEL_TRIMESTRE;ID_SEGMENTO;SEGMENTO;ID_EMPRESA;EMPRESA;ID_TERMINAL;TERMINAL;ID_TECNOLOGIA;TECNOLOGIA;CANTIDAD_SUSCRIPTORES' as data
from raw._airbyte_raw_subscribers_internet_mobile_fixed_charge