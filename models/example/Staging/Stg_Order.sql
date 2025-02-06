{{config(materialized = 'incremental', unique_key = ['orderID']) }}

select *from {{source('raw_qwt','raw_orders')}}

{% if is_incremental() %}
 
where orderdate > (select max(orderdate) from {{this}} )
 
{% endif %}