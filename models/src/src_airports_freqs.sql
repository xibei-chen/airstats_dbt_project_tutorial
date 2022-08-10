WITH airports_freqs AS (
    SELECT
        *
    FROM
       {{ source('airstats', 'airports_freqs') }}
)
SELECT
    id as airport_freq_id,
    airport_ident,
    type as airport_freq_type,
    description as airport_freq_description
FROM
    airports_freqs