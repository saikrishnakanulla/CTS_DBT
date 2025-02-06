{{config(materialized='table', schema = 'SALESMART_DEV')}}

select *from {{ref('trf_shipment')}}