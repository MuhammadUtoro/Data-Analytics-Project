-- 1. Sales quantity by year
SELECT
	EXTRACT(YEAR FROM order_date) AS year,
	SUM(order_quantity) AS total_order
FROM sales
GROUP BY (EXTRACT(YEAR FROM order_date));
-- 2. Sales quantity by month
SELECT
	DATE_TRUNC('month', order_date) AS month,
	SUM(order_quantity) AS total_order
FROM sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);
-- 3. Monthly sales trend
SELECT
	DATE_TRUNC('month', s.order_date) AS month,
	(s.order_quantity * p.product_price) AS total_sales
FROM sales s
LEFT JOIN products p
ON s.product_key = p.product_key
GROUP BY DATE_TRUNC('month', s.order_date), s.order_quantity, p.product_price
ORDER BY month;
-- 4. Sales by territory
SELECT
	region,
	SUM(s.order_quantity * p.product_price) AS total_sales
FROM products p
LEFT JOIN sales s
ON p.product_key = s.product_key
LEFT JOIN territories t
ON s.territory_key = t.sales_territory_key
WHERE (s.order_quantity * p.product_price) IS NOT NULL
GROUP BY region
ORDER BY total_sales DESC;
-- 5. average sales per category
SELECT
	pc.category_name,
	ROUND(AVG(s.order_quantity * p.product_price),2) AS avg_sales
FROM sales s
LEFT JOIN products p
ON p.product_key = s.product_key
LEFT JOIN product_subcategories ps
ON p.product_subcategory_key = ps.product_subcategory_key
LEFT JOIN product_categories pc
ON ps.product_category_key = pc.product_category_key
WHERE (s.order_quantity * p.product_price) IS NOT NULL
GROUP BY pc.category_name
ORDER BY avg_sales DESC;