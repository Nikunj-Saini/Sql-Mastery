/* ==============================================================================
   Day 2: SELECT and WHERE
   Concepts: SELECT ALL, SELECT SPECIFIC COLUMNS, WHERE clause
   Database: MyDatabase
=============================================================================== */

USE MyDatabase;

-- 1. SELECT ALL COLUMNS
SELECT * FROM customers;
SELECT * FROM orders;

-- 2. SELECT SPECIFIC COLUMNS
SELECT first_name, country, score
FROM customers;

-- 3. WHERE CLAUSE
-- Customers with a score not equal to 0
SELECT * 
FROM customers
WHERE score != 0;

-- Customers from Germany
SELECT * 
FROM customers
WHERE country = 'Germany';

-- Name and country of customers from Germany
SELECT first_name, country
FROM customers
WHERE country = 'Germany';
