{% set order_statuses=["return_pending","returned","completed","placed","shipped"] %}


with customer_orders as (
select user_id,
{% for order_status in order_statuses %}
count(case when  status='{{order_status}}' then 1 else 0 end) as {{order_status}}_count ,
{% endfor %}
 count(*) as number_of_orders from dbt_postgres_etl."public"."orders" 
 
group by user_id
)
select * from customer_orders