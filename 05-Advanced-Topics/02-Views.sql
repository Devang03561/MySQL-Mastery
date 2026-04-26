-- ============================================
-- Views (Virtual Tables)
-- ============================================
USE sales_db;

-- 1. Create a view as a stored SELECT query
CREATE VIEW customer_order_summary AS
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 2. Query the view like a regular table
SELECT * FROM customer_order_summary;
SELECT * FROM customer_order_summary WHERE total_spent > 150;

-- 3. Updateable views: a view based on a single table without aggregation
CREATE VIEW customer_contacts AS
SELECT customer_id, first_name, last_name, email, phone FROM customers;

-- You can INSERT, UPDATE, DELETE on this view (affects the base table)
-- UPDATE customer_contacts SET phone = '1111111111' WHERE customer_id = 1;

-- 4. WITH CHECK OPTION: ensures modifications stay within view's filter
CREATE VIEW vip_customers AS
SELECT * FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE total_amount > 100)
WITH CHECK OPTION;

-- 5. Drop a view
-- DROP VIEW IF EXISTS customer_order_summary;