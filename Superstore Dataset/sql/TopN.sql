-- TOP N ANALYSIS --
-- Find the top 10 states by sales.
SELECT state,
SUM(sales) AS total_sales_states
FROM customer
GROUP BY state
ORDER BY total_sales_states DESC
LIMIT 10;
-- Find the top 10 states by profit.
SELECT state,
SUM(profit) AS total_profit_states
FROM customer
GROUP BY state
ORDER BY total_profit_states DESC
LIMIT 10;
-- Find the top 10 products by sales.
SELECT product_name,
SUM(sales) AS total_sales_product
FROM customer
GROUP BY product_name
ORDER BY total_sales_product DESC
LIMIT 10;
-- Find the top 10 products by profit.
SELECT product_name,
SUM(profit) AS total_sales_product
FROM customer
GROUP BY product_name
ORDER BY total_profit_product DESC
LIMIT 10;
-- Identify sub-categories with negative profit.
SELECT "sub-category",
SUM(profit) AS total_profit
FROM customer
GROUP BY "sub-category"
HAVING SUM(profit) < 0;
-- Calculate sales and profit by customer segment.
-- Calculate sales and profit by shipping mode.
-- Find the average discount by category.
-- Determine which region has the highest profit margin.
-- Find products that have generated losses overall.