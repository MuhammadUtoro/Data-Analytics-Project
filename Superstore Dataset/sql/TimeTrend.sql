-- Time Trend Analysis --
-- Calculate monthly sales trends.
SELECT
	EXTRACT(year FROM order_date) AS year,
	EXTRACT(month FROM order_date) AS month,
	SUM(sales) AS monthly_sales
FROM customer
GROUP BY year, month
ORDER BY year, month;
-- Calculate monthly profit trends.
SELECT
    EXTRACT(year FROM order_date) AS year,
    EXTRACT(month FROM order_date) AS month,
    SUM(profit) as monthly_profit
FROM customer
GROUP BY year, month
ORDER BY year, month
-- Find the best-selling product within each category.
-- This is best-selling by total product sold
with ranked_products AS (
	SELECT
	product_name,
	category,
	SUM(quantity) AS quantity_sold,
	RANK() OVER(
		PARTITION BY category
		ORDER BY SUM(quantity)
	) AS product_rank
	FROM customer
	GROUP BY product_name, category
)
SELECT *
	FROM ranked_products
WHERE product_rank = 1; 
-- This is best-selling by total revenue
with ranked_sales AS (
	SELECT
	product_name,
	category,
	SUM(sales) AS total_sales,
	RANK() OVER(
		PARTITION BY category
		ORDER BY SUM(sales)
	) AS sales_rank
	FROM customer
	GROUP BY product_name, category
)
SELECT *
	FROM ranked_sales
WHERE sales_rank = 1;
-- Now best-selling by profit
with ranked_profit AS(
	SELECT
	product_name,
	category,
	SUM(profit) AS total_profit,
	RANK() OVER(
		PARTITION BY category
		ORDER BY SUM(profit) DESC
	) AS profit_rank
	FROM customer
	GROUP BY product_name, category
)
SELECT *
	FROM ranked_profit
WHERE profit_rank = 1;
-- Rank states by total sales.
SELECT
	state,
	RANK() OVER(ORDER BY SUM(sales)DESC)
FROM customer
GROUP BY state;
-- Rank products by profit within each category.
with ranked_profit AS(
	SELECT
	product_name,
	category,
	SUM(profit) AS total_profit,
	RANK() OVER(
		PARTITION BY category
		ORDER BY SUM(profit) DESC
	) AS profit_rank
	FROM customer
	GROUP BY product_name, category
)
SELECT *
	FROM ranked_profit
WHERE profit_rank = 1;
-- Find the top-performing category in each region.
SELECT
	category,
	region,
	SUM(sales) AS total_sales,
	RANK() OVER(PARTITION BY region ORDER BY SUM(sales)DESC)
	FROM customer
GROUP BY category, region;
-- Identify customers who generate the highest lifetime sales
SELECT
	customer_id,
	customer_name,
	SUM(sales) total_sales,
	RANK() OVER(ORDER BY SUM(sales)DESC)
	FROM customer
GROUP BY customer_id, customer_name
LIMIT 1;
