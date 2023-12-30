-- Create the 'books' table
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

-- Insert data into the 'books' table
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
-- ... (additional book entries)
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- Select all columns and concatenate author's first and last name as 'full_name'
SELECT *, CONCAT(author_fname,' ',author_lname) as 'full_name' FROM books;

-- Example of using the SUBSTRING function
SELECT SUBSTRING('Hello World',1,4);

-- Example of using the SUBSTRING function to get part of the 'title' column
SELECT SUBSTRING(title,1,5) FROM books;

-- Switch back to the 'bookshop' database
-- Example of using CONCAT and SUBSTRING to limit the display of 'title'
SELECT CONCAT(SUBSTRING(title,1,10),"....") FROM books;

-- Example of using REPLACE to change characters in a string
SELECT REPLACE('www.sql.com','w','Ww');

-- Example of using REPLACE to replace spaces with 'and' in a string
SELECT REPLACE ('cheese breed coffee milk',' ',' and ');

-- Example of using REPLACE to replace spaces with underscores in the 'title' column
SELECT REPLACE(title,' ','_') FROM books;

-- Example of using REVERSE to reverse a string
SELECT REVERSE("Hello");

-- Example of using CONCAT and REVERSE to concatenate the author's first name with its reverse
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

-- Example of using CHAR_LENGTH to get the length of a string
SELECT CHAR_LENGTH('Hello World');

-- Example of using CHAR_LENGTH to get the length of the 'title' column
SELECT CHAR_LENGTH(title) FROM books;

-- Example of using LOWER to convert a string to lowercase
SELECT LOWER("Hello World");

-- Example of using INSERT to insert a substring into a string
SELECT INSERT("Hello World",6,0,'there');

-- Example of using INSERT to replace a substring in a string
SELECT INSERT("Hello World",6,6,'there');

-- Example of using RIGHT to get the last 3 characters of a string
SELECT RIGHT('omghaha',3);

-- Example of using REPEAT to repeat a string
SELECT REPEAT('ha',4);

-- Example of using TRIM to remove leading and trailing spaces from a string
SELECT TRIM('   san antonio   ');

-- Example of using TRIM with LEADING to remove leading dots from a string
SELECT TRIM(LEADING '.' FROM '......san antonio..');

-- Example of using TRIM with BOTH to remove leading and trailing dots from a string
SELECT TRIM(BOTH '.' FROM '......san antonio..');

-- Example of using REPLACE to replace spaces with '->' in the 'title' column
SELECT REPLACE(title,' ','->') FROM books;

-- Example of using REVERSE and CONCAT to reverse the 'author_lname' column and display it in uppercase
SELECT UPPER(CONCAT(author_fname,' ',author_lname)) as 'full name in caps' FROM books;

-- Example of using CONCAT to create a sentence using the 'title' and 'released_year' columns
SELECT CONCAT(title,' was released in ',released_year) FROM books;

-- Example of using CONCAT and SUBSTRING to create short titles with a maximum length of 10 characters
SELECT CONCAT(SUBSTRING(title,1,10),'...') AS 'short_titles',
       CONCAT(author_lname,',',author_fname) as author,
       CONCAT('This is the stock availiable ',stock_quantity) as stocks
FROM books;
