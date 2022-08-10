WITH countries AS (
    SELECT
        *
    FROM
       {{ source('airstats', 'countries') }}
)
SELECT
    code as iso_country,
    name as country_name,
    continent
FROM
    countries