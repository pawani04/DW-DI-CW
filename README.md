# 📊 Coursework Part C – DWBI

**📚 Subject:** Data Warehousing and Business Intelligence

## 📝 Solution Summary

This coursework presents a **Data Warehouse and Business Intelligence solution** for **Lotus Care Outpatient Clinics**. Raw operational data is cleaned and transformed into a **Star Schema** dimensional model. The resulting warehouse is used for **OLAP analysis and business reporting**.

## 📁 Repository Layout

```text
cw-c/
│
├── 📂 data/
│   ├── appointments_raw.csv
│   ├── doctors.csv
│   ├── clinics.csv
│   ├── patients.csv
│   └── patient_updates.csv
│
├── 📓 notebook.ipynb
├── 🗄️ ddl.sql
├── 📥 load.sql
└── 📊 olap_queries.sql
```

## ⚙️ Main Components

* 📂 **Source Data** – Original CSV datasets provided for the coursework.
* 🔄 **ETL Notebook** – Performs data inspection, cleaning, transformation, and surrogate key generation.
* 🗄️ **DDL Script** – Defines the data warehouse tables and dimensional structure.
* 📥 **Loading Script** – Contains PostgreSQL commands for loading the prepared datasets.
* 📊 **OLAP Script** – Contains queries for **slice, dice, roll-up, drill-down, and pivot** analysis.

## 🛠️ Tools Used

🐍 **Python** · 🐼 **Pandas** · 📓 **Jupyter Notebook** · 🐘 **PostgreSQL** · 🔧 **DBeaver Community** · 📊 **Metabase Community**

