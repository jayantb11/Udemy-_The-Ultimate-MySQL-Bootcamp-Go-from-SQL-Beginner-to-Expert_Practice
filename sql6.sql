-- Switch to the 'bookshop' database
use bookshop;
-- Count the total number of records in the 'books' table
SELECT COUNT(*) FROM books;

-- Count the number of non-null values in the 'author_lname' column
SELECT COUNT(author_lname) FROM books;

-- Count the number of distinct values in the 'author_lname' column
SELECT COUNT(DISTINCT author_lname) FROM books;

-- Count the number of books for each author's last name and order the result in descending order
SELECT COUNT(*), author_lname FROM books GROUP BY author_lname ORDER BY 1 DESC;

-- Select the minimum released year for each author's last name
SELECT MIN(released_year) FROM books GROUP BY author_lname;

-- Select all columns from the 'books' table where the number of pages is equal to the minimum number of pages
SELECT * FROM books WHERE pages = (SELECT MIN(pages) FROM books);

-- Count the number of books for each author's first and last name
SELECT COUNT(*), author_fname, author_lname FROM books GROUP BY 2, 3;

-- Select the concatenated author's full name and count of books for each author
SELECT CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*) FROM books GROUP BY author;

-- Select the author's last name and the minimum released year for each author
SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;

-- Select various statistics for each author's last name, including the number of books written, latest release year, earliest release year, and longest page count
SELECT 
    author_lname, 
    COUNT(*) as books_written, 
    MAX(released_year) AS latest_release,
    MIN(released_year)  AS earliest_release,
    MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname;

-- Select the sum of all page counts in the 'books' table
SELECT SUM(pages) FROM books;

-- Select the author's last name and the sum of page counts for each author
SELECT author_lname, SUM(pages) FROM books GROUP BY author_lname;

-- Select the author's last name, count of books, and average released year for each author
SELECT author_lname, COUNT(*), AVG(released_year) FROM books GROUP BY author_lname;

-- Select the released year, average stock quantity, and count of books for each released year
SELECT 
    released_year, 
    AVG(stock_quantity), 
    COUNT(*) 
FROM books
GROUP BY released_year;

-- Select the sum of all stock quantities in the 'books' table
SELECT SUM(stock_quantity) FROM books;

-- Select the count of books and released year for each released year
SELECT COUNT(*), released_year FROM books GROUP BY 2;

-- Select the count of books, author's last name, author's first name, and average released year for each author
SELECT COUNT(*), author_lname, author_fname, AVG(released_year) FROM books GROUP BY 2, 3;

-- Select the concatenated full name of the author for the book with the maximum number of pages
SELECT CONCAT(author_fname, ' ', author_lname) AS 'Full Name' FROM books WHERE pages = (SELECT MAX(pages) FROM books);

-- Select the released year, count of books, and average number of pages for each released year
SELECT released_year, COUNT(*) as 'books', AVG(pages) FROM books GROUP BY 1;

-- Switch to the 'bookshop' database
-- Select all columns from the 'states' table
-- SELECT * FROM states;

-- Create a new table 'product' with a column 'amount'
-- CREATE TABLE product (amount DECIMAL(5,2));

-- Insert a record into the 'product' table
-- INSERT INTO product (amount) VALUES (4.50);

-- Create a new table 'number' with columns 'x' and 'y'
-- CREATE TABLE number(x float, y decimal);

-- Insert a record into the 'number' table
-- INSERT INTO number (x, y) VALUES (1.23, 1.23);

-- Switch to the 'bookshop' database
-- Create a new table 'people' with columns 'name', 'birthdate', 'birthtime', and 'birthdt'
-- CREATE TABLE people(name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);

-- Insert records into the 'people' table
-- INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES 
--    ('Elton', '2000-12-25', '16:00:00', '2000-12-25 11:00:00'),
--    ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10'),
--    ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00'),
--    ('Hazel', CURDATE(), CURTIME(), NOW());

-- Select current date, current time, and current timestamp
-- SELECT CURDATE(), CURRENT_TIME(), NOW();

-- Select birthdate from the 'people' table
-- SELECT birthdate FROM people;

-- Select birthdate and the day of the month from the 'people' table
-- SELECT birthdate, DAY(birthdate) FROM people;

-- Select the day of the week from the 'people' table
-- SELECT DAYOFWEEK(birthdate) FROM people;

-- Select the month name from the 'people' table
-- SELECT MONTHNAME(birthdate) FROM people;

-- Select various components of the birth date and time from the 'people' table
-- SELECT 
--     birthdt,
--     MONTH(birthdt),
--     DAY(birthdt),
--     HOUR(birthdt),
--     MINUTE(birthdt)
-- FROM people;

-- Select birthdate and a formatted date from the 'people' table
-- SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;

-- Select birthdt and a formatted time from the 'people' table
-- SELECT birthdt, DATE
