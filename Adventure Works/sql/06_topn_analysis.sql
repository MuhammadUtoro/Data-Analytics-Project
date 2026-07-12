-- 1. Rank customers by quantity purchased
SELECT
	c.first_name,
	c.last_name,
	SUM(s.order_quantity) AS total_order,
	RANK() OVER(ORDER BY SUM(s.order_quantity) DESC) AS rank_total_order
FROM customers c
INNER JOIN sales s
ON c.customer_key = s.customer_key
GROUP BY c.first_name, c.last_name;
-- 2. Dense rank product by sales
SELECT
	p.product_name,
	SUM(s.order_quantity) AS total_sold,
	DENSE_RANK() OVER(ORDER BY SUM(s.order_quantity) DESC) AS rank_total_sold
FROM products p
INNER JOIN sales s
ON p.product_key = s.product_key
GROUP BY p.product_name;
-- 3. Running total of monthly sales
SELECT
	month,
	monthly_sales,
	SUM(monthly_sales) OVER(ORDER BY month) AS running_total
FROM (
	SELECT
	DATE_TRUNC('month', order_date) AS month,
	SUM(order_quantity) AS monthly_sales
	FROM sales
	GROUP BY DATE_TRUNC('month', order_date)
) t
ORDER BY month;
-- 4. Previous month's sales
SELECT
	DATE_TRUNC('month', order_date) AS month,
	SUM(order_quantity) AS total_sold,
	LAG(SUM(order_quantity), 1) OVER(ORDER BY DATE_TRUNC('month', order_date)) AS prev_month_sold,
	SUM(order_quantity) - LAG(SUM(order_quantity), 1) OVER(ORDER BY DATE_TRUNC('month', order_date)) AS diff
FROM sales
GROUP BY DATE_TRUNC('month', order_date);
-- 5. Sales growth pct
WITH monthly_sales AS (
	SELECT
		DATE_TRUNC('month', order_date) AS month,
		SUM(order_quantity) AS total_sold
	FROM sales
	GROUP BY DATE_TRUNC('month', order_date)
)
SELECT
	month,
	total_sold,
	LAG(total_sold, 1) OVER(ORDER BY month) prev_month_sold,
	total_sold - LAG(total_sold, 1) OVER(ORDER BY month) AS diff,
	ROUND(
		(total_sold - LAG(total_sold, 1) OVER(ORDER BY month)) * 100.0/NULLIF(LAG(total_sold) OVER(ORDER BY month),0)
	,2) AS growth_pct
FROM monthly_sales;