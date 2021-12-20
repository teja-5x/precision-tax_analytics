{{ config(materialized='table') }}

with temp_table as (
    select top 10 * 
    from Fivetran_db.SQL_Server_DBO.contacts_2
)
select * from temp_table