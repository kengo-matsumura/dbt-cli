{%- macro limit_data_in_dev(timestamp_col, last_n_days = 3) -%}
    {% if target.name == 'dev' %}
    where {{ timestamp_col }} >= dateadd('day', -{{ last_n_days }}, current_timestamp)
    {% endif %}
{%- endmacro -%}
