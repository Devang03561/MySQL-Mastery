-- ============================================
-- Constraints, Primary Keys & Foreign Keys
-- ============================================
CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;

-- Table with constraints
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,   -- Primary key, auto-increment
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,            -- Unique and not null
    phone VARCHAR(20),
    registration_date DATE DEFAULT (CURRENT_DATE), -- Default value
    CHECK (CHAR_LENGTH(phone) >= 10)              -- Table check constraint
);

-- Child table with foreign key
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    -- Foreign key referencing customers table
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id)
        ON DELETE CASCADE      -- If customer deleted, delete their orders
        ON UPDATE CASCADE      -- If customer ID updated, update here too
);

-- ALTER TABLE to add constraints later
ALTER TABLE orders
ADD COLUMN status VARCHAR(20) DEFAULT 'Pending';

ALTER TABLE orders
ADD CONSTRAINT chk_status CHECK (status IN ('Pending','Shipped','Delivered','Cancelled'));

-- Insert sample data
INSERT INTO customers (first_name, last_name, email, phone) VALUES
('Alice', 'Smith', 'alice@example.com', '1234567890'),
('Bob', 'Jones', 'bob@example.com', '0987654321');

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2025-01-10', 150.00),
(1, '2025-02-15', 200.00),
(2, '2025-01-20', 99.99);