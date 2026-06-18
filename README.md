# DecodeLabs-Task3
# Project 3: Data Analysis Using SQL

### Operational Database Auditing & Insights
* **Designed by:** Youmna Mohammed Moussa
* **Date:** June 2026
* **Role:** Junior Data Analyst

---

## 1. Project Scope & Objective
The primary objective of this task was to query, audit, and analyze the internship dataset using SQL. The analysis focuses on extracting actionable business insights, tracking order distributions, and identifying key revenue drivers through structured database queries.

---


##  2. SQL Queries & Analytical Framework

Here are the core SQL queries implemented to extract the key performance metrics from the database:

###  Query 1: Total Orders & Revenue Volume
```sql
SELECT 
    COUNT(DISTINCT order_id) AS total_unique_orders,
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(total_invoice), 2) AS total_gross_revenue
FROM orders;

 Query 2: Product Performance & Revenue Anchors
SQL
SELECT 
    product_name,
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS quantity_sold,
    ROUND(SUM(total_invoice), 2) AS total_revenue
FROM orders
GROUP BY product_name
ORDER BY total_revenue DESC;

 Query 3: Marketing Acquisition Channel Performance
SQL
SELECT 
    referral_source,
    COUNT(order_id) AS total_conversions,
    ROUND(COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS conversion_percentage
FROM orders
GROUP BY referral_source
ORDER BY total_conversions DESC;

 Query 4: Audit of Missing Coupon Codes (MCAR Test)
SQL
SELECT 
    order_status,
    COUNT(*) AS blank_coupon_cases
FROM orders
WHERE coupon_code IS NULL OR coupon_code = 'None'
GROUP BY order_status;
