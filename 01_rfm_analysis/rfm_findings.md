# RFM Analysis-Customer Segmentation Findings

**Project:** Customer Behaviour SQL Analysis  
**Dataset:** Online Retail II (UCI)- UK E-commerce Transactions 2009–2011  
**Analyst:** Gauri  
**Tool:** MySQL  

---

## Objective

To segment customers based on their purchasing behaviour using the RFM framework Recency, Frequency, and Monetary value and identify actionable groups for targeted marketing campaigns.

---

## Dataset Overview

| Metric | Value |
|---|---|
| Total transactions | 779,964 |
| Total unique customers | 5,878 |
| Date range | December 2009 — December 2011 |
| Countries | 38 |
| Total revenue | £9.7M+ |

---

## Methodology

Each customer was scored on three dimensions:

- **Recency (R)** - days since last purchase relative to 2011-12-31
- **Frequency (F)** - number of unique orders placed
- **Monetary (M)** - total revenue generated

Each dimension was scored 1–5 using `NTILE(5)` window function, where **5 = best** and **1 = worst.** Customers were then assigned to segments based on their combined R and F scores using `CASE WHEN` logic.

The analysis was built using three chained CTEs:
1. `rfm_base` - calculated raw RFM metrics per customer
2. `rfm_scores` - converted metrics to 1–5 scores using NTILE()
3. `rfm_segments` - assigned segment labels using CASE WHEN

---

## Key Findings

### Segment Summary

| Segment | Customers | Total Revenue | Avg Revenue per Customer |
|---|---|---|---|
| Champion | 600 | £8,472,382 | £14,120 |
| Loyal | 1,750 | £6,376,409 | £3,643 |
| Needs Attention | 2,525 | £2,183,309 | £864 |
| Lost | 716 | £244,363 | £341 |
| Potential Loyalist | 287 | £113,397 | £395 |

---

### Finding 1- Champions drive disproportionate revenue
600 Champion customers just 10.2% of the total customer base generated £8.47M in revenue. This directly confirms the Pareto principle: a small proportion of customers drive the majority of business value.

Combined, Champions and Loyal customers represent 2,350 customers (40% of total) yet generate £14.8M the vast majority of total revenue. The remaining 60% of customers generate just £2.4M combined.

### Finding 2- The Loyal segment is the biggest growth opportunity
1,750 Loyal customers generated £6.37M collectively but average only £3,643 each less than a quarter of the Champion average spend of £14,120. Converting even 10% of Loyal customers to Champion behaviour could add over £1M in incremental revenue without acquiring a single new customer.

### Finding 3- Over half the customer base is disengaged
2,525 customers (43%) fall in the Needs Attention segment and 716 (12%) are classified as Lost. Combined these represent 55% of customers generating only £2.4M — signalling significant churn risk and missed revenue potential.

### Finding 4- Potential Loyalists are an underserved growth segment
287 customers score high on recency but low on frequency they bought recently but haven't returned often. These are newer customers who haven't yet formed a purchase habit. A targeted second purchase incentive could move them into the Loyal tier before they go cold.

### Finding 5- Standout customer: 18102
Customer 18102 scored 5/5/5 across all RFM dimensions the highest possible score. With £583,273 in total revenue across 145 orders and a last purchase just 22 days before the dataset end date, this customer represents the ideal Champion profile and should be treated as a VIP account.

### Finding 6- At Risk customers are hiding in the data
Customer 12346 illustrates a critical at-risk pattern £77,556 in lifetime spend and 12 orders, but their last purchase was 347 days ago. Without intervention this high-value customer is likely lost. A personalised win-back campaign targeting customers with high monetary scores but high recency days could recover significant revenue.

---

## Business Recommendations

| Segment | Recommended Action | Goal |
|---|---|---|
| Champion | VIP programme, early product access, referral incentives | Retain and leverage as brand advocates |
| Loyal | Upsell higher value products, cross-sell complementary items | Increase average order value toward Champion level |
| Needs Attention | Personalised re-engagement email with time-limited offer | Prevent churn, nudge toward Loyal behaviour |
| Potential Loyalist | Second purchase incentive within 30 days of first order | Build purchase habit early |
| Lost | Single win-back campaign, then remove from active list | Recover a small % before writing off |

---

## SQL Skills Demonstrated

- `GROUP BY` with aggregate functions (`SUM`, `COUNT DISTINCT`, `MAX`)
- `DATEDIFF()` for date-based recency calculations
- Common Table Expressions (CTEs) — chaining 3 CTEs sequentially
- `NTILE()` window function with `OVER()` for percentile scoring
- `CASE WHEN` for conditional segmentation logic
- `ROUND()`, `AVG()` for formatted output

---

*Analysis performed on cleaned dataset. Raw data cleaning documented in `data_cleaning.ipynb`.*
