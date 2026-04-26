-- ============================================
-- String & Date Functions
-- ============================================
USE company;

-- STRING FUNCTIONS
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    UPPER(first_name) AS upper_name,
    LOWER(last_name) AS lower_name,
    LENGTH(first_name) AS name_length,
    SUBSTRING(email, 1, 5) AS email_prefix,        -- first 5 chars
    REPLACE(email, '@email.com', '@company.com') AS corp_email,
    TRIM('  ' FROM first_name) AS trimmed_name     -- removes spaces
FROM employees;

-- DATE FUNCTIONS
SELECT 
    first_name,
    hire_date,
    YEAR(hire_date) AS hire_year,
    MONTH(hire_date) AS hire_month,
    DAY(hire_date) AS hire_day,
    DAYNAME(hire_date) AS hire_day_of_week,
    DATE_ADD(hire_date, INTERVAL 1 YEAR) AS anniversary,
    DATEDIFF(CURDATE(), hire_date) AS days_since_hired,
    CURDATE() AS today,
    NOW() AS current_datetime
FROM employees;

-- Formatting dates
SELECT first_name, DATE_FORMAT(hire_date, '%M %d, %Y') AS formatted_date
FROM employees;

-- IF() and CASE for conditional logic
SELECT 
    first_name,
    salary,
    IF(salary > 75000, 'High', 'Low') AS salary_level,
    CASE 
        WHEN salary < 65000 THEN 'Entry'
        WHEN salary BETWEEN 65000 AND 80000 THEN 'Mid'
        ELSE 'Senior'
    END AS grade
FROM employees;