{{ config(materialized='view') }}

select Sum(Total) as Total_Tax_Prep_Revenue
from {{ ref('AllBillingContracts') }}
where TPO = 1