WITH navaids AS (
    SELECT
        *
    FROM
       {{ source('airstats', 'navaids') }}
)
SELECT
    id as navaid_id,
    name as navaid_name,
    type as navaid_type,
    usageType as navaid_usage_type,
    associated_airport as airport_ident
FROM
    navaids