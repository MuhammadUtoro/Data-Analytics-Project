-- 1. Calculate the total quantity sold 56.046
SELECT
    COUNT(order_quantity) AS total_quantity_sold
FROM sales;
-- 2. How many unique customers are on the database? 18.148
SELECT 
    COUNT(DISTINCT customer_key) AS total_customer
FROM customers;
-- 3. How many products are on the catalog? 293
SELECT
    COUNT(product_key) AS total_product
FROM products;
-- 4. Calculate the average product price $714.14
SELECT
    (SUM(product_price)/COUNT(product_key)) AS avg_product_price
FROM products;
-- 5. Calculate the total returned quantity 1828 items
SELECT
    SUM(return_quantity) AS total_returned_quantity
FROM returns;
