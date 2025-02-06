{{config(materialized = 'view', schema = 'reporting_dev')}}

select 
e.country,c.comapanyname,c.contactname,
count(o.orderid) as count,
sum(o.quantity) as sum_quantity,
avg(o.margin) as avg_margin
from {{ref('dim_customer')}} as c
inner join {{ref('dim_Orders')}} as o on c.customer_id = o.customerid
inner join {{ref('dim_employee')}} as e on e.empid = o.employeeid
where e.country = '{{var('v_country', 'France') }}'
group by e.country,c.comapanyname,c.contactname
