-- KPI -- 
-- Calculate the total sales.
SELECT SUM(sales) AS total_sales
FROM customer;
-- Calculate the total profit.
SELECT SUM(profit) AS total_profit
FROM customer;
-- Count the total number of orders.
SELECT COUNT (DISTINCT order_id) AS total
FROM customer;
-- List all unique product categories.
SELECT COUNT (DISTINCT customer_id)
FROM customer;
-- List all unique customer segments.
SELECT COUNT (DISTINCT segment)
FROM customer;
-- Find the total sales for each region.
SELECT region, SUM(sales) AS total_sales_region
FROM customer
GROUP BY region
ORDER BY total_sales_region DESC;
-- Find the total profit for each region.
SELECT region,
SUM(profit) AS total_profit_region
FROM customer
GROUP BY region
ORDER BY total_profit_region DESC;
-- Find the total sales for each category.
SELECT category,
SUM(sales) AS total_sales_category
FROM customer
GROUP BY category
ORDER BY total_sales_category DESC;
-- Find the total profit for each category.
SELECT category,
SUM(profit) AS total_profit_category
FROM customer
GROUP BY category
ORDER BY total_profit_category DESC;
-- Find the average sales per order.
SELECT order_id,
(SUM(sales)/COUNT (DISTINCT order_id)) AS avg_sales_order
FROM customer
GROUP BY order_id;