with source as (

    select * from {{ source('property', 'valuation_values') }}

),

renamed as (

    select
        wufi,
        effective_rating_date,
        valuation_date,
        capital_value,
        land_value,
        special_capital_value,
        special_land_value,
        improvements_value,
        special_improvements_value,
        received_date,
        created_date,
        created_user,
        updated_date,
        updated_user,
        timestamp,
        source,
        comments,
        loadedtime_utc,
        loadedtime_nz,

        row_number() over (partition by wufi order by effective_rating_date desc, 
        received_date desc) rn_latest


    from source

)

select * from renamed
order by wufi, effective_rating_date desc, received_date desc