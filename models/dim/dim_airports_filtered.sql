WITH src_airports AS (
    SELECT
        *
    FROM
        {{ ref('src_airports') }}
)
SELECT
    airport_ident,
    airport_type,
    airport_lat,
    airport_long,
    iso_region,
    scheduled_service
FROM
    src_airports
WHERE 
    airport_type != 'closed'