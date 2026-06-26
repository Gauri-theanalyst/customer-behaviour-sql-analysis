# Product Affinity Analysis - Findings

**Project:** Customer Behaviour SQL Analysis  
**Dataset:** Online Retail II (UCI) - UK E-commerce Transactions 2009–2011  
**Analyst:** Gauri  
**Tool:** MySQL  

---

## Objective

To identify which products are frequently purchased together and which products are most popular in each country informing cross-sell strategies, product bundling, and market-specific marketing campaigns.

---

## Dataset Overview

| Metric | Value |
|---|---|
| Total unique products | 4,070 |
| Total transactions | 779,964 |
| Countries analysed | 38 |
| Analysis scope | UK sample (10,000 rows) for pair analysis |

---

## Methodology

The analysis was built in three stages:

**Stage 1 - Top Products**
Aggregated transactions by product using `COUNT` and `SUM` to identify the most frequently ordered and highest revenue generating products overall.

**Stage 2 - Product Pair Analysis**
Used a self join on invoice number to find products appearing in the same order. The condition `a.stockcode < b.stockcode` eliminated duplicate pairs and same-product matches, producing clean co-purchase pairs ranked by frequency.

**Stage 3 - Country Level Ranking**
Used `ROW_NUMBER()` with `PARTITION BY country` to rank products within each country independently, identifying the single most popular product per market. Non-product line items (postage, carriage charges) were filtered out before ranking.

---

## Key Findings

### Finding 1 - Top 5 products by order frequency

| Product | Times Ordered | Units Sold | Revenue |
|---|---|---|---|
| WHITE HANGING HEART T-LIGHT HOLDER | 5,021 | 91,892 | £247,395 |
| REGENCY CAKESTAND 3 TIER | 3,335 | 24,124 | £277,656 |
| ASSORTED COLOUR BIRD ORNAMENT | 2,696 | 79,218 | £125,784 |
| JUMBO BAG RED RETROSPOT | 2,641 | 74,224 | £134,307 |
| PARTY BUNTING | 2,098 | 23,460 | £103,283 |

The Regency Cakestand generates the highest revenue despite fewer orders than the T-light holder indicating a higher price point and stronger margin per unit.

### Finding 2 - Colour variants dominate co-purchase pairs
The most frequently bought together products are colour variants of the same item:

| Product A | Product B | Times Bought Together |
|---|---|---|
| SWEETHEART CERAMIC TRINKET BOX | STRAWBERRY CERAMIC TRINKET BOX | 32 |
| BAKING SET 9 PIECE RETROSPOT | RETRO SPOT TEA SET CERAMIC 11 PC | 29 |
| VINTAGE SNAP CARDS | VINTAGE HEADS AND TAILS CARD GAME | 29 |
| RED HANGING HEART T-LIGHT HOLDER | WHITE HANGING HEART T-LIGHT HOLDER | 28 |
| PINK CHERRY LIGHTS | WHITE CHERRY LIGHTS | 27 |

Customers are consistently buying the same product in multiple colours or complementary sets suggesting wholesale buying behaviour where variety is intentional.

### Finding 3 - Natural gift bundles exist in the data
Several product pairs form natural gift sets that could be marketed as bundles:
- Baking Set + Retro Tea Set → kitchen gift bundle
- Vintage Snap Cards + Heads and Tails → vintage games bundle
- Hot water bottle variants (3 designs bought together repeatedly) → seasonal gift bundle

### Finding 4 - Top product varies significantly by country

| Country | Top Product | Orders |
|---|---|---|
| United Kingdom | WHITE HANGING HEART T-LIGHT HOLDER | 4,832 |
| Germany | ROUND SNACK BOXES SET OF 4 WOODLAND | 207 |
| France | RED TOADSTOOL LED NIGHT LIGHT | 130 |
| EIRE | REGENCY CAKESTAND 3 TIER | 128 |
| Netherlands | SPACEBOY LUNCH BOX | 47 |
| Australia | RED TOADSTOOL LED NIGHT LIGHT | 13 |

Product preferences vary considerably across markets - the UK top product (T-light holder) doesn't appear as top product in any other country. This suggests localised marketing campaigns would outperform a one-size-fits-all approach.

### Finding 5 - France and Australia share the same top product
Both France and Australia's most ordered product is the Red Toadstool LED Night Light. This cross-market pattern suggests shared consumer taste between these two markets — a marketing team could test the same campaign creative across both simultaneously.

### Finding 6 - Data quality issue identified and resolved
Initial analysis revealed postage and carriage charges (stockcodes: POST, C2, M) appearing as top "products" in international markets. These were identified as non-product line items and filtered out before final analysis — a critical data validation step that ensures meaningful results.

---

## Business Recommendations

| Recommendation | Based On | Expected Impact |
|---|---|---|
| Create colour variant bundle deals | Colour pairs dominate co-purchase data | Increase average order value by packaging variants together |
| Develop 3 themed gift bundles | Natural gift set pairs identified | Premium bundle pricing drives higher margin |
| Localise marketing campaigns by country | Top products vary significantly by market | Higher conversion rates with market-specific product focus |
| Test same creative in France and Australia | Shared top product across both markets | Efficient budget use by reusing campaign assets |
| Stock hot water bottle variety packs | 3 designs consistently bought together | Simplify wholesale ordering for repeat buyers |

---

## SQL Skills Demonstrated

- `COUNT` and `SUM` with `GROUP BY` for product aggregation
- Self join on invoice with `<` condition for clean pair analysis
- `ROW_NUMBER()` window function with `PARTITION BY` for country level ranking
- `NOT IN` filter for data quality - excluding non-product line items
- CTEs for multi-step analysis
- `ROUND()` for formatted revenue output

---

*Analysis performed on cleaned dataset. Non-product line items filtered before country ranking analysis.*
