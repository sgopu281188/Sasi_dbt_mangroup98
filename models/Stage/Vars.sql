{{
    config(
        materialized = 'table',
        database = 'COMPANY',
        unique_key = 'department_id',
        on_schema_change = 'append_new_columns'
    )
}}

select *
from
{{ref('departments')}} where manager_id in ({{ var("manager_ids") | join(",") }}) 
