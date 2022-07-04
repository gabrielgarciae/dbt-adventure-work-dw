{{ config(alias='customers') }}

WITH person_person as (
    SELECT *
    FROM {{ ref('stg_person_person') }}
)

, sales_credit_card as (
    SELECT *
    FROM {{ ref('stg_sales_credit_card') }}

)

, sales_person_credit_card as (
    SELECT *
    FROM {{ ref('stg_sales_person_credit_card') }}

)

, sales_customer as (
    SELECT *
    FROM {{ ref('stg_sales_customer') }}

)

, sales_territory as (
    SELECT *
    FROM {{ ref('stg_sales_territory') }}
)

, joining as (
    SELECT 
        p.person_id
        ,p.firstname
        ,p.lastname
        ,cc.card_type
        ,cc.card_number
        ,sc.customer_id
        ,st.territory_name
        ,st.country_region_code
        ,st.territory_group
    FROM person_person p
    LEFT JOIN sales_person_credit_card spc
        ON p.person_id = spc.person_id

    LEFT JOIN sales_credit_card cc
        ON spc.credit_card_id = cc.credit_card_id

    LEFT JOIN sales_customer sc 
        ON p.person_id = sc.person_id

    LEFT JOIN sales_territory st
        ON sc.territory_id = st.territory_id
)

SELECT * 
FROM joining