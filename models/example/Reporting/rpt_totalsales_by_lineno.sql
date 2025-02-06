{{config(materialized = 'view', schema = 'reporting_dev')}}
/*
select 
orderid,
sum(case when lineno = 1 then linesalesamount end) as lineno1_amount,
sum(case when lineno = 2 then linesalesamount end) as lineno2_amount,
sum(case when lineno = 3 then linesalesamount end) as lineno3_amount,
sum(linesalesamount) as total_linesalesamount
from {{ref('dim_Orders')}}
group by 1*/
{% set linenos = get_linenos() %}
select 
orderid,
{% for lineno in linenos %}
sum(case when lineno = {{lineno}} then linesalesamount end) as lineno_{{lineno}}_amount,
{% endfor %}
sum(linesalesamount) as total_linesalesamount
from {{ref('dim_Orders')}}
group by 1