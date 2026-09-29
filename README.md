# Coursework Part C – DWBI

**Subject:** Data Warehousing and Business Intelligence

## Solution Summary

The coursework presents a data warehouse and business intelligence solution designed for Lotus Care Outpatient Clinics. Raw operational datasets are processed and transformed into a dimensional model based on a star schema. The resulting warehouse is then used for OLAP analysis and business reporting.

## Repository Layout

```text
cw-c/
│
├── data/
│   ├── appointments_raw.csv
│   ├── doctors.csv
│   ├── clinics.csv
│   ├── patients.csv
│   └── patient_updates.csv
│
├── notebook.ipynb
├── ddl.sql
├── load.sql
└── olap_queries.sql
```

### Main Components

**Source Data:**
Contains the original CSV files supplied for the coursework.

**ETL Notebook:**
Used to inspect the data, apply cleaning and transformation steps, and create surrogate keys required by the warehouse.

**DDL Script:**
Defines the tables and dimensional structure of the data warehouse.

**Loading Script:**
Provides PostgreSQL commands for importing the prepared datasets.

**OLAP Script:**
Contains queries for different analytical views, including slice, dice, roll-up, drill-down, and pivot operations.

### Tools Used

The implementation was completed using PostgreSQL, Python, Pandas, Jupyter Notebook, DBeaver Community, and Metabase Community.
