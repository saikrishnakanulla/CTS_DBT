{{config(materialized='table',schema = 'transforming_dev')}}

select 
emp.EmpId,
emp.first_name,
emp.last_name,
emp.title,
emp.hire_date,
emp.extension,
emp.year_salary,
IFF(mgr.first_name is null,emp.first_name,mgr.first_name) as managername,
IFF(mgr.title is null, emp.title,mgr.title) as managertitle,
offc.address,
offc.officecity,
offc.country
from {{ref("stg_Employee")}} as emp
left join {{ref("stg_Employee")}} as mgr on emp.reports_to = mgr.EmpId
left join {{ref('Stg_Office')}} as offc on emp.office = offc.office