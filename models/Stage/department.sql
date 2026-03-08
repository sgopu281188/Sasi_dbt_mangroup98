{{
    config(
        materialized = 'view',
        database = 'PSB_DIS',
        unique_key = 'department_id',
        on_schema_change = 'append_new_columns'
    )
}}

with dep as (

    select *
       
    from {{ source('DE_L1', 'departments') }}

)

select * from dep