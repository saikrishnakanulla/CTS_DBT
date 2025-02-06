--select *from qwt_analytics.raw_dev.raw_products

select *from {{source('raw_qwt','raw_products')}}