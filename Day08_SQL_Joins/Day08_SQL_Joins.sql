
/* ============================================================================== 
   BASIC JOINS 
=============================================================================== */

-- No Join: Retrieve all data separately

SELECT * FROM customers;
SELECT * FROM orders;

-- INNER JOIN: Customers with orders

SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;

-- LEFT JOIN: All customers, including those without orders

SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;

-- RIGHT JOIN: All orders, including those without matching customers

SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.customer_id,
    o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id;

-- FULL OUTER JOIN alternative in MySQL using UNION

SELECT c.id, c.first_name, o.order_id, o.sales
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
UNION
SELECT c.id, c.first_name, o.order_id, o.sales
FROM customers c
RIGHT JOIN orders o ON c.id = o.customer_id;

/* ============================================================================== 
   ADVANCED JOINS
=============================================================================== */

-- LEFT ANTI JOIN: Customers without orders

SELECT *
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.customer_id IS NULL;

-- RIGHT ANTI JOIN: Orders without customers

SELECT *
FROM orders o
LEFT JOIN customers c ON c.id = o.customer_id
WHERE c.id IS NULL;

-- CROSS JOIN: All possible combinations of customers and orders

SELECT *
FROM customers
CROSS JOIN orders;

/* ============================================================================== 
   MULTIPLE TABLE JOINS (4 Tables)
=============================================================================== */

USE SalesDB;

SELECT 
    o.OrderID,
    o.Sales,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    p.Product AS ProductName,
    p.Price,
    e.FirstName AS EmployeeFirstName,
    e.LastName AS EmployeeLastName
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
LEFT JOIN Products p ON o.ProductID = p.ProductID
LEFT JOIN Employees e ON o.SalesPersonID = e.EmployeeID;
