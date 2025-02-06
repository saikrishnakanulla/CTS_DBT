{{config(materialized = 'incremental', unique_key = ['orderID','lineno'])}}


select 
a.*, b.orderdate from {{source('raw_qwt','raw_orderDetails')}}  as a
inner join {{source('raw_qwt','raw_orders')}} as b on a.orderID = b.orderID

{% if is_incremental() %}

where b.orderdate > (select max(orderdate) from {{this}})


{%  endif %}
