-- Switch to the 'bookshop' database
use bookshop
-- Insert new records into the 'books' table
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- Select distinct last names of authors from the 'books' table
SELECT DISTINCT author_lname FROM books;

-- Select distinct full names of authors and their corresponding released years from the 'books' table
SELECT DISTINCT CONCAT(author_fname,' ',author_lname), released_year FROM books;

-- Select all columns from the 'books' table and order the results by released year in descending order
SELECT * FROM books ORDER BY released_year DESC;

-- Select all columns from the 'books' table and order the results by author first name and last name
SELECT * FROM books ORDER BY author_fname, author_lname;

-- Select all columns from the 'books' table, order the results by released year in ascending order, and limit to 5 rows
SELECT * FROM books ORDER BY released_year LIMIT 5;

-- Select all columns from the 'books' table, order the results by released year in ascending order, and skip the first 5 rows
SELECT * FROM books ORDER BY released_year LIMIT 5,2;

-- Select all columns from the 'books' table where author first name ends with 'da'
SELECT * FROM books WHERE author_fname LIKE '%da';

-- Select all columns from the 'books' table where author first name has exactly four characters
SELECT * FROM books WHERE author_fname LIKE '____';

-- Select all columns from the 'books' table where the title contains the character '%'
SELECT * FROM books WHERE title LIKE '%\%%';

-- Select all columns from the 'books' table where the title contains the word 'stories'
SELECT * FROM books WHERE title LIKE '%stories%';

-- Select all columns from the 'books' table, order the results by pages in descending order, and limit to 1 row
SELECT * FROM books ORDER BY pages DESC LIMIT 1;

-- Select a concatenated string indicating the title and release year of the top 3 recently released books
SELECT CONCAT(title,' was released - ',released_year) FROM books ORDER BY released_year DESC LIMIT 3;

-- Select the title and author's last name from the 'books' table where the author's last name contains a space
-- SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

-- Select the title, release year, and stock quantity from the 'books' table, ordered by stock quantity, and limit to 3 rows
-- SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

-- Select the title and author's last name from the 'books' table, ordered by the second and first columns
-- SELECT title, author_lname FROM books ORDER BY 2,1;

-- Select a string indicating the favorite author using uppercase and concatenation, ordered by author last name
-- SELECT CONCAT(
--     'MY FAVORITE AUTHOR IS ',
--     UPPER(author_fname),
--     ' ',
--     UPPER(author_lname),
--     '!'
-- ) AS yell FROM books ORDER BY author_lname;
