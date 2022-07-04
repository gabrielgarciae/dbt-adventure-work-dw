WITH source_data as (
    SELECT
        productid as product_id
        ,name as product_name
        ,productnumber as product_number
        ,color
    FROM {{ source('adventure_works_el', 'production_product') }}
)

SELECT * FROM source_data