{{ config(materialized='view') }}

select *
from {{ ref('AllEmployees') }}
where INACTIVE = FALSE