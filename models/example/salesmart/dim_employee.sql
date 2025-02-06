{{config(materialized='view',schema = 'SALESMART_DEV')}}

select *from {{ref('Trf_Employee')}}