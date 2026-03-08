{{
    config(
        materialized = 'table',
        database = 'COMPANY',
        unique_key = 'location_id',
        on_schema_change = 'append_new_columns'
    )
}}

with loc as (

    select
        location_id,
        street_address || ' ' || city AS street_address,
        postal_code,
        city,
        state_province,
        country_id
    from {{ source('HR', 'locations') }}

)

select * from loc