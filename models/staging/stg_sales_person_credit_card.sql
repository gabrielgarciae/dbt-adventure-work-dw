WITH source_data as (
    SELECT
        businessentityid as person_id
        ,creditcardid as credit_card_id
    FROM {{ source('adventure_works_el', 'sales_personcreditcard') }}
)

SELECT * FROM source_data