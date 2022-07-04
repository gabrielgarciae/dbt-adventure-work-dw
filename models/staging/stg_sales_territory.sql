WITH source_data as (
    SELECT
        ss.territoryid as territory_id
        ,ss.name as territory_name
        ,ss.countryregioncode as country_region_code
        ,ss.group as territory_group
    FROM {{ source('adventure_works_el', 'sales_salesterritory') }} as ss
)

SELECT * FROM source_data