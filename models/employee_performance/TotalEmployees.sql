{{ config(materialized='table') }}

with TotalEmployees as (
    select 
        *
    from 
        Fivetran_db.SQL_Server_DBO.Employees
    --where INACTIVE = FALSE
    order by ID
)
select * from TotalEmployees
