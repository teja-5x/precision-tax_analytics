{{ config(materialized='table') }}

with Employees as (
    select 
        *
    from 
        Fivetran_db.SQL_Server_DBO.Employees
    --where INACTIVE = FALSE
    order by ID
)
select * from Employees
