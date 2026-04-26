-- ============================================
-- WHERE Clause – Filtering Data
-- ============================================
USE company;

-- Comparison operators: =, <>, !=, >, <, >=, <=
SELECT * FROM employees WHERE salary > 70000;
SELECT * FROM employees WHERE hire_date = '2023-03-10';

-- AND / OR
SELECT * FROM employees 
WHERE salary >= 60000 AND hire_date > '2023-03-01';

SELECT * FROM employees 
WHERE salary > 80000 OR first_name = 'Alice';

-- BETWEEN (inclusive)
SELECT * FROM employees 
WHERE salary BETWEEN 60000 AND 80000;

SELECT * FROM employees 
WHERE hire_date BETWEEN '2023-01-01' AND '2023-03-31';

-- IN (match any value in list)
SELECT * FROM employees 
WHERE first_name IN ('John', 'Jane', 'Bob');

-- LIKE (pattern matching)
-- % = any sequence of characters, _ = single character
SELECT * FROM employees WHERE email LIKE '%@email.com';
SELECT * FROM employees WHERE first_name LIKE 'J%';     -- starts with J
SELECT * FROM employees WHERE first_name LIKE '_o%';   -- second letter is 'o'

-- IS NULL / IS NOT NULL
SELECT * FROM employees WHERE email IS NULL;
SELECT * FROM employees WHERE email IS NOT NULL;

-- NOT
SELECT * FROM employees WHERE NOT salary > 70000;

-- Combining everything
SELECT first_name, last_name, salary 
FROM employees
WHERE (salary > 60000 OR hire_date > '2023-03-01')
  AND email IS NOT NULL
ORDER BY salary DESC;