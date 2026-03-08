{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'merge',
        database = 'PSB_DIS',
        schema = 'inc',
        unique_key = 'employee_no',
        on_schema_change = 'append_new_columns'
    )
}}


    select
       *
    from {{ source('DE_L1', 'employees') }}


{% if is_incremental() %}
where last_update_date > (select max(last_update_date) from {{ this }})
{% endif %}