{{
    config(
        materialized = 'table',
        database = 'PSB_DIS',
        unique_key = 'department_id',
        on_schema_change = 'append_new_columns'
    )
}}

select *
from
{{ref('department')}} where manager_id in ({{ var("manager_ids") | join(",") }}) 
