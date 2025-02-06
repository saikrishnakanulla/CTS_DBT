{{ config(materialized="incremental", unique_key=['Order_ID', 'lineno']) }}
select o1.*, o2.orderdate
from {{ source('raw_qwt', 'RAW_ORDER_DETAILS') }} as o1
inner join {{ source('raw_qwt', 'raw_orders') }} as o2 on o1.orderid = o2.orderid
 
{% if is_incremental() %}
    where o1.order_date > (select max(order_date) from {{ this }})
{% endif %}