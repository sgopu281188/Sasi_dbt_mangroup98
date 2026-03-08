{{
    config(
        materialized = 'table',
        database = 'PSB_DIS',
        unique_key = 'employee_no',
        on_schema_change = 'append_new_columns'
    )
}}

select *
from
{{ref('employees')}} where manager_id in ({{ var("years") | join(",") }}) 
employees where years in var{{years}}