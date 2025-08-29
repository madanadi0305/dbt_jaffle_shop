
  create view "dbt_postgres_etl"."public"."customers__dbt_tmp"
    
    
  as (
    select * from dbt_postgres_etl.customers;
  );