{{ config(materialized='view') }}

select *
from {{ ref('TotalEmployees') }}
where INACTIVE = FALSE