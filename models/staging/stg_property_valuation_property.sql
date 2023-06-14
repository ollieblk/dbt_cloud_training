with source as (

    select * from {{ source('property', 'valuation_property') }}

),

renamed as (

    select
        wufi,
        roll_number,
        assessment_number,
        assessment_suffix,
        concat(roll_number,'-',assessment_number,'-',assessment_suffix) as val_ref,
        valuation_updated_date,
        valued_land_area,
        valued_land_area_units,
        legal_description,
        pt_indicator,
        parcel_type,
        parcel_digit,
        index_type,
        name_number,
        improvements_desc,
        trees,
        number_extension,
        corner_ind,
        tenure_code,
        rateability_code,
        ownership_code,
        apportionment_code,
        special_values_code,
        tla_code,
        ward_code,
        received_date,
        status,
        effective_date,
        review_network_validity,
        lands_link_num,
        status_comment,
        title_ref_1,
        title_ref_2,
        more_titles_ind,
        created_date,
        created_user,
        updated_date,
        updated_user,
        timestamp,
        lease_flag,
        hard_copy_file_flag,
        hard_copy_file_type,
        owner_ratepayer_privacy,
        past_owner_ratepayer_privacy,
        loadedtime_utc,
        loadedtime_nz

    from source

)

select * from renamed