{{ config(materialized='view') }}

select count(distinct(ContactID)) as Total_Number_Of_Resolution_Clients
from {{ ref('Current_Year_Contracts') }}
where TPO = 0