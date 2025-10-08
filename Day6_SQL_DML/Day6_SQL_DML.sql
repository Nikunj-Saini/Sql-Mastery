/* ============================================================================== 
   INSERT
=============================================================================== */

-- #1 Method: Manual INSERT using VALUES

-- Insert new records into the customers table
INSERT INTO customers (id, first_name, country, score)
VALUES 
    (6, 'Anna', 'USA', NULL),
    (7, 'Sam', NULL, 100);

-- Incorrect column order example (for learning purpose)

INSERT INTO customers (id, first_name, country, score)
VALUES 
    (8, 'Max', 'USA', NULL);

-- Incorrect data type in values (will throw an error in MySQL)
-- INSERT INTO customers (id, first_name, country, score)
-- VALUES ('Max', 9, 'Max', NULL);

-- Insert a new record with full column values
INSERT INTO customers (id, first_name, country, score)
VALUES (8, 'Max', 'USA', 368);

-- Insert a new record without specifying column names (not recommended)

INSERT INTO customers 
VALUES 
    (9, 'Andreas', 'Germany', NULL);

-- Insert a record with only id and first_name (other columns will be NULL or default)

INSERT INTO customers (id, first_name)
VALUES 
    (10, 'Sahra');



/* #2 Method: INSERT DATA USING SELECT - Moving Data From One Table to Another */

-- Copy data from 'customers' table into 'persons'
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT
    id,
    first_name,
    NULL,
    'Unknown'
FROM customers;



/* ============================================================================== 
   UPDATE
=============================================================================== */

-- Change the score of customer with ID 6 to 0

UPDATE customers
SET score = 0
WHERE id = 6;

-- Change the score of customer with ID 10 to 0 and update the country to 'UK'

UPDATE customers
SET score = 0,
    country = 'UK'
WHERE id = 10;

-- Update all customers with a NULL score by setting their score to 0

UPDATE customers
SET score = 0
WHERE score IS NULL;

-- Verify the update
SELECT *
FROM customers
WHERE score IS NULL;



/* ============================================================================== 
   DELETE
=============================================================================== */

-- Select customers with an ID greater than 5 before deleting

SELECT *
FROM customers
WHERE id > 5;

-- Delete all customers with an ID greater than 5

DELETE FROM customers
WHERE id > 5;

-- Delete all data from the persons table

DELETE FROM persons;

-- Faster method to delete all rows (resets auto-increment too)

TRUNCATE TABLE persons;
