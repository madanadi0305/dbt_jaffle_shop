
{% set payment_methods = ["credit_card","bank_transfer","gift_card"] %}

with order_payment_amount as(

select order_id, 
{% for payment_method in payment_methods %}
sum(case when payment_method='{{payment_method}}' then amount  end ) as {{payment_method}}_amount,
{% endfor %}
sum(amount) as payment_amount
from dbt_postgres_etl."public"."payments"
group by order_id

) 
select * from order_payment_amount