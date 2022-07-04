WITH source_data as (
    SELECT
        businessentityid as person_id
        ,firstname
        ,lastname
    FROM {{ source('adventure_works_el', 'person_person') }}
)

SELECT * FROM source_data