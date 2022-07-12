{{ config(schema='stg') }}
{{ config(materialized='ephemeral') }}

select _airbyte_data::json#>> '{ANNO;TRIMESTRE;MES_DEL_TRIMESTRE;ID_EMPRESA;EMPRESA;ID_MODALIDAD_PAGO;MODALIDAD_PAGO;ID_TERMINAL;TERMINAL;ID_TECNOLOGIA;TECNOLOGIA;CANTIDAD_ABONADOS}' as data
from raw._airbyte_raw_subscribers_internet_mobile