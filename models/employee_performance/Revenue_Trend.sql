{{ config(materialized='view') }}

select 
    MONTH(billingEndDate) as MONTH, 
    Year(billingEndDate) as YEAR,
    SUM (CASE WHEN tpo = 1 THEN Total ELSE 0 END ) as Tax_Prep_Revenue,
    SUM (CASE WHEN tpo = 0 THEN Total ELSE 0 END ) as Tax_Resolution_Revenue
from  {{ ref('AllBillingContracts') }}
    where 
        MONTH(billingEndDate) IS NOT NULL and 
        Year(billingEndDate) IS NOT NULL
    group by 
        MONTH(billingEndDate), 
        Year(billingEndDate)
    order by 
        Year(billingEndDate) desc, 
        MONTH(billingEndDate) desc
