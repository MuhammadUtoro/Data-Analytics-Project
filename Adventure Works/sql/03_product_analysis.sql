-- 1. Most expensive products - Road-150
SELECT
	product_name,
	MAX(product_price) AS most_expensive_item
FROM products
GROUP BY product_name
ORDER BY most_expensive_item DESC;
-- OR we can use window function
WITH ranked_products AS(
    SELECT
        product_name,
        product_price,
        RANK() OVER(ORDER BY product_price DESC) AS most_expensive_item
    FROM products
)
SELECT * 
FROM ranked_products
WHERE most_expensive_item = 1;
-- 2. Average price by category
SELECT
	pc.category_name,
	ROUND(AVG(p.product_price),2) AS average_price
FROM products p
LEFT JOIN product_subcategories ps
ON p.product_subcategory_key = ps.product_subcategory_key
LEFT JOIN product_categories pc
ON ps.product_category_key = pc.product_category_key
GROUP BY pc.category_name
ORDER BY average_price DESC;
-- 3. Number of products by category
SELECT
	pc.category_name,
	COUNT(p.product_key) AS product_count
FROM products p
LEFT JOIN product_subcategories ps
ON p.product_subcategory_key = ps.product_subcategory_key
LEFT JOIN product_categories pc
ON ps.product_category_key = pc.product_category_key
GROUP BY pc.category_name
ORDER BY product_count DESC;
-- 4. Average product cost vs average selling price
SELECT
	ROUND(AVG(product_cost),2) AS avg_cost,
	ROUND(AVG(product_price),2) AS avg_price
FROM products;
-- 5. Most sold products
SELECT
	p.product_name,
	SUM(s.order_quantity) AS quantity_sold
FROM products p
LEFT JOIN sales s
ON p.product_key = s.product_key
WHERE s.order_quantity IS NOT NULL
GROUP BY p.product_name
ORDER BY quantity_sold DESC
LIMIT 10;