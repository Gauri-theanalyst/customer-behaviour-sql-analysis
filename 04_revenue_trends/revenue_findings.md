# Revenue Trend Analysis - Findings

**Project:** Customer Behaviour SQL Analysis  
**Dataset:** Online Retail II (UCI) - UK E-commerce Transactions 2009–2011  
**Analyst:** Gauri  
**Tool:** MySQL  

---

## Objective

To analyse revenue trends over time - identifying seasonal patterns, month over month growth, geographic revenue distribution, and peak ordering behaviour by day and hour.

---

## Dataset Overview

| Metric | Value |
|---|---|
| Total revenue (2 years) | £17,389,863 |
| Date range | December 2009 - December 2011 |
| Total orders | 33,541+ |
| Countries generating revenue | 38 |
| £10M milestone crossed | February 2011 |

---

## Methodology

The analysis was built across five queries:

1. **Monthly revenue** - aggregated transactions by month using `DATE_FORMAT()` and `GROUP BY`
2. **MoM growth** - used `LAG()` window function to compare each month to the previous
3. **Country revenue** - grouped and ranked revenue by country using `ORDER BY`
4. **Day and hour analysis** - used `DAYNAME()` and `HOUR()` to identify peak ordering times
5. **Running total** - used cumulative `SUM() OVER()` to track revenue build over time

---

## Key Findings

### Finding 1 - £17.3M generated across 2 years

| Period | Revenue | Running Total |
|---|---|---|
| Dec 2009 | £698,562 | £698,562 |
| Dec 2010 | £570,422 | £9,073,058 |
| Feb 2011 | £446,084 | £10,087,245 |
| Nov 2011 | £1,156,205 | £16,872,654 |
| Dec 2011 | £517,208 | £17,389,863 |

The business crossed the £10M cumulative revenue milestone in February 2011 - 14 months into the dataset. The second year alone generated £8.3M.

### Finding 2 - November is consistently the peak revenue month

| Month | Revenue | MoM Change |
|---|---|---|
| Nov 2010 | £1,166,460 | +12.9% |
| Nov 2011 | £1,156,205 | +11.6% |

November is the single highest revenue month both years driven by wholesale buyers stocking up for the Christmas retail season. This pattern is highly predictable and should anchor annual marketing planning.

### Finding 3 - September delivers the strongest growth spike

| Period | MoM Revenue Growth |
|---|---|
| Sep 2010 | +37.7% |
| Sep 2011 | +47.6% |

September consistently delivers the largest single month revenue jump both years. Autumn buying season kicks in sharply making August the critical month for marketing campaigns to capture September demand early.

### Finding 4 - December crashes every year despite being Christmas

| Month | Revenue | MoM Change |
|---|---|---|
| Dec 2010 | £570,422 | -51.1% |
| Dec 2011 | £517,208 | -55.3% |

December drops over 50% both years. As a wholesale business, retailers place Christmas stock orders in October and November - by December the buying is complete. This is a counterintuitive but important insight for budget planning.

### Finding 5 - UK dominates but international markets have higher order value

| Country | Revenue | Avg Transaction Value |
|---|---|---|
| United Kingdom | £14,402,608 | £20.55 |
| EIRE | £617,304 | £39.58 |
| Netherlands | £554,038 | £108.96 |
| Germany | £425,078 | £25.86 |
| Australia | £169,479 | £94.26 |

The UK generates 83% of total revenue but has the lowest average transaction value (£20.55). Netherlands and Australia spend 5x and 4.5x more per transaction respectively suggesting large bulk wholesale orders to offset international shipping costs. International markets represent a high-value growth opportunity despite lower order volume.

### Finding 6 - Thursday lunchtime is peak ordering time

**By day:**
| Day | Orders | Revenue |
|---|---|---|
| Thursday | 7,773 | £3,745,783 |
| Tuesday | 6,627 | £3,337,888 |
| Wednesday | 6,649 | £3,021,043 |
| Saturday | 30 | £9,803 |

**By hour:**
| Hour | Orders | Revenue |
|---|---|---|
| 12pm | 6,170 | £2,690,583 |
| 1pm | 5,418 | £2,347,078 |
| 10am | 4,364 | £2,325,276 |

Thursday is the busiest day generating 21% of total weekly revenue. Saturday is almost completely inactive (30 orders vs 7,773 on Thursday) confirming this is a B2B wholesale business operating on standard business hours. Peak ordering occurs at lunchtime (12pm-1pm) suggesting buyers review stock in the morning and order at lunch.

---

## Business Recommendations

| Recommendation | Based On | Expected Impact |
|---|---|---|
| Front-load marketing campaigns into August | September delivers 38-48% MoM growth both years | Capture demand at the start of peak season |
| Plan maximum stock and staffing for November | Consistently highest revenue month both years | Avoid stockouts during peak wholesale ordering |
| Don't invest in December campaigns | 50%+ revenue drop both years buying already done | Redirect December budget to August/September |
| Target Netherlands and Australia for international growth | 5x higher avg transaction value than UK | Higher revenue per customer acquired |
| Schedule email campaigns for Wednesday evening | Orders peak Thursday 12pm-1pm | Emails land Thursday morning ahead of peak ordering window |
| Reduce operational costs on weekends | Saturday generates <0.1% of weekly revenue | Reallocate weekend resources to weekday peak periods |

---

## SQL Skills Demonstrated

- `DATE_FORMAT()` for monthly grouping
- `LAG()` window function for month over month comparison
- `DAYNAME()` and `HOUR()` for time-based analysis
- Cumulative `SUM() OVER (ORDER BY)` for running totals
- `COUNT DISTINCT` for unique order and customer counting
- Multi-level `GROUP BY` for geographic analysis
- Percentage change calculations

---

*Analysis performed on cleaned dataset. Raw data cleaning documented in `data_cleaning.ipynb`.*
