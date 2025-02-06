{{config(materialized = 'table', schema = 'transforming_dev')}}

select 
o.orderID,
od.lineno,
o.customerid,
o.employeeid,
o.shipperid,
od.productid,
od.quantity,
od.unitprice,
od.discount,
od.orderdate,
to_decimal((od.unitprice * od.quantity),9,2) as linesalesamount,
to_decimal(p.unitcost *od.quantity,9,2) as costofgodssold,
to_decimal(((od.unitprice * od.quantity) * (1-od.discount) - (od.unitprice * od.quantity)),9,2) as margin

from {{ref('Stg_Order')}} as o
inner join {{ref('Stg_OrderDetails')}} as od
on o.orderID = od.orderID
inner join {{ref('Stg_Products')}} as p
on od.productid = p.product_id
