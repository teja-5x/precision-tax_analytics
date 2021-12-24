{{ config(materialized='view') }}

select count(distinct(ContactID))
from {{ ref('Current_Year_Resolution_Contracts') }}
where 

