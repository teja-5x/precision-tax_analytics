{{ config(materialized='view') }}

select count(1)
from {{ ref('ActiveEmployees') }}

