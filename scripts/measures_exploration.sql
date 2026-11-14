-- Find the total Sales
SELECT SUM(sales_amount) AS total_sales
FROM gold_fact_sales;

-- Find how many items are sold 
SELECT SUM(quantity) AS total_quantity
FROM gold_fact_sales;

-- Find the average Selling Price
SELECT AVG(Price) AS avg_price
FROM gold_fact_sales;

-- Find the total number of orders
SELECT COUNT(order_number) AS total_orders
FROM gold_fact_sales;
SELECT COUNT( DISTINCT order_number) AS total_orders
FROM gold_fact_sales;
-- Find the total number of products
SELECT COUNT( DISTINCT product_key) AS total_products
FROM gold_fact_sales;


-- Find the total number of Customers
SELECT COUNT( DISTINCT customer_key) AS total_customers
FROM gold_fact_sales;

-- Find the total number of customers that has placed an order
SELECT COUNT( DISTINCT customer_key) AS total_customers
FROM gold_fact_sales;
