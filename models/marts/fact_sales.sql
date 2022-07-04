{{ config(alias='sales') }}

WITH sales_order_header as (
    SELECT *
    FROM {{ ref('stg_sales_order_header') }}
)

, sales_order_detail as (
    SELECT *
    FROM {{ ref('stg_sales_order_detail') }}
)

, special_offer as (
    SELECT *
    FROM {{ ref('stg_special_offer') }}
)

, joining as (
    SELECT 
        soh.person_id
        ,soh.sales_order_id
        ,sod.product_id
        ,sod.special_offer_id
        ,soh.order_date
        ,soh.sales_status
        ,sod.order_qty
        ,sod.unit_price
        ,(sod.order_qty * sod.unit_price) as full_value
        ,sod.unit_price_discount
        ,so.special_offer_description
        ,so.special_offer_type
        ,so.category
        ,so.min_qty
        ,so.max_qty
FROM sales_order_header soh
LEFT JOIN sales_order_detail sod
    ON soh.sales_order_id = sod.sales_order_id

LEFT JOIN special_offer so
    ON sod.special_offer_id = so.special_offer_id
)

SELECT * 
FROM joining