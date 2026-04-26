-- ============================================
-- Self Join (joining a table to itself)
-- ============================================
CREATE DATABASE IF NOT EXISTS org;
USE org;

-- Employee table with manager reference
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

INSERT INTO employees VALUES
(1, 'CEO Alice', NULL),
(2, 'VP Bob', 1),
(3, 'Director Charlie', 2),
(4, 'Manager Dave', 2),
(5, 'Staff Eve', 4),
(6, 'Staff Frank', 3);

-- Self-join: find each employee's manager name
SELECT 
    e.emp_name AS employee,
    m.emp_name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id
ORDER BY e.emp_id;

-- Show hierarchy path (concept, not executable in all versions)
-- This can be extended using recursive CTEs (MySQL 8+)