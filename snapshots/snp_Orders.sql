{% snapshot shipments_snapshot %}
{{
    config
    (
        target_database = 'QWT_ANALYTICS',
        target_schema = 'SNAPSHOTS_DEV',
        unique_key="orderid||'-'||lineno",       
        strategy = "timestamp",
        updated_at = "shipmentdate"
    )
}}
select *from {{ref('Stg_Shipments')}}
{% endsnapshot %}