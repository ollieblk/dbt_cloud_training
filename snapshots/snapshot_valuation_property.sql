{% snapshot snapshot_valuation_property %}
    {{
        config(
            target_schema='snapshots_property',
            unique_key='wufi',
            strategy='timestamp',
            updated_at='updated_date'
        )
    }}

    select * from {{ source('property', 'valuation_property') }}
 {% endsnapshot %}