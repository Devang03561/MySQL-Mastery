-- ============================================
-- Aggregate Functions & GROUP BY
-- ============================================
USE company;

-- Aggregate functions: operate on set of rows
-- COUNT, SUM, AVG, MIN, MAX

-- 1. COUNT (number of rows)
SELECT COUNT(*) AS total_employees FROM employees;
SELECT COUNT(email) AS employees_with_email FROM employees;  -- excludes NULLs
SELECT COUNT(DISTINCT hire_date) AS unique_hire_dates FROM employees;

-- 2. SUM (total)
SELECT SUM(salary) AS total_salary_cost FROM employees;

-- 3. AVG (average)
SELECT AVG(salary) AS average_salary FROM employees;

-- 4. MIN and MAX
SELECT MIN(salary) AS lowest_salary, MAX(salary) AS highest_salary FROM employees;

-- GROUP BY: group rows that have same values
-- Let's add a department column for demonstration
ALTER TABLE employees ADD COLUMN department VARCHAR(50);

UPDATE employees SET department = 'Engineering' WHERE emp_id IN (1,3);
UPDATE employees SET department = 'Marketing' WHERE emp_id IN (2,4);
UPDATE employees SET department = 'HR' WHERE emp_id = 5;

-- Count employees per department
SELECT department, COUNT(*) AS count
FROM employees
GROUP BY department;

-- Total salary per department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- HAVING: filter after GROUP BY (like WHERE for groups)
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 70000;

-- Combine with WHERE (filters rows before grouping)
SELECT department, COUNT(*) AS high_earners
FROM employees
WHERE salary > 65000
GROUP BY department
HAVING COUNT(*) >= 1
ORDER BY high_earners DESC;