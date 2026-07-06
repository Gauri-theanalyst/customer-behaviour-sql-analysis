<<<<<<< HEAD
# Customer Behaviour SQL Analysis
### Analysing 780,000+ real e-commerce transactions across 4 marketing frameworks

![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat&logo=pandas&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=flat&logo=jupyter&logoColor=white)

---

## Project Overview

This project analyses real UK e-commerce transactional data to uncover customer behaviour patterns, revenue trends, and product insights - the kind of analysis a marketing or growth analytics team runs regularly in a corporate setting.

Every query was written from scratch. Every finding is based on real data. Every recommendation is actionable.

**Dataset:** Online Retail II (UCI Machine Learning Repository)
**Tool:** MySQL Workbench + Python (Pandas) for data cleaning
**Rows analysed:** 779,964 transactions
**Date range:** December 2009 - December 2011

---

## Key Findings at a Glance

| Finding | Insight |
|---|---|
| 🏆 Top 10% of customers generate 49% of revenue | Pareto principle confirmed in real data |
| 📉 65-80% of new customers never return after first purchase | Critical retention gap identified |
| 📅 September delivers 38-48% revenue growth every year | Most important month for marketing investment |
| 🛍️ Colour variants dominate co-purchase pairs | Bundle opportunities across product lines |
| 🌍 International customers spend 5x more per order than UK | High-value growth opportunity overseas |
| ⏰ Thursday 12pm is peak ordering time | Optimal window for email campaigns |
| 💰 £17.3M total revenue across 2 years | £10M milestone crossed in February 2011 |

---

## Project Structure

```
customer-behaviour-sql-analysis/
│
├── README.md                          ← you are here
├── data_cleaning.ipynb                ← Python data cleaning notebook
│
├── 01_rfm_analysis/
│   ├── 01_top_customers.sql
│   ├── 02_recency.sql
│   ├── 03_rfm_base.sql
│   ├── 04_rfm_scores.sql
│   ├── 05_rfm_segments.sql
│   └── rfm_findings.md
│
├── 02_retention_churn/
│   ├── 01_cohort_month.sql
│   ├── 02_cohort_size.sql
│   ├── 03_retention_table.sql
│   ├── 04_retention_rates.sql
│   ├── 05_mom_customer_change.sql
│   └── retention_findings.md
│
├── 03_product_affinity/
│   ├── 01_top_products.sql
│   ├── 02_product_pairs.sql
│   ├── 03_top_product_per_country.sql
│   └── affinity_findings.md
│
└── 04_revenue_trends/
    ├── 01_monthly_revenue.sql
    ├── 02_mom_revenue_growth.sql
    ├── 03_revenue_by_country.sql
    ├── 04a_best_day.sql
    ├── 04b_best_hour.sql
    ├── 05_running_total.sql
    └── revenue_findings.md
```

---

## The 4 Marketing Concepts

### 01 - RFM Analysis
**Business question:** Who are our best customers?

RFM (Recency, Frequency, Monetary) is a widely used customer segmentation framework in CRM and retention marketing. Each customer is scored 1-5 on three dimensions and assigned to a segment.

| Segment | Customers | Total Revenue | Avg Revenue |
|---|---|---|---|
| Champion | 600 | £8,472,382 | £14,120 |
| Loyal | 1,750 | £6,376,409 | £3,643 |
| Needs Attention | 2,525 | £2,183,309 | £864 |
| Lost | 716 | £244,363 | £341 |
| Potential Loyalist | 287 | £113,397 | £395 |

**SQL concepts:** GROUP BY · SUM · COUNT DISTINCT · CTEs · NTILE() · OVER() · CASE WHEN

---

### 02 - Customer Retention & Churn
**Business question:** Are we keeping our customers?

Cohort analysis tracks how many customers return after their first purchase month over month. Month over month active customer change identifies seasonal patterns.

**Key findings:**
- December 2009 cohort lost 65% of customers after just one month
- January 2010 cohort retained only 20.6% in month 2
- Active customers surge 25-48% every September - consistent both years
- Summer slump confirmed in July/August both years

**SQL concepts:** DATE_FORMAT() · MIN() · Self joins · LAG() · 4 chained CTEs · Percentage calculations

---

### 03 - Product Affinity
**Business question:** What gets bought together?

Market basket analysis identifies co-purchase patterns - the foundation of product recommendation engines and bundle strategies.

**Key findings:**
- Colour variants dominate co-purchase pairs (same product, multiple colours)
- Natural gift bundles identified: baking sets, vintage games, hot water bottles
- Top product varies significantly by country - localised marketing recommended
- France and Australia share the same top product (Red Toadstool LED Night Light)

**SQL concepts:** Self join with < condition · COUNT · HAVING · ROW_NUMBER() · PARTITION BY · NOT IN filter

---

### 04 - Revenue Trend Analysis
**Business question:** Is the business growing?

Monthly revenue, MoM growth rates, geographic breakdown, peak ordering times, and cumulative revenue tracking.

**Key findings:**
- £17.3M total revenue across 25 months
- November consistently highest revenue month (£1.1M+) both years
- September delivers 38-48% MoM growth - biggest spike of the year
- Thursday 12pm is peak ordering time - optimal for email campaigns
- Netherlands spends 5x more per transaction than UK customers

**SQL concepts:** LAG() · DAYNAME() · HOUR() · Cumulative SUM() OVER() · DATE_FORMAT() · Multi-column GROUP BY

---

## Data Cleaning

Raw data was cleaned in Python before loading into MySQL. Steps taken:

| Step | Action | Rows Removed |
|---|---|---|
| Cancelled orders | Removed invoices starting with 'C' | ~9,288 |
| Missing customer ID | Dropped rows with no customer_id | ~135,080 |
| Invalid quantities | Removed quantity ≤ 0 | ~3,849 |
| Invalid prices | Removed price ≤ 0 | ~40 |
| Duplicates | Removed exact duplicate rows | ~5,268 |

Full cleaning process documented in `data_cleaning.ipynb`

---

## SQL Skills Demonstrated

```sql
-- Aggregations
GROUP BY · SUM() · COUNT() · COUNT DISTINCT · AVG() · MAX() · MIN()

-- Window Functions  
NTILE() · LAG() · ROW_NUMBER() · SUM() OVER() · PARTITION BY · OVER()

-- Date Functions
DATE_FORMAT() · DATEDIFF() · DAYNAME() · HOUR()

-- Query Structure
CTEs (up to 4 chained) · Self Joins · Subqueries · CASE WHEN · HAVING

-- Data Quality
NOT IN filter · IS NOT NULL · DISTINCT · ROUND()
```

---

## About This Project

Built as part of my Master's in Business Analytics (final trimester) to apply real marketing analytics frameworks to actual transactional data — going beyond coursework into the kind of analysis done in corporate marketing and growth teams.

Every query was written from scratch. The goal was to learn by doing - not by copying tutorials.

---

*Dataset: UCI Machine Learning Repository - Online Retail II*
*Analyst: Gauri | Master's in Business Analytics | Based in Australia*
=======
# customer-behaviour-sql-analysis
End-to-end customer analytics project analysing 780K+ e-commerce transactions using SQL and Python - covering RFM segmentation, cohort retention, product affinity and revenue trends.
>>>>>>> 167d252bd3c5aa9db554f038422a45516f6a93b9
