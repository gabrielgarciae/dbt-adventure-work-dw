WITH source_data as (
    SELECT
        s.salesreasonid as sales_reason_id
        ,s.name as reason_name
        ,s.reasontype as reason_type
    FROM {{ source('adventure_works_el', 'sales_salesreason') }} s
)

SELECT * FROM source_data