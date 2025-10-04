/* ==============================================================================
   DISTINCT - Return Unique Records
=============================================================================== */
USE mydatabase;
-- Return unique list of all countries
SELECT DISTINCT country
FROM customers;

-- Return unique combination of country and score
SELECT DISTINCT country, score
FROM customers;

-- Return unique names of customers
SELECT DISTINCT first_name
FROM customers;


/* ==============================================================================
   LIMIT - Restrict Number of Rows (MySQL Alternative to TOP)
=============================================================================== */

-- Retrieve only 3 customers
SELECT *
FROM customers
LIMIT 3;

-- Retrieve the Top 3 customers with the highest scores
SELECT *
FROM customers
ORDER BY score DESC
LIMIT 3;

-- Retrieve the Lowest 2 customers based on score
SELECT *
FROM customers
ORDER BY score ASC
LIMIT 2;

-- Get the Two Most Recent Orders
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 2;


/* ==============================================================================
   COMBINING QUERIES - UNION and UNION ALL
=============================================================================== */

-- Combine all country names from customers and a static value
SELECT country FROM customers
UNION
SELECT 'USA' AS country;  -- Static entry just for demonstration

-- UNION removes duplicates, UNION ALL keeps them
SELECT country FROM customers
UNION ALL
SELECT country FROM customers;

-- Combine customer names with a static label
SELECT first_name AS name, 'Customer' AS type
FROM customers
UNION
SELECT CAST(order_id AS CHAR), 'Order_ID' AS type
FROM orders;


/* ==============================================================================
   SUBQUERIES - Query inside a Query
=============================================================================== */

-- Retrieve customers who have a score greater than the average score
SELECT *
FROM customers
WHERE score > (SELECT AVG(score) FROM customers);

-- Retrieve orders made by customers from Germany
SELECT *
FROM orders
WHERE customer_id IN (
    SELECT id FROM customers WHERE country = 'Germany'
);
