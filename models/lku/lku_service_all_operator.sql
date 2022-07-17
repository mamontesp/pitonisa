{{ dbt_utils.union_relations(
    relations=[ref('lku_service_sms_mobile_by_operator'),ref('lku_service_internet_mobile_by_operator'), ref('lku_service_tv_by_operator'), ref('lku_service_voice_mobile_by_operator') ]
) }}