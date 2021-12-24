{{ config(materialized='view') }}

select *
    from {{ ref('AllBillingContracts') }}
where TPO = 0 
and billingEndDate >= CONCAT(year(current_timestamp),'-','01','-','01')