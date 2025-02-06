{{config(materialized = 'table', schema = 'transforming_dev')}}

select c.customer_id,c.comapanyname,
c.contactname,c.city,c.country,d.divisionname,
c.address,c.fax,c.phone,c.postalcode,
IFF(c.stateprovince = '', 'NA', c.stateprovince) as stateprovincename
from {{ref('Stg_Customers')}} as c
inner join {{ref('Lkp_division')}} as d
on c.divisionid = d.divisionid