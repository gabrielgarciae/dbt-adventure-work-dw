WITH source_data as (
    SELECT
        salesorderid as sales_order_id
        ,salesreasonid as sales_reason_id
    FROM {{ source('adventure_works_el', 'sales_salesorderheadersalesreason') }}
)

SELECT * FROM source_data