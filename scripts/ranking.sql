-- Which 5 products generate  the highest revenue ?
SELECT 
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold_fact_sales f
LEFT JOIN gold_dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;


-- What are the 5 worst - performing products in terms of sales ?
SELECT 
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold_fact_sales f
LEFT JOIN gold_dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue
LIMIT 5;

-- Top 10 customers who generated the highest revenue

WITH customer_revenue AS (
    SELECT
        c.customer_key,
        c.first_name,
        c.last_name,
        SUM(f.sales_amount) AS total_revenue
    FROM gold_fact_sales f
    LEFT JOIN gold_dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY
        c.customer_key,
        c.first_name,
        c.last_name
),
customer_ranking AS (
    SELECT *,
        DENSE_RANK() OVER (
            ORDER BY total_revenue DESC
        ) AS rnk
    FROM customer_revenue
)
SELECT *
FROM customer_ranking
WHERE rnk <= 10;

-- Top 3 customers who have the fewest orders
WITH customer_orders AS (
    SELECT
        c.customer_key,
        c.first_name,
        c.last_name,
        COUNT(DISTINCT f.order_number) AS total_orders
    FROM gold_fact_sales f
    LEFT JOIN gold_dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY
        c.customer_key,
        c.first_name,
        c.last_name
),
customer_ranking AS (
    SELECT *,
        DENSE_RANK() OVER (
            ORDER BY total_orders ASC
        ) AS rnk
    FROM customer_orders
)
SELECT *
FROM customer_ranking
WHERE rnk <= 3;

