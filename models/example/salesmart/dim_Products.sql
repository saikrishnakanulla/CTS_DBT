{{config(materialized='view', schema = 'SALESMART_DEV')}}

select *from {{ref('trf_Product')}}