
**07-Exercises/Practice-Problems.sql**
```sql
-- ============================================
-- Practice Problems (MySQL)
-- Try to solve before looking at the solutions below.
-- ============================================

-- Use the ecommerce_db (or any) schema.

-- 1. List all products that have never been ordered.
-- Solution:
-- SELECT p.* FROM products p
-- LEFT JOIN order_items oi ON p.product_id = oi.product_id
-- WHERE oi.item_id IS NULL;

-- 2. Find the top 3 customers by total spending.
-- Solution:
-- SELECT u.username, SUM(o.total_amount) as total_spent
-- FROM users u
-- JOIN orders o ON u.user_id = o.user_id
-- GROUP BY u.user_id
-- ORDER BY total_spent DESC
-- LIMIT 3;

-- 3. For each category, display the number of products and average price.
-- Solution:
-- SELECT c.name, COUNT(p.product_id), AVG(p.price)
-- FROM categories c
-- LEFT JOIN products p ON c.category_id = p.category_id
-- GROUP BY c.category_id;

-- 4. Write a query to duplicate the price of all products in 'Electronics' category.
-- Solution:
-- UPDATE products
-- SET price = price * 2
-- WHERE category_id = (SELECT category_id FROM categories WHERE name = 'Electronics');

-- 5. Create a view that shows order summary: order_id, customer name, number of items, total amount.
-- Solution:
-- CREATE VIEW order_summary AS
-- SELECT o.order_id, u.username, COUNT(oi.item_id) AS items, o.total_amount
-- FROM orders o
-- JOIN users u ON o.user_id = u.user_id
-- JOIN order_items oi ON o.order_id = oi.order_id
-- GROUP BY o.order_id;

-- 6. Use a self-join to find employees who earn more than their manager (use org.employees table from 04-Constraints-and-Joins).
-- Solution:
-- SELECT e.emp_name, e.salary, m.emp_name AS manager, m.salary AS manager_salary
-- FROM employees e
-- JOIN employees m ON e.manager_id = m.emp_id
-- WHERE e.salary > m.salary;

-- 7. Write a stored procedure that accepts a category name and returns all products in that category.
-- Solution:
-- DELIMITER //
-- CREATE PROCEDURE GetProductsByCategory(IN cat_name VARCHAR(100))
-- BEGIN
--     SELECT p.* FROM products p
--     JOIN categories c ON p.category_id = c.category_id
--     WHERE c.name = cat_name;
-- END //
-- DELIMITER ;

-- 8. Create a trigger that prevents deleting a product if it exists in any order.
-- Solution:
-- DELIMITER //
-- CREATE TRIGGER prevent_product_delete
-- BEFORE DELETE ON products
-- FOR EACH ROW
-- BEGIN
--     DECLARE order_count INT;
--     SELECT COUNT(*) INTO order_count FROM order_items WHERE product_id = OLD.product_id;
--     IF order_count > 0 THEN
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete product with existing orders';
--     END IF;
-- END //
-- DELIMITER ;