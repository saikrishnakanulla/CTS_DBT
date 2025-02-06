{{config(materialized='table')}}

select 
orderid ,
Lineno ,
Shipperid ,
customerid ,
Productid ,
Employeeid ,
--cast((substring(ShipmentDate,1,9)) as date) as ShipmentDate ,
--TO_DATE(replace(SHIPMENTDATE,'0:00','')) as ShipmentDate,
trim(shipmentdate,'0:00')::date as shipmentdate,
 
Status  from {{source('raw_qwt','raw_shipments')}}