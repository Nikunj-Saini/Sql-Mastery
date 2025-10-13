
/* RULE 1: Data Types
   The number and data types of columns in each query must match.
*/

SELECT
    FirstName,
    LastName,
    Country
FROM Sales_Customers
UNION
SELECT
    FirstName,
    LastName,
    'Unknown' AS Country   -- Added to match columns
FROM Sales_Employees;

/* RULE 2: Column Order
   The order of columns in each query must be the same.
*/

SELECT
    LastName,
    CustomerID
FROM Sales_Customers
UNION
SELECT
    LastName,
    EmployeeID
FROM Sales_Employees;

/* RULE 3: Column Aliases
   The column names in the result come from the first SELECT statement.
*/ 

SELECT
    CustomerID AS ID,
    LastName AS Last_Name
FROM Sales_Customers
UNION
SELECT
    EmployeeID,
    LastName
FROM Sales_Employees;

/* RULE 4: Correct Columns
   Always match columns logically.
*/

SELECT
    FirstName,
    LastName
FROM Sales_Customers
UNION
SELECT
    FirstName,
    LastName
FROM Sales_Employees;

/* TASK 1:
   Combine data from Employees and Customers using UNION 
   (Removes duplicates)
*/

SELECT
    FirstName,
    LastName
FROM Sales_Customers
UNION
SELECT
    FirstName,
    LastName
FROM Sales_Employees;

/* TASK 2:
   Combine data from Employees and Customers including duplicates using UNION ALL
*/

SELECT
    FirstName,
    LastName
FROM Sales_Customers
UNION ALL
SELECT
    FirstName,
    LastName
FROM Sales_Employees;

/* TASK 3:
   Find employees who are NOT customers (simulate EXCEPT)
*/

SELECT
    e.FirstName,
    e.LastName
FROM Sales_Employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM Sales_Customers c
    WHERE c.FirstName = e.FirstName
      AND c.LastName = e.LastName
);

/* TASK 4:
   Find employees who are also customers (simulate INTERSECT)
*/

SELECT
    e.FirstName,
    e.LastName
FROM Sales_Employees e
WHERE EXISTS (
    SELECT 1
    FROM Sales_Customers c
    WHERE c.FirstName = e.FirstName
      AND c.LastName = e.LastName
);

/* TASK 5:
   Combine Orders and OrdersArchive data without duplicates
*/

SELECT
    'Orders' AS SourceTable,
    OrderID,
    ProductID,
    CustomerID,
    SalesPersonID,
    OrderDate,
    ShipDate,
    OrderStatus,
    ShipAddress,
    BillAddress,
    Quantity,
    Sales,
    CreationTime
FROM Sales_Orders
UNION
SELECT
    'OrdersArchive' AS SourceTable,
    OrderID,
    ProductID,
    CustomerID,
    SalesPersonID,
    OrderDate,
    ShipDate,
    OrderStatus,
    ShipAddress,
    BillAddress,
    Quantity,
    Sales,
    CreationTime
FROM Sales_OrdersArchive
ORDER BY OrderID;
