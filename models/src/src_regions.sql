WITH regions AS (
    SELECT
        *
    FROM
       {{ source('airstats', 'regions') }}
)
SELECT
    code as iso_region,
    local_code,
    name as region_name,
    continent,
    iso_country
FROM
    regions