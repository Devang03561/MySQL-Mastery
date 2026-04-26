-- Library Management System Database
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    isbn VARCHAR(20) UNIQUE,
    published_year INT,
    copies_available INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE borrowings (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    CHECK (due_date > borrow_date)
);

-- Sample Data
INSERT INTO authors (name, birth_year) VALUES 
('J.K. Rowling', 1965),
('George R.R. Martin', 1948),
('J.R.R. Tolkien', 1892);

INSERT INTO books (title, author_id, isbn, published_year, copies_available) VALUES
('Harry Potter and the Philosopher''s Stone', 1, '9780747532699', 1997, 5),
('A Game of Thrones', 2, '9780553103540', 1996, 3),
('The Hobbit', 3, '9780547928227', 1937, 2);

INSERT INTO members (full_name, email) VALUES
('Alice Anderson', 'alice@example.com'),
('Bob Brown', 'bob@example.com');

INSERT INTO borrowings (book_id, member_id, borrow_date, due_date) VALUES
(1, 1, '2025-04-01', '2025-04-15');