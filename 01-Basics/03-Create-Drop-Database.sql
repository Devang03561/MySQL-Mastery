-- ============================================
-- Managing Databases & Tables
-- ============================================

-- Show all existing databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE my_store;

-- Switch to the database before creating tables
USE my_store;

-- Create a simple table
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- See the table structure
DESCRIBE products;
-- Or: SHOW COLUMNS FROM products;

-- Drop the table (be careful: irreversible!)
DROP TABLE products;

-- Drop the database
DROP DATABASE my_store;

-- *** Safe practice: use IF EXISTS to avoid errors ***
CREATE DATABASE IF NOT EXISTS learning_sql;
USE learning_sql;
DROP DATABASE IF EXISTS learning_sql;