-- 1. Top 10 customers by total quantity purchased
SELECT
	c.customer_key,
	c.first_name,
	c.last_name,
	COUNT(order_quantity) AS total_quantity_ordered
FROM customers c
LEFT JOIN sales s
ON c.customer_key = s.customer_key
GROUP BY c.customer_key
ORDER BY total_quantity_ordered DESC
LIMIT 10;
-- 2. Total customers per occupation
SELECT *
FROM customers;

SELECT
	occupation,
	COUNT(*) AS customer_count
FROM customers
GROUP BY occupation;
-- 3. Average annual income per occupation
SELECT
	occupation,
	ROUND(AVG(annual_income),2) AS average_income
FROM customers
GROUP BY occupation
-- 4. Average annual income per education level
SELECT
	education_level,
	ROUND(AVG(annual_income),2) AS average_income
FROM customers
GROUP BY education_level;
-- 5. Total customers per country
SELECT
	t.country,
	COUNT(*) customer_count
FROM customers c
LEFT JOIN sales s
ON c.customer_key = s.customer_key
LEFT JOIN territories t
ON s.territory_key = t.sales_territory_key
GROUP BY t.country
ORDER BY customer_count DESC;