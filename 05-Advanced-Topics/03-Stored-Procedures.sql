-- ============================================
-- Stored Procedures
-- ============================================
USE sales_db;

-- Change delimiter to allow semicolons inside procedure
DELIMITER //

-- Procedure without parameters
CREATE PROCEDURE GetAllCustomers()
BEGIN
    SELECT * FROM customers;
END //

-- Procedure with IN parameter
CREATE PROCEDURE GetCustomerOrders(IN cust_id INT)
BEGIN
    SELECT o.order_id, o.order_date, o.total_amount
    FROM orders o
    WHERE o.customer_id = cust_id;
END //

-- Procedure with OUT parameter (returns value)
CREATE PROCEDURE GetCustomerCount(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM customers;
END //

-- Procedure using INOUT, variables, IF logic
CREATE PROCEDURE AdjustSalary(IN emp_id INT, INOUT salary_amount DECIMAL(10,2))
BEGIN
    -- Example logic: increase by 10% if current < 60000
    SELECT salary INTO salary_amount FROM employees WHERE emp_id = emp_id;
    IF salary_amount < 60000 THEN
        SET salary_amount = salary_amount * 1.10;
    END IF;
END //

DELIMITER ;

-- CALLING PROCEDURES
CALL GetAllCustomers();
CALL GetCustomerOrders(1);

-- Call OUT parameter procedure
CALL GetCustomerCount(@total);
SELECT @total AS customer_count;

-- Call INOUT procedure (prepare variable)
SET @emp_salary = 0;
CALL AdjustSalary(3, @emp_salary);
SELECT @emp_salary;