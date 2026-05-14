-- models/business/fact_trips.sql
{{ config(schema='mart', materialized='table') }}

SELECT
    t."lpep_pickup_datetime"::DATE AS trip_date,
    t."vendor_id",
    t."passenger_count",
    t."trip_distance",
    t."fare_amount",
    t."tip_amount",
    t."total_amount",
    pu."Zone" AS pickup_zone,
    dol."Zone" AS dropoff_zone
FROM {{ ref('stg_green_tripdata') }} t
LEFT JOIN {{ ref('stg_zone_lookup') }} pu 
  ON t."PULocationID" = pu."LocationID"
LEFT JOIN {{ ref('stg_zone_lookup') }} dol 
  ON t."DOLocationID" = dol."LocationID"
WHERE t.passenger_count > 0