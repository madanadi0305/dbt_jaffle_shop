
  create view "dbt_postgres_etl"."public"."order_payments__dbt_tmp"
    
    
  as (
    

with order_payment_amount as(

select order_id, 

sum(case when payment_method='credit_card' then amount  end ) as credit_card_amount,

sum(case when payment_method='bank_transfer' then amount  end ) as bank_transfer_amount,

sum(case when payment_method='gift_card' then amount  end ) as gift_card_amount,

sum(amount) as payment_amount
from dbt_postgres_etl."public"."payments"
group by order_id

) 
select * from order_payment_amount
  );