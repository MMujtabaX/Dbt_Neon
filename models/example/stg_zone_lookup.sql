-- models/staging/raw/stg_zone_lookup.sql
{{ config(schema='stg', materialized='view') }}

SELECT
    "LocationID",
    "Borough",
    "Zone",
    "service_zone"
FROM {{ source('raw', 'taxi_zone_lookup') }}