{{ config(materialized='table') }}

with customers as 
(
    select 
        *
    from 
    Fivetran_db.SQL_Server_DBO.BillingContracts
    where TPO = 0 
    and billingEndDate >= CONCAT(year(current_timestamp),'-','01','-','01')
)
select * from customers