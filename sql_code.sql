-- 1. Find top 10 highest-selling products

SELECT TOP 10
    product_id,
    SUM(sale_price) AS sales
FROM df_orders
GROUP BY product_id
ORDER BY sales DESC;


-- 2. Find total sales by region

SELECT
    region,
    SUM(sale_price) AS total_sales
FROM df_orders
GROUP BY region
ORDER BY total_sales DESC;


-- 3. Find total sales by category

SELECT
    category,
    SUM(sale_price) AS total_sales
FROM df_orders
GROUP BY category
ORDER BY total_sales DESC;


-- 4. Find total sales by year

SELECT
    YEAR(order_date) AS order_year,
    SUM(sale_price) AS total_sales
FROM df_orders
GROUP BY YEAR(order_date)
ORDER BY order_year;


-- 5. Find top 5 most profitable products

SELECT TOP 5
    product_id,
    SUM(profit) AS total_profit
FROM df_orders
GROUP BY product_id
ORDER BY total_profit DESC;


-- 6. Find total quantity sold by category

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM df_orders
GROUP BY category
ORDER BY total_quantity DESC;


-- 7. Find the most profitable category

SELECT TOP 1
    category,
    SUM(profit) AS total_profit
FROM df_orders
GROUP BY category
ORDER BY total_profit DESC;


-- 8. Find sales by state

SELECT
    state,
    SUM(sale_price) AS total_sales
FROM df_orders
GROUP BY state
ORDER BY total_sales DESC;


-- 9. Find orders from the West region

SELECT *
FROM df_orders
WHERE region = 'West';


-- 10. Find products with profit greater than 100

SELECT
    product_id,
    profit
FROM df_orders
WHERE profit > 100
ORDER BY profit DESC;


-- 11. Find total number of orders

SELECT COUNT(*) AS total_orders
FROM df_orders;


-- 12. Find average profit

SELECT AVG(profit) AS average_profit
FROM df_orders;


-- 13. Find highest profit

SELECT MAX(profit) AS highest_profit
FROM df_orders;


-- 14. Find lowest profit

SELECT MIN(profit) AS lowest_profit
FROM df_orders;


-- 15. Find sales by sub-category

SELECT
    sub_category,
    SUM(sale_price) AS total_sales
FROM df_orders
GROUP BY sub_category
ORDER BY total_sales DESC;



--16.  Find products with total sales greater than 10,000

WITH sales_cte AS (
    SELECT
        product_id,
        SUM(sale_price) AS total_sales
    FROM df_orders
    GROUP BY product_id
)

SELECT *
FROM sales_cte
WHERE total_sales > 10000;



-- 17. Find categories with total profit greater than 5,000

WITH profit_cte AS (
    SELECT
        category,
        SUM(profit) AS total_profit
    FROM df_orders
    GROUP BY category
)

SELECT *
FROM profit_cte
WHERE total_profit > 5000
ORDER BY total_profit DESC;
