{{ config(alias='sales_reasons') }}

WITH sales_reason as (
    SELECT *
    FROM {{ ref('stg_sales_reason') }}
)

, sales_order_reason_header as (
    SELECT *
    FROM {{ ref('stg_sales_order_header_sales_reason') }}
)

, joining as (
    SELECT 
        ssr.sales_reason_id
        ,sor.sales_order_id
        ,ssr.reason_name
        ,ssr.reason_type
    FROM sales_reason ssr
    LEFT JOIN sales_order_reason_header sor
        ON ssr.sales_reason_id = sor.sales_reason_id
)

SELECT * 
FROM joining