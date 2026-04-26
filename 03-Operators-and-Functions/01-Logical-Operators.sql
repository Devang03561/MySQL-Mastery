-- ============================================
-- Logical Operators (AND, OR, NOT, XOR)
-- ============================================
USE company;

-- AND: all conditions must be true
SELECT * FROM employees
WHERE salary > 60000 AND hire_date >= '2023-02-01';

-- OR: at least one condition true
SELECT * FROM employees
WHERE first_name = 'John' OR first_name = 'Jane';

-- NOT: negates condition
SELECT * FROM employees
WHERE NOT salary > 80000;   -- same as salary <= 80000

-- XOR: exactly one condition true (MySQL extension)
SELECT * FROM employees
WHERE (salary > 80000) XOR (hire_date > '2023-04-01');

-- Combining with parentheses for clarity
SELECT * FROM employees
WHERE (salary > 70000 AND hire_date < '2023-03-01') 
   OR (first_name LIKE 'J%' AND email IS NOT NULL);