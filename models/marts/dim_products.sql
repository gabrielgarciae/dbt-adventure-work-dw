{{ config(alias='products') }}

WITH production_products as (
    SELECT *
    FROM {{ ref('stg_production_product') }}
)

SELECT * 
FROM production_products