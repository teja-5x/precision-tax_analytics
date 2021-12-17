{{ config(materialized='table') }}

with temp_table as (
    select 
    from Fivetran_db.SQL_Server_DBO.contacts_2
)
select * from temp_table;