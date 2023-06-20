{{
    config(
        materialized='incremental',
        unique_key='wufi'
    )
}}

with vv as (
    select * from {{ ref('stg_property_valuation_values') }}
), vp as(
    select * from {{ ref('stg_property_valuation_property') }}
), final as(
    select
        vp.wufi,
        vp.val_ref,
        vv.received_date,
        vv.land_value,
        vv.capital_value
    from vp

    join vv on vv.wufi = vp.wufi and vv.rn_latest = 1
)

select * from final

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- where received_date > (select max(received_date) from {{ this }})
    where received_date >= (select dateadd('day', -3, max(received_date)) from {{ this }})

{% endif %}

order by received_date desc