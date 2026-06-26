# Customer Retention & Churn Analysis-Findings

**Project:** Customer Behaviour SQL Analysis  
**Dataset:** Online Retail II (UCI) - UK E-commerce Transactions 2009 – 2011  
**Analyst:** Gauri  
**Tool:** MySQL  

---

## Objective

To analyse customer retention patterns using cohort analysis tracking how many customers return after their first purchase, and identifying seasonal trends in active customer counts month over month.

---

## Dataset Overview

| Metric | Value |
|---|---|
| Total unique customers | 5,878 |
| Date range | December 2009-December 2011 |
| Total cohorts analysed | 25 monthly cohorts |
| Largest cohort | December 2009 (955 customers) |

---

## Methodology

The analysis was built in three stages:

**Stage 1-Cohort Assignment**
Each customer was assigned to a cohort based on their first purchase month using `MIN(invoicedate)` and `DATE_FORMAT()`.

**Stage 2-Retention Table**
A self join connected each customer's cohort month to all their subsequent activity months, producing a full matrix of cohort × activity month combinations.

**Stage 3-MoM Change**
`LAG()` window function was used to compare active customer counts month over month, calculating both absolute change and percentage change.

---

## Key Findings

### Finding 1-Severe drop off after first purchase
The December 2009 cohort (955 customers) lost **65% of customers after just one month:**

| Month | Active Customers | Retention Rate |
|---|---|---|
| Month 1 (Dec 2009) | 955 | 100% |
| Month 2 (Jan 2010) | 337 | 35.3% |
| Month 3 (Feb 2010) | 319 | 33.4% |
| Month 12 (Nov 2010) | 473 | 49.5% |

The January 2010 cohort performed even worse retaining only **20.6%** of customers in month 2, meaning 4 out of every 5 new customers never returned after their first purchase.

This signals a critical gap in the post-purchase customer journey. The business has no effective mechanism to convert first-time buyers into repeat customers.

### Finding 2-Earliest customers are the most loyal
The December 2009 cohort consistently retained 30–40% of customers even 2 years later significantly higher than later cohorts. This suggests early adopters had stronger brand affinity or were acquired through more targeted channels.

### Finding 3-Strong seasonal surge in September - November
Month over month analysis revealed a consistent pattern across both years:

| Period | MoM Change |
|---|---|
| Sep 2010 | +25.7% |
| Oct 2010 | +30.7% |
| Sep 2011 | +35.4% |
| Nov 2011 | +22.0% |

Active customers surge every autumn almost certainly driven by pre-Christmas shopping behaviour. This pattern repeats consistently across both years, confirming it is seasonal rather than coincidental.

### Finding 4-Summer slump is consistent
July and August show consistent decline both years:

| Period | MoM Change |
|---|---|
| Jul 2010 | -10.9% |
| Aug 2010 | -1.8% |
| Jul 2011 | -4.2% |
| Aug 2011 | -1.5% |

Summer is the weakest trading period. Marketing spend during these months likely has lower ROI compared to autumn campaigns.

### Finding 5-December active customer drop is misleading
December shows the largest single month drops:
```
Dec 2010  →  -44.9%
Dec 2011  →  -63.0%
```
However this is partly explained by order timing many Christmas purchases are placed in November, making December transaction counts appear lower. This is a data interpretation nuance worth flagging in any business presentation.

---

## Business Recommendations

| Recommendation | Based On | Expected Impact |
|---|---|---|
| Launch a second purchase campaign within 30 days of first order | 65-80% of customers never return after first purchase | Improve month 2 retention from 20-35% toward 50%+ |
| Front-load marketing budgets into September and October | Consistent 25-35% MoM surge in autumn | Maximise ROI during peak engagement period |
| Introduce a summer re-engagement campaign in July | Consistent summer slump both years | Reduce seasonal dip in active customers |
| Study December 2009 cohort acquisition channels | Highest long-term retention of all cohorts | Replicate the conditions that produced the most loyal customers |

---

## SQL Skills Demonstrated

- `DATE_FORMAT()` for month-based grouping
- `MIN()` for cohort identification (first purchase date)
- Self joins for comparing transactions to cohort data
- 4 chained CTEs for complex multi-step analysis
- `LAG()` window function for month over month comparison
- Percentage change calculations
- `COUNT DISTINCT` for unique customer counting

---

*Analysis performed on cleaned dataset. Raw data cleaning documented in `data_cleaning.ipynb`.*
