{{
    config(
        materialized = 'view',
        database = 'COMPANY',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns'
    )
}}

with emp as (

    select
        employee_id,
        first_name,
        last_name,
        first_name || ' ' || last_name as full_name,
        department_id,
        manager_id
    from {{ source('HR', 'employees') }}

)

select * from emp