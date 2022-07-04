WITH source_data as (
    SELECT
        specialofferid as special_offer_id
        ,description as special_offer_description
        ,type as special_offer_type
        ,category
        ,minqty as min_qty
        ,maxqty as max_qty
    FROM {{ source('adventure_works_el', 'sales_specialoffer') }}
)

SELECT * FROM source_data