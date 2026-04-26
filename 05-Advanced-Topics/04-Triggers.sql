-- ============================================
-- Triggers (Automated actions on events)
-- ============================================
USE sales_db;

-- 1. BEFORE INSERT Trigger: automatically set creation date if NULL
DELIMITER //
CREATE TRIGGER before_customer_insert
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    IF NEW.registration_date IS NULL THEN
        SET NEW.registration_date = CURDATE();
    END IF;
END //

-- 2. AFTER INSERT Trigger: log new customer creation into an audit table
CREATE TABLE customer_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    action VARCHAR(50),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) //

CREATE TRIGGER after_customer_insert
AFTER INSERT ON customers
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit (customer_id, action)
    VALUES (NEW.customer_id, 'INSERT');
END //

-- 3. BEFORE UPDATE Trigger: prevent email change to NULL
CREATE TRIGGER before_customer_update
BEFORE UPDATE ON customers
FOR EACH ROW
BEGIN
    IF NEW.email IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email cannot be NULL';
    END IF;
END //

-- 4. AFTER DELETE Trigger: log deletions
CREATE TRIGGER after_customer_delete
AFTER DELETE ON customers
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit (customer_id, action)
    VALUES (OLD.customer_id, 'DELETE');
END //

DELIMITER ;

-- Test triggers
INSERT INTO customers (first_name, last_name, email) VALUES ('New', 'User', 'new@example.com');
-- Check audit
SELECT * FROM customer_audit;
-- Try to update email to NULL (will fail)
-- UPDATE customers SET email = NULL WHERE customer_id = 3;