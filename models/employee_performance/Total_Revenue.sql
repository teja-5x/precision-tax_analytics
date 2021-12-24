{{ config(materialized='view') }}

select Sum(Total) as Total_Revenue
from {{ ref('AllBillingContracts') }}