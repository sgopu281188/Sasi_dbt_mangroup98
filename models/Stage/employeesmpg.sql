{{
    config(
        materialized = 'view',
        database = 'PSB_DIS',
        unique_key = 'employee_no',
        on_schema_change = 'append_new_columns'
    )
}}

with emp as (

    select
        employee_no,
        First_Name ||'-'||Last_Name AS Full_Name,
        TO_DATE(Start_Date,'DD-MM-YYYY') AS Start_Date, 
        Monthly_Salary
    from {{ source('DE_L1', 'employees') }}

)

select * from emp