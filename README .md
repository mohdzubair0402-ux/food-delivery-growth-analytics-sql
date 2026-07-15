# 🍔 Food Delivery Growth & Retention Analytics — SQL
**Author:** Zubair Ahmed
**Tools:** SQL Server (T-SQL)
**Focus:** Customer acquisition, retention, promo effectiveness, and growth-team reporting

---

## 📌 About This Project

This project answers a set of growth and customer-lifecycle questions on a simulated food delivery orders dataset — the kind of analysis a Growth or Customer Success Ops team would run to understand acquisition trends, promo dependency, and repeat-order behavior.

> Problem statements are based on a scenario walkthrough from Ankit Bansal's SQL YouTube channel. All queries were independently written and solved by me — the tutorial provided the business questions, not the solutions.

---

## 🗂️ Dataset

A single `orders` table simulating food delivery transactions:

| Column | Type | Description |
|---|---|---|
| `Order_id` | VARCHAR(20) | Unique order identifier |
| `Customer_code` | VARCHAR(20) | Unique customer identifier |
| `Placed_at` | DATETIME | Order timestamp |
| `Restaurant_id` | VARCHAR(10) | Restaurant identifier |
| `Cuisine` | VARCHAR(20) | Cuisine type |
| `Order_status` | VARCHAR(20) | Delivered / Cancelled |
| `Promo_code_Name` | VARCHAR(20) | Promo code used, if any |

Full table creation + seed data: [`noon_sql_project_script.txt`](noon_sql_project_script%20(1).txt)

---

## 📊 Business Questions Solved

| # | Question | Key Technique | File |
|---|---|---|---|
| 1 | Top 3 outlets by cuisine type, without `LIMIT`/`TOP` | `ROW_NUMBER()` · `PARTITION BY` | `SQLQuery2.sql` |
| 2 | Daily new customer count since launch | `MIN()` per customer · `GROUP BY` | `SQLQuery3.sql` |
| 3 | Customers acquired in Jan 2025 who placed exactly one order and never returned | Correlated filtering · `HAVING COUNT` | `SQLQuery4.sql` |
| 4 | Customers inactive 7+ days, acquired 1+ month ago, first order was promo-driven | Multi-CTE join · `DATEADD()` | `SQLQuery5.sql` |
| 5 | Flag every 3rd order per customer for a lifecycle marketing trigger | `ROW_NUMBER()` · modulo logic | `SQLQuery6.sql` |
| 6 | Customers with 2+ orders where *every* order used a promo (fully promo-dependent) | `COUNT()` vs `COUNT(promo)` comparison | `SQLQuery7.sql` |
| 7 | % of Jan 2025 customers organically acquired (first order, no promo) | `ROW_NUMBER()` · conditional aggregation | `SQLQuery8.sql` |

---

## 🧠 Skills Demonstrated

- Customer cohort and acquisition-date analysis
- Retention/churn windowing using date arithmetic (`DATEADD`, `GETDATE`)
- Promo-code dependency and organic-growth measurement
- Window functions (`ROW_NUMBER`, `PARTITION BY`) for ranking and deduplication
- Multi-step CTEs to break complex growth logic into readable stages
- Translating open-ended "growth team" business asks into precise SQL logic

---

## ⚡ How to Run

```sql
-- Step 1: Create and seed the table
-- Run noon_sql_project_script.txt in SQL Server Management Studio

-- Step 2: Run any individual query file
-- e.g. SQLQuery2.sql, SQLQuery3.sql, etc.
```

---

*Dataset is simulated for learning purposes. Any resemblance to real platforms is coincidental.*
