{{ config(materialized='table') }}

--select *from qwt_analytics.raw_dev.raw_customers

select *from {{source('raw_qwt','raw_customers')}}