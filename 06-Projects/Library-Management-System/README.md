# Library Management System Schema

This SQL script creates a relational database for a small library. It includes tables for books, members, borrowing records, and authors.

## Tables
- `authors` – Author details.
- `books` – Book information with foreign key to authors.
- `members` – Library members.
- `borrowings` – Records of books borrowed, with due dates and return status.

## How to Run
1. Open your MySQL client.
2. Source the file: `source library_schema.sql;`
3. Explore the schema and run the included sample queries.

Use these tables to practice joins, aggregations, and date functions.