{% macro empsal(column_name) %}
  ({{ column_name }} * 2)
{% endmacro %}
