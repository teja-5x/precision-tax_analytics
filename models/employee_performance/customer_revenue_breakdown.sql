{{ config(materialized='table') }}

with temp_table as (
    select 
        C.ContactID,
        CT.Rating
    from Fivetran_db.SQL_Server_DBO.Contacts_2 C 
    JOIN Fivetran_db.SQL_Server_DBO.ContactTasks CT ON 
    C.ContactID = CT.ContactID
),
temp_table2 as (
     select 
        ContactID , --Amount , 
        Count(*) as Num,
        sum(case when rating = 1 then 1 else 0 end) as r1,
        sum(case when rating = 2 then 1 else 0 end) as r2,
        sum(case when rating = 3 then 1 else 0 end) as r3,
        sum(case when rating = 4 then 1 else 0 end) as r4,
        sum(case when rating = 5 then 1 else 0 end) as r5,
        sum(case when rating = 6 then 1 else 0 end) as r6,
        sum(case when rating is null or rating = 0 then 1 else 0 end) as rU
    from temp_table
    group by ContactID
)
--select * from temp_table2;
,
temp_table3 as (
    select 
        ContactID, 
        sum(Amount) as Total_Amount 
    from Fivetran_db.SQL_Server_DBO.Payments 
    where Paid = 1 
    group by ContactID
)
select 
    T2.ContactID, 
    T3.Total_Amount,
    T2.Num, 
    T2.r1, 
    T2.r2, 
    T2.r3,
    T2.r4, 
    T2.r5, 
    T2.r6, 
    T2.rU,
    ((T2.r1+T2.r2)*300 +  T2.r3*400 + T2.r4 * 500 + T2.r5 *650 + T2.r6 *750 + T2.ru * 400) as TaxResolution
from temp_table2 T2 JOIN 
temp_table3 T3 
ON T2.ContactID = T3.ContactID
order by 1 