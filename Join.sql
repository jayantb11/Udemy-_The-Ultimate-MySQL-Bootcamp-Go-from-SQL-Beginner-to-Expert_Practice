-- Create the 'amazon' database
CREATE DATABASE amazon;

-- Create the 'customers' table
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

-- Create the 'orders' table
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Insert data into the 'customers' table
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

-- Insert data into the 'orders' table
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

-- Select all columns from both 'customers' and 'orders'
SELECT * FROM customers, orders;

-- Select all columns from 'customers' and 'orders' using INNER JOIN
SELECT * FROM customers 
JOIN orders ON customers.id = orders.customer_id;

-- Select specific columns from 'customers' and 'orders' using INNER JOIN
SELECT first_name, last_name, order_date, amount FROM customers 
JOIN orders ON customers.id = orders.customer_id;

-- Select specific columns and calculate the total amount spent by each customer
SELECT first_name, last_name, order_date, SUM(amount) AS total FROM customers 
JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name
ORDER BY total;

-- Select all columns from 'customers' and associated orders (if any)
SELECT * FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;

-- Select specific columns and calculate the total amount spent by each customer (including those with no orders)
SELECT first_name, last_name, IFNULL(SUM(amount), 0) FROM customers 
LEFT JOIN orders ON orders.customer_id = customers.id 
GROUP BY 1, 2;

-- Create the 'students' table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL
);

-- Create the 'papers' table
CREATE TABLE papers (
    title VARCHAR(100) NOT NULL,
    grade INT NOT NULL,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- Insert data into the 'students' table
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

-- Insert data into the 'papers' table
INSERT INTO papers (student_id, title, grade) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- Select specific columns from 'students' and 'papers' using INNER JOIN
SELECT first_name, title, grade FROM students 
JOIN papers ON students.id = papers.student_id;

-- Select specific columns from 'students' and 'papers' using LEFT JOIN
SELECT first_name, IFNULL(title, 'missing'), IFNULL(grade, 'missing') FROM students 
LEFT JOIN papers ON students.id = papers.student_id;

-- Select specific columns and calculate the average grade for each student along with a passing status
SELECT first_name, AVG(grade) AS 'AVERAGE', 
CASE
    WHEN AVG(grade) >= 75 THEN 'passing'
    ELSE 'failing'
END AS 'passing status' FROM students 
LEFT JOIN papers ON students.id = papers.student_id 
GROUP BY 1;

-- Create the 'reviewers' table
CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- Create the 'series' table
CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    released_year YEAR,
    genre VARCHAR(100)
);

-- Create the 'reviews' table
CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2, 1),
    series_id INT NOT NULL,
    reviewer_id INT NOT NULL,
    FOREIGN KEY (series_id) REFERENCES series(id),
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(id)
);

-- Insert data into the 'series' table
INSERT INTO series (title, released_year, genre) VALUES
('Archer', 2009, 'Animation'),
('Arrested Development', 2003, 'Comedy'),
("Bob's Burgers", 2011, 'Animation'),
('Bojack Horseman', 2014, 'Animation'),
("Breaking Bad", 2008, 'Drama'),
('Curb Your Enthusiasm', 2000, 'Comedy'),
("Fargo", 2014, 'Drama'),
('Freaks and Geeks', 1999, 'Comedy'),
('General Hospital', 1963, 'Drama'),
('Halt and Catch Fire', 2014, 'Drama'),
('Malcolm In The Middle', 2000, 'Comedy'),
('Pushing Daisies', 2007, 'Comedy'),
('Seinfeld', 1989, 'Comedy'),
('Stranger Things', 2016, 'Drama');

-- Insert data into the 'reviewers' table
INSERT INTO reviewers (first_name, last_name) VALUES
('Thomas', 'Stoneman'),
('Wyatt', 'Skaggs'),
('Kimbra', 'Masters'),
('Domingo', 'Cortes'),
('Colt', 'Steele'),
('Pinkie', 'Petit'),
('Marlon', 'Crafford');

-- Insert data into the 'reviews' table
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
(1, 1, 8.0),(1, 2, 7.5),(1, 3, 8.5),(1, 4, 7.7),(1, 5, 8.9),
(2, 1, 8.1),(2, 4, 6.0),(2, 3, 8.0),(2, 6, 8.4),(2, 5, 9.9),
(3, 1, 7.0),(3, 6, 7.5),(3, 4, 8.0),(3, 3,
