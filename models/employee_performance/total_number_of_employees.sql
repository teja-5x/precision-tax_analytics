{{ config(materialized='table') }}

with Employee_Count as (
    select 
        count(1) as Total_Number_Of_Employees
    from 
        Fivetran_db.SQL_Server_DBO.Employees
    where INACTIVE = FALSE
    order by ID
)
select * from Employee_Count
