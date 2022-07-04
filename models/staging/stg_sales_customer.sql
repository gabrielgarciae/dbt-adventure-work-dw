WITH source_data as (
    SELECT
        customerid as customer_id
        ,personid as person_id
        ,storeid as store_id
        ,territoryid as territory_id
    FROM {{ source('adventure_works_el', 'sales_customer') }}
)

SELECT * FROM source_data
