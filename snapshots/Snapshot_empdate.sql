{% snapshot employ_version1 %}

{{
    config(
      target_schema='SNAPSHOT',
      unique_key='employee_no',
      strategy='timestamp',
      updated_at='updated_current_time'
    )
}}

select *
from {{ source('DE_L1','employees') }}

{% endsnapshot %}}