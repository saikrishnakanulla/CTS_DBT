{{config(materialized='table', schema = 'TRANSFORMING_DEV')}}

select ss.orderid,ss.lineno,sh.companyname,ss.shipmentdate,ss.Status
from {{ref('shipments_snapshot')}} as ss left join
{{ref('Lkp_Shippers')}} as sh on ss.shipperid = sh.shipperid
where ss.dbt_valid_to is null