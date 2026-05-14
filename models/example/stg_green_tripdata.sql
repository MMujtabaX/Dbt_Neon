-- models/staging/raw/stg_green_tripdata.sql
{{ config(schema='stg', materialized='view') }}

SELECT
    CAST("VendorID" AS INT) AS vendor_id,
    "lpep_pickup_datetime",
    "lpep_dropoff_datetime",
    "store_and_fwd_flag",
    "RatecodeID",
    "PULocationID",
    "DOLocationID",
    "passenger_count",
    "trip_distance",
    "fare_amount",
    "extra",
    "mta_tax",
    "tip_amount",
    "tolls_amount",
    "ehail_fee",
    "improvement_surcharge",
    "total_amount",
    "payment_type",
    "trip_type",
    "congestion_surcharge"
FROM {{ source('raw', 'green_tripdata_2021_07') }}
WHERE "total_amount" > 0
  AND "trip_distance" > 0