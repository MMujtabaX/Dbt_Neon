# 🚕 NYC Green Taxi Analytics Pipeline

![dbt](https://img.shields.io/badge/dbt-Cloud-orange)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-NeonDB-blue)
![SQL](https://img.shields.io/badge/SQL-Analytics-success)
![Data Engineering](https://img.shields.io/badge/Data-Engineering-purple)

A modern Data Engineering project built using **dbt Cloud** and **Neon PostgreSQL** to transform and analyze NYC Green Taxi trip data using a layered ELT architecture.

---

# 🎥 Project Demo

<p align="center">
  <img src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHRoc3ZzY3FxbGdtbTU2NTA0bWZ6NjdvOWExcmtjdjRnOHUyY3NtMCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/4FQMuOKR6zQRO/giphy.gif" width="700">
</p>

---

# 📌 Project Overview

This project demonstrates a complete mini data warehouse pipeline:

- Loading raw CSV datasets
- Transforming data with dbt
- Building staging and mart layers
- Performing business analytics with SQL
- Using cloud-native PostgreSQL database infrastructure

The project follows modern analytics engineering practices used in real-world companies.

---

# 🏗️ Architecture

```text
CSV Files
   ↓
dbt Seeds
   ↓
Raw Layer (Neon PostgreSQL)
   ↓
Staging Layer (Cleaned Views)
   ↓
Mart Layer (Business Tables)
   ↓
Analytics Queries & Insights
```

---

# ⚡ Tech Stack

| Technology | Purpose |
|---|---|
| dbt Cloud | Data Transformation |
| Neon PostgreSQL | Cloud Database |
| SQL | Data Analysis |
| dbt Seeds | CSV Loading |
| dbt Models | Transformations |
| GitHub | Version Control |

---

# 📂 Project Structure

```bash
.
├── seeds/
│   ├── green_tripdata_2021_07.csv
│   └── taxi_zone_lookup.csv
│
├── models/
│   ├── staging/
│   │   ├── stg_green_tripdata.sql
│   │   ├── stg_zone_lookup.sql
│   │   └── src.yml
│   │
│   └── business/
│       └── fact_trips.sql
│
└── dbt_project.yml
```

---

# 🔄 Data Pipeline Layers

## 1️⃣ Raw Layer

- Stores original taxi datasets
- Loaded using `dbt seed`
- Acts as source-of-truth data

### Example Validation Query

```sql
SELECT COUNT(*)
FROM dbt_mkhan_raw.green_tripdata_2021_07;
```

---

## 2️⃣ Staging Layer

Data cleaning and transformation layer:

- Removed invalid trips
- Standardized datatypes
- Created reusable SQL views

### Key Cleaning Logic

```sql
WHERE total_amount > 0
AND trip_distance > 0
```

---

## 3️⃣ Mart Layer

Business-ready analytics table:

### `fact_trips`

Contains:

- trip date
- fare amount
- tip amount
- passenger count
- pickup/dropoff zones

Built using JOINs with zone lookup tables.

---

# 📊 Business Analytics

## Top Revenue Generating Pickup Zones

```sql
SELECT pickup_zone,
       CAST(SUM(total_amount) AS DECIMAL(10,2)) AS revenue
FROM dbt_smubashir_mart.fact_trips
GROUP BY pickup_zone
ORDER BY revenue DESC
LIMIT 10;
```

---

## High Tipping Routes Analysis

```sql
SELECT pickup_zone,
       dropoff_zone,
       AVG(fare_amount) AS avg_fare,
       AVG(tip_amount) AS avg_tip,
       COUNT(*) AS num_trips
FROM dbt_smubashir_mart.fact_trips
GROUP BY pickup_zone, dropoff_zone
ORDER BY avg_tip DESC
LIMIT 50;
```

This query identifies:

- premium taxi routes
- highest tipping customers
- busy travel paths
- route profitability

---

# 🚀 How to Run the Project

## 1️⃣ Clone Repository

```bash
git clone https://github.com/your-username/nyc-green-taxi-analytics.git
```

---

## 2️⃣ Setup dbt Cloud

- Create dbt Cloud account
- Connect GitHub repository
- Connect Neon PostgreSQL database

---

## 3️⃣ Upload Seed Files

Place CSVs inside:

```bash
seeds/
```

---

## 4️⃣ Run Seeds

```bash
dbt seed
```

---

## 5️⃣ Run Models

```bash
dbt run
```

---

## 6️⃣ Build Entire Pipeline

```bash
dbt build
```

---

# 📈 Key Concepts Learned

- ELT Pipeline
- Analytics Engineering
- dbt Models
- dbt Seeds
- Source Configuration
- Data Cleaning
- Fact Tables
- SQL Aggregation
- Data Warehousing
- PostgreSQL Analytics

---

# 🌟 Real-World Relevance

This project simulates workflows used by companies like:

- Uber
- Lyft
- Airbnb
- Amazon

for analytics engineering and business intelligence.

---
