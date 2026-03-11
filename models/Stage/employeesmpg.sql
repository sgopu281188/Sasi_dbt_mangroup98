{{
    config(
        materialized = 'view',
        database = 'PSB_DIS',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns'
    )
}}

with emp as (

    select
        employee_id,
        First_Name ||'-'||Last_Name AS Full_Name,        
        {{ empsal('salary') }} AS Monthly_Salary
    from {{ source('DE_L1', 'employees') }}

)

select * from emp