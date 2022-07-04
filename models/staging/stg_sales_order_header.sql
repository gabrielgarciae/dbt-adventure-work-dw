WITH source_data as (
    SELECT
        customerid as person_id
        ,salesorderid as sales_order_id
        ,cast(orderdate as date) as order_date 
        ,status as sales_status
    FROM {{ source('adventure_works_el', 'sales_salesorderheader') }}
)

SELECT * FROM source_data