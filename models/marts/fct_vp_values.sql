with vv as (
    select * from {{ ref('stg_property_valuation_values') }}
), vp as(
    select * from {{ ref('stg_property_valuation_property') }}
)

select
    vp.wufi,
    vp.val_ref,

    vv.land_value,
    vv.capital_value

from vp

join vv on vv.wufi = vp.wufi and vv.rn_latest = 1