

{{ config(materialized='view', schema='reporting_dev')}}
 

select
a12.first_name||' '||a12.last_name as employe_name,
count(a13.customer_id) as total_customers,
count(a14.product_id) as total_products,
sum(a11.linesalesamount) as total_sales
from {{ ref('dim_Orders')}} as a11
left outer join {{ ref("dim_employee")}} as a12 on a11.employeeid = a12.empid
left outer join {{ ref('dim_customer')}} as a13 on a11.customerid = a13.customer_id
left outer join {{ ref('dim_Products')}} as a14 on a11.productid = a14.product_id
group by a12.first_name||' '||a12.last_name

order by sum(a11.linesalesamount) desc