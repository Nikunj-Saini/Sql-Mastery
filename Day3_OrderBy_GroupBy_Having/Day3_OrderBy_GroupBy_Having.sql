/* ==============================================================================
   Day 3: ORDER BY, GROUP BY, HAVING
   Concepts: Sorting, Aggregations, Filtering Groups
   Database: MyDatabase
=============================================================================== */

USE MyDatabase;

-- ==============================================================================
-- 1. ORDER BY
-- ==============================================================================

-- Sort customers by highest score first
SELECT *
FROM customers
ORDER BY score DESC;

-- Sort customers by lowest score first
SELECT *
FROM customers
ORDER BY score ASC;

-- Sort customers alphabetically by country
SELECT *
FROM customers
ORDER BY country ASC;

-- Sort customers by country, then highest score
SELECT *
FROM customers
ORDER BY country ASC, score DESC;

-- Sort only active customers (score != 0) by highest score
SELECT first_name, country, score
FROM customers
WHERE score != 0
ORDER BY score DESC;

-- ==============================================================================
-- 2. GROUP BY
-- ==============================================================================

-- Find total score for each country
SELECT 
    country,
    SUM(score) AS total_score
FROM customers
GROUP BY country;

-- Find total score and number of customers per country
SELECT 
    country,
    SUM(score) AS total_score,
    COUNT(id) AS total_customers
FROM customers
GROUP BY country;

-- ==============================================================================
-- 3. HAVING
-- ==============================================================================

-- Average score per country, return only countries with avg > 430
SELECT 
    country,
    AVG(score) AS avg_score
FROM customers
GROUP BY country
HAVING AVG(score) > 430;

-- Average score per country (ignoring score = 0), return avg > 430
SELECT 
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;
