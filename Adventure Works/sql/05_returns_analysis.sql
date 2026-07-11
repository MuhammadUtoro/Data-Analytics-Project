-- 1. Product with the highest return
SELECT
	p.product_name,
	SUM(r.return_quantity) AS return_count
FROM products p
LEFT JOIN returns r
ON p.product_key = r.product_key
WHERE r.return_quantity IS NOT NULL
GROUP BY p.product_name
ORDER BY return_count DESC
LIMIT 5;
-- 2. Return quantity per year
SELECT
	EXTRACT(YEAR FROM return_date) AS year,
	SUM(r.return_quantity) AS return_count
FROM products p
LEFT JOIN returns r
ON p.product_key = r.product_key
WHERE r.return_quantity IS NOT NULL
GROUP BY EXTRACT(YEAR FROM return_date);
-- 3. Return rate by product (total return/total sold)
WITH total_returns AS (
	SELECT SUM(return_quantity) AS returned
	FROM returns
),
total_sold AS(
	SELECT SUM(order_quantity) AS sold
	FROM sales
)
SELECT
	returned::numeric/sold AS return_rate
FROM total_returns, total_sold;
-- 4. Return quantity by territory
SELECT
	t.region,
	SUM(return_quantity) AS total_returned
FROM returns r
LEFT JOIN territories t
ON r.territory_key = t.sales_territory_key
GROUP BY t,region
ORDER BY total_returned DESC;
