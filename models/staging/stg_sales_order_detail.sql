WITH source_data as (
    SELECT
        salesorderid as sales_order_id
        ,productid as product_id
        ,orderqty as order_qty
        ,unitprice as unit_price
        ,specialofferid as special_offer_id
        ,unitpricediscount as unit_price_discount
    FROM {{ source('adventure_works_el', 'sales_salesorderdetail') }}
)

SELECT * FROM source_data