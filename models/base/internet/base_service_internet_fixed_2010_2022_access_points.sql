{{ dbt_utils.union_relations(
    relations=[ref('stg_internet_fixed_2010_2017_access_points'),ref('stg_internet_fixed_2017_2022_access_points') ]
) }}