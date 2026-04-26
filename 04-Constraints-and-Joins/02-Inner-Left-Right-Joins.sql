-- ============================================
-- Joins (INNER, LEFT, RIGHT, CROSS)
-- ============================================
USE sales_db;

-- INNER JOIN: returns rows with matching values in both tables
SELECT 
    c.first_name, c.last_name, o.order_id, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- LEFT JOIN: all rows from left table, matched + NULLs from right
SELECT 
    c.first_name, c.last_name, o.order_id, o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN: all rows from right table, matched + NULLs from left
-- (Often achieved by swapping table order and using LEFT JOIN)
SELECT 
    c.first_name, c.last_name, o.order_id, o.total_amount
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- CROSS JOIN: Cartesian product (every row combination)
SELECT c.first_name, o.order_id
FROM customers c
CROSS JOIN orders o;   -- Rarely used in practice

-- Join with multiple conditions
-- Only orders with total > 100
SELECT c.first_name, o.order_id, o.total_amount
FROM customers c
INNER JOIN orders o 
    ON c.customer_id = o.customer_id 
    AND o.total_amount > 100;

-- Join three tables: add order_items table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO order_items (order_id, product_name, quantity, price) VALUES
(1, 'Widget', 2, 50.00),
(1, 'Gadget', 1, 50.00),
(2, 'Widget', 4, 50.00);

-- Join customers -> orders -> order_items
SELECT 
    c.first_name,
    o.order_date,
    oi.product_name,
    oi.quantity,
    oi.price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id;