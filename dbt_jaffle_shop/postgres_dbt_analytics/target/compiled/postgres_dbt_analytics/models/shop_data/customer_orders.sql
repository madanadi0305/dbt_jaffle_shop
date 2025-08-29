


with customer_orders as (
select user_id,

count(case when  status='return_pending' then 1 else 0 end) as return_pending_count ,

count(case when  status='returned' then 1 else 0 end) as returned_count ,

count(case when  status='completed' then 1 else 0 end) as completed_count ,

count(case when  status='placed' then 1 else 0 end) as placed_count ,

count(case when  status='shipped' then 1 else 0 end) as shipped_count ,

 count(*) as number_of_orders from dbt_postgres_etl."public"."orders" 
 
group by user_id
)
select * from customer_orders