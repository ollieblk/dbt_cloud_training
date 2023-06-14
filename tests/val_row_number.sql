select roll_number from {{ ref('stg_property_valuation_property') }} v where v.roll_number < 15650
