WITH source_data as (
    SELECT
        creditcardid as credit_card_id
        ,cardtype as card_type
        ,cardnumber as card_number
    FROM {{ source('adventure_works_el', 'sales_creditcard') }}
)

SELECT * FROM source_data