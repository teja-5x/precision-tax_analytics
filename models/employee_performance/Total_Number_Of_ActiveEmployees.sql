{{ config(materialized='view') }}

select count(1) as Total_Number_Of_Active_Employees
from {{ ref('ActiveEmployees') }}

