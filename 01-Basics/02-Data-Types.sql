-- ============================================
-- MySQL Data Types – Quick Reference
-- ============================================

-- Numeric Types
-- INT: integer, 4 bytes, range -2,147,483,648 to 2,147,483,647
-- TINYINT: very small integer (0-255)
-- DECIMAL(M,D): exact fixed-point number, e.g., DECIMAL(10,2)
-- FLOAT, DOUBLE: approximate floating-point

-- String Types
-- CHAR(N): fixed-length string (max 255)
-- VARCHAR(N): variable-length string (max 65,535)
-- TEXT: large text (max 65,535)
-- ENUM: one value from a predefined list

-- Date & Time Types
-- DATE: 'YYYY-MM-DD'
-- TIME: 'HH:MM:SS'
-- DATETIME: 'YYYY-MM-DD HH:MM:SS'
-- TIMESTAMP: like DATETIME but influenced by time zone

-- Examples (will be used later)
-- CREATE TABLE demo (
--    id INT,
--    name VARCHAR(50),
--    price DECIMAL(8,2),
--    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );