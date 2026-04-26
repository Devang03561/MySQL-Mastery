-- ============================================
-- Inserting Data (CREATE)
-- ============================================

-- Step 1: Create database & table
CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    salary DECIMAL(10,2) DEFAULT 50000
);

-- 1. Insert a single row (specify columns)
INSERT INTO employees (first_name, last_name, email, hire_date, salary)
VALUES ('John', 'Doe', 'john.doe@email.com', '2023-01-15', 75000);

-- 2. Insert multiple rows in one statement
INSERT INTO employees (first_name, last_name, email, hire_date, salary) VALUES
('Jane', 'Smith', 'jane.smith@email.com', '2023-02-20', 82000),
('Bob', 'Johnson', 'bob.j@email.com', '2023-03-10', 60000),
('Alice', 'Williams', NULL, '2023-04-05', 72000);   -- email can be NULL

-- 3. Insert using column defaults (skipping salary uses DEFAULT 50000)
INSERT INTO employees (first_name, last_name, email, hire_date)
VALUES ('Mike', 'Brown', 'mike.b@email.com', '2023-05-12');

-- 4. Insert without specifying column list (must provide values for all columns, including NULLs)
-- INSERT INTO employees VALUES (6, 'Sara', 'Connor', 'sara@email.com', '2023-06-01', 90000);

-- Check the results
SELECT * FROM employees;