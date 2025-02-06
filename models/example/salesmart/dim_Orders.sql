{{config(materialized ='view', schema = 'salesmart_dev')}}

select *From {{ref('trf_Orders')}}