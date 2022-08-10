WITH dim_airports_filtered AS (
    SELECT * FROM {{ ref('dim_airports_filtered') }}
),
dim_airports_freqs_aggregated AS (
    SELECT * FROM {{ ref('dim_airports_freqs_aggregated') }}
),
dim_navaids_aggregated AS (
    SELECT * FROM {{ ref('dim_navaids_aggregated') }}
),
dim_runways_aggregated AS (
    SELECT * FROM {{ ref('dim_runways_aggregated') }}
),
src_countries AS (
    SELECT * FROM {{ ref('src_countries') }}
),
src_regions AS (
    SELECT * FROM {{ ref('src_regions') }}
)

SELECT
  a.*,
  af.num_of_freqs,
  n.num_of_navaids,
  r.num_of_runways,
  substring(sr.iso_region,1,2) as iso_country,
  c.continent,
  sr.local_code
FROM
  dim_airports_filtered a
LEFT JOIN 
  dim_airports_freqs_aggregated af
USING (airport_ident)
LEFT JOIN
  dim_navaids_aggregated n
USING (airport_ident)
LEFT JOIN
  dim_runways_aggregated r
USING (airport_ident)
LEFT JOIN
  src_regions sr
USING (iso_region)
LEFT JOIN 
  src_countries c
ON (substring(sr.iso_region,1,2) = c.iso_country)
