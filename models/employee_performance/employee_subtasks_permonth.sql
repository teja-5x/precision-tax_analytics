{{ config(materialized='table') }}

select 
    E.ID,
    E.FirstName,
    Count(CT.ContactTasks_SubTasksId) as SubTasksCountPerEmployee
from Fivetran_db.SQL_Server_DBO.Employees E  
JOIN Fivetran_db.SQL_Server_DBO.ContactTasks_SubTasks CT 
ON CT.AssignedToEmployeeID = E.ID
where 
    E.InActive = 0 
    and YEAR(CT.InsertedDate)  = YEAR(CURRENT_TIMESTAMP)
    and MONTH(CT.InsertedDate) = MONTH(CURRENT_TIMESTAMP)
group by E.ID, E.FirstName
order by 3 desc