-- ============================================
-- Updating & Deleting Data
-- ============================================
USE company;

-- UPDATE: Modify existing rows
-- Important: Always use a WHERE clause, or ALL rows will be updated!

-- 1. Update a single column
UPDATE employees
SET salary = 80000
WHERE emp_id = 1;

-- 2. Update multiple columns
UPDATE employees
SET salary = 85000, email = 'john.doe@company.com'
WHERE emp_id = 1;

-- 3. Update based on condition
UPDATE employees
SET salary = salary * 1.1      -- 10% raise
WHERE hire_date < '2023-03-01';

-- 4. Safe update mode: If you forget the WHERE clause, MySQL Workbench may prevent it.
-- Temporarily disable safe mode: SET SQL_SAFE_UPDATES = 0; (use with caution)

-- DELETE: Remove rows
-- Always use a WHERE clause!

-- 1. Delete a specific row
DELETE FROM employees
WHERE emp_id = 5;

-- 2. Delete multiple rows matching condition
DELETE FROM employees
WHERE hire_date IS NULL;      -- Be careful with NULL comparisons

-- 3. Delete all rows (without dropping the table)
-- DELETE FROM employees;      -- This clears the entire table

-- TRUNCATE: faster way to delete all rows, resets auto-increment
-- TRUNCATE TABLE employees;

SELECT * FROM employees;