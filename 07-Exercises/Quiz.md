# MySQL Quiz

Test your knowledge after completing the modules. Answers are provided inline after each question (hidden with details/summary tags if used on a webpage, but listed here plainly).

## Questions

1. **What is the command to display all databases?**
   - Answer: `SHOW DATABASES;`

2. **Which SQL statement is used to add new rows into a table?**
   - Answer: `INSERT INTO`

3. **What is the difference between `DELETE` and `TRUNCATE`?**
   - Answer: `DELETE` removes rows one by one and can have a `WHERE` clause; `TRUNCATE` removes all rows quickly and resets auto-increment counters. `TRUNCATE` is DDL, `DELETE` is DML.

4. **How do you select unique values from a column?**
   - Answer: Use `SELECT DISTINCT column_name FROM table;`

5. **What does the `HAVING` clause do?**
   - Answer: Filters groups after `GROUP BY`, whereas `WHERE` filters rows before grouping.

6. **Write a query to find the second highest salary from an `employees` table.**
   - Answer: `SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);`

7. **What is a foreign key?**
   - Answer: A column that creates a relationship between two tables, referencing the primary key of another table.

8. **Explain `INNER JOIN` vs `LEFT JOIN`.**
   - Answer: `INNER JOIN` returns only matching rows from both tables. `LEFT JOIN` returns all rows from the left table and matching rows from the right (non-matching right side are NULL).

9. **How would you add an index to a column?**
   - Answer: `CREATE INDEX index_name ON table_name (column);`

10. **What is the purpose of a view?**
    - Answer: A virtual table based on a `SELECT` query. It simplifies complex queries, adds security, and provides a consistent interface.

## Challenge
Write a query to find customers who have never placed an order. (Assume `customers` and `orders` tables with `customer_id`.)