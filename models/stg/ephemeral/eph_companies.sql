{{ config(schema='stg') }}
{{ config(materialized='ephemeral') }}

{{ dbt_utils.union_relations(
    relations=[ref('stg_internet_fixed_2017_2022_access_points'),ref('stg_internet_mobile_fixed_charge_subscribers'),ref('stg_messaging_mobile_traffic'),ref('stg_tv_subscribers'),ref('stg_internet_fixed_2010_2017_access_points'),ref('stg_internet_fixed_income'),ref('stg_internet_mobile_subscribers'),ref('stg_telephone_local_lines'),ref('stg_voice_mobile_subscribers')],
    include = ["company_id", "company_name"]
) }}



