-- ============================================
-- Retrieving Data (READ)
-- ============================================
USE company;

-- 1. Select all columns
SELECT * FROM employees;

-- 2. Select specific columns
SELECT first_name, last_name, salary FROM employees;

-- 3. Column alias (rename in output)
SELECT first_name AS "First Name", last_name AS "Last Name", salary AS "Monthly Salary"
FROM employees;

-- 4. Arithmetic in SELECT
SELECT first_name, salary, salary * 12 AS "Annual Salary" FROM employees;

-- 5. DISTINCT: remove duplicates
SELECT DISTINCT hire_date FROM employees;

-- 6. ORDER BY: sort results (ASC by default)
SELECT * FROM employees ORDER BY salary DESC;
SELECT first_name, hire_date FROM employees ORDER BY hire_date ASC;

-- 7. LIMIT: restrict number of rows
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

-- 8. OFFSET (skip rows) – MySQL syntax: LIMIT offset, row_count
SELECT * FROM employees ORDER BY emp_id LIMIT 2, 2;   -- skip 2 rows, get next 2

-- 9. Concatenation and functions in SELECT
SELECT CONCAT(first_name, ' ', last_name) AS full_name, UPPER(email) FROM employees;