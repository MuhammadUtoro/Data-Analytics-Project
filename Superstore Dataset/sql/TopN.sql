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
SELECT segment,
SUM(sales) AS total_sales
FROM customer
GROUP BY segment
ORDER BY total_sales DESC;

SELECT segment,
SUM(profit) AS total_profit
FROM customer
GROUP BY segment
ORDER BY total_profit DESC;
-- Calculate sales and profit by shipping mode.
SELECT ship_mode,
SUM(sales) AS total_sales
FROM customer
GROUP BY ship_mode
ORDER BY total_sales DESC;
SELECT ship_mode,
SUM(profit) AS total_profit
FROM customer
GROUP BY ship_mode
ORDER BY total_profit DESC;
-- Find the average discount by category.
SELECT category,
AVG(discount) AS avg_discount_category
FROM customer
GROUP BY category
ORDER BY avg_discount_category;
-- Determine which region has the highest profit margin.
SELECT region,
SUM(profit) AS total_profit
FROM customer
GROUP BY region
ORDER BY total_profit DESC;
-- Find products that have generated losses overall.
SELECT product_name,profit AS profit
FROM customer
WHERE profit < 0
ORDER BY profit ASC
LIMIT 10;