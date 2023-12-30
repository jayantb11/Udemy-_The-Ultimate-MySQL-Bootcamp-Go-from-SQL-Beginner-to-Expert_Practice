-- create database amazon;
-- CREATE table customers(
-- id INT PRIMARY KEY auto_increment,
-- first_name VARCHAR(50),
-- last_name VARCHAR(50),
-- email VARCHAR(50)
-- );
-- CREATE TABLE orders(
-- id INT PRIMARY KEY auto_increment,
-- order_date Date,
-- amount decimal(8,2),
-- customer_id INT,
-- foreign key (customer_id) references customers(id)
-- )

-- INSERT INTO customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
--        
--        
-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016-02-10', 99.99, 1),
--        ('2017-11-11', 35.50, 1),
--        ('2014-12-12', 800.67, 2),
--        ('2015-01-03', 12.50, 2),
--        ('1999-04-11', 450.25, 5);

-- select * from customers,orders
-- select * from customers 
-- JOIN orders where customers.id=orders.customer_id
-- select first_name,last_name,order_date,amount FROM customers JOIN orders ON customers.id=orders.customer_id
-- select first_name,last_name,order_date,SUM(amount) as total from customers JOIN orders ON  customers.id=orders.customer_id
-- GROUP BY first_name,last_name
-- ORDER BY total
-- select * from customers LEFT JOIN orders ON customers.id=orders.customer_id 
-- select first_name,last_name,IFNULL(SUM(amount),0) from customers LEFT JOIN orders ON orders.customer_id=customers.id GROUP BY 1,2
-- CREATE TABLE students(
-- id INT primary key auto_increment,
-- first_name VARCHAR(100) NOT NULL
-- )
-- CREATE TABLE papers(
-- title VARCHAR(100) NOT NULL,
-- grade INT NOT NULL,
-- student_id int,
-- foreign key (student_id) references students(id)
-- )
-- INSERT INTO students (first_name) VALUES 
-- ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
--  
-- INSERT INTO papers (student_id, title, grade ) VALUES
-- (1, 'My First Book Report', 60),
-- (1, 'My Second Book Report', 75),
-- (2, 'Russian Lit Through The Ages', 94),
-- (2, 'De Montaigne and The Art of The Essay', 98),
-- (4, 'Borges and Magical Realism', 89);
-- select first_name,title,grade from students join papers ON students.id=papers.student_id
-- select first_name,ifnull(title,'missing'),ifnull(grade,'missing') from students left join papers ON students.id=papers.student_id
-- select first_name,avg(grade) as 'AVERAGE', 
-- CASE
-- when avg(grade)>=75 then 'passing'
-- else 'failing'
-- END as 'passing status' from students left join papers ON students.id=papers.student_id group by 1

-- CREATE TABLE reviewers (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL
-- );
--  
-- CREATE TABLE series (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(100),
--     released_year YEAR,
--     genre VARCHAR(100)
-- );
--  
-- CREATE TABLE reviews (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     rating DECIMAL(2 , 1 ),
--     series_id INT NOT NULL,
--     reviewer_id INT NOT NULL,
--     foreign key (series_id) references series(id),
--     foreign key (reviewer_id) references reviews(id)
--     );

-- INSERT INTO series (title, released_year, genre) VALUES
--     ('Archer', 2009, 'Animation'),
--     ('Arrested Development', 2003, 'Comedy'),
--     ("Bob's Burgers", 2011, 'Animation'),
--     ('Bojack Horseman', 2014, 'Animation'),
--     ("Breaking Bad", 2008, 'Drama'),
--     ('Curb Your Enthusiasm', 2000, 'Comedy'),
--     ("Fargo", 2014, 'Drama'),
--     ('Freaks and Geeks', 1999, 'Comedy'),
--     ('General Hospital', 1963, 'Drama'),
--     ('Halt and Catch Fire', 2014, 'Drama'),
--     ('Malcolm In The Middle', 2000, 'Comedy'),
--     ('Pushing Daisies', 2007, 'Comedy'),
--     ('Seinfeld', 1989, 'Comedy'),
--     ('Stranger Things', 2016, 'Drama');
--  
--  
-- INSERT INTO reviewers (first_name, last_name) VALUES
--     ('Thomas', 'Stoneman'),
--     ('Wyatt', 'Skaggs'),
--     ('Kimbra', 'Masters'),
--     ('Domingo', 'Cortes'),
--     ('Colt', 'Steele'),
--     ('Pinkie', 'Petit'),
--     ('Marlon', 'Crafford');
--     
--  
-- INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
--     (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
--     (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
--     (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
--     (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
--     (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
--     (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
--     (7,2,9.1),(7,5,9.7),
--     (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
--     (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
--     (10,5,9.9),
--     (13,3,8.0),(13,4,7.2),
--     (14,2,8.5),(14,3,8.9),(14,4,8.9);
-- select title,rating from series join reviews on series.id=reviews.series_id
-- select title,AVG(rating) AS 'average' from series join reviews on series.id=reviews.series_id group by 1 order by 2
-- select first_name,last_name,rating from reviews join reviewers on reviews.reviewer_id=reviewers.id 
-- select title from series left join reviews on series.id=reviews.series_id where reviews.series_id is null
-- select genre,round(avg(rating),2) from series join reviews on series.id=reviews.series_id group by 1
-- select first_name,last_name,COUNT(rating),min(rating),max(rating),AVG(rating),
-- CASE 
-- WHEN count(rating)=0 then 'inactive'
-- else 'active'
-- END as 'status' from reviewers left join reviews on reviewers.id=reviews.reviewer_id group by 2,1 
-- CREATE VIEW full_review as
-- select title,rating,concat(first_name,' ',last_name),genre,released_year as reviewer from reviews
-- JOIN series ON reviews.series_id=series.id
-- CREATE view ordered_series as 
-- select * from series order by released_year 
-- CREATE OR replace VIEW ordered_series as
-- select * from series order by released_year 
-- alter VIEW ordered_series as
-- select * from series order by released_year; 
-- drop VIEW ordered_series;
-- select * from full_series
-- select title,AVG(rating),count(rating) from full_review GROUP by title having count(rating)>2;
-- select title,avg(rating) from full_reviews group by title;
-- select reviewer,genre,avg(rating) from full_review group by reviewer,genre with rollup
-- select @@GLOBAL.sql_mode;
-- select 3/0
-- select 
-- desc reviews;
show warnings;
