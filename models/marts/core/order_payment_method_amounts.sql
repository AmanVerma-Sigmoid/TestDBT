{%- set payment_methods = get_payment_methods() -%}

select
orderid,
{%- for payment_method in payment_methods %}
sum(case when paymentmethod = '{{payment_method}}' then amount end) as {{payment_method}}_amount
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{ ref('stg_payment') }}
group by 1