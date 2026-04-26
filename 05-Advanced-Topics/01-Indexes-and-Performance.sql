-- ============================================
-- Indexes & Query Performance
-- ============================================
USE sales_db;

-- 1. Create an index on a column to speed up searches
CREATE INDEX idx_customer_email ON customers(email);

-- Composite index on multiple columns
CREATE INDEX idx_order_customer_date ON orders(customer_id, order_date);

-- Full-text index (for natural language search)
-- CREATE FULLTEXT INDEX ft_product_name ON order_items(product_name);

-- 2. View all indexes on a table
SHOW INDEX FROM customers;

-- 3. Drop an index
-- DROP INDEX idx_customer_email ON customers;

-- 4. EXPLAIN: see how MySQL executes a query
EXPLAIN SELECT * FROM orders WHERE customer_id = 1;

-- Typical output shows possible_keys, key, rows scanned
-- 5. Query optimization tips:
--    - Use indexes on columns used in WHERE, JOIN, ORDER BY
--    - Avoid SELECT * in production
--    - Use LIMIT when only a few rows needed
--    - Avoid functions on indexed columns in WHERE (e.g., WHERE YEAR(hire_date) = 2023)