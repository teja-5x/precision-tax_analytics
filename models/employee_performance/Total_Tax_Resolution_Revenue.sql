{{ config(materialized='view') }}

select Sum(Total) as Total_Tax_Resolution_Revenue
from {{ ref('AllBillingContracts') }}
where TPO = 0