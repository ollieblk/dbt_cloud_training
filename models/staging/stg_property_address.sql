with source as (

    select * from {{ source('property', 'property_address') }}

),

renamed as (

    select
        property_address_id,
        unit_type,
        flat_unit,
        level_type,
        level_number,
        building_part,
        building_name,
        street_number,
        street_number_suffix,
        address_locality_id,
        external_street_name,
        external_street_search_name,
        source,
        effective_date,
        created_date,
        created_user,
        updated_date,
        updated_user,
        timestamp,
        loadedtime_utc,
        loadedtime_nz

    from source

)

select * from renamed