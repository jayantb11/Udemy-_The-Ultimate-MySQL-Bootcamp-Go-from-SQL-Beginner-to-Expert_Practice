-- Switch to the 'bookshop' database
USE bookshop;

-- Create a table 'contacts' with columns 'name' and 'phone'
CREATE TABLE contacts (
    name VARCHAR(100) NOT NULL,
    phone INT NOT NULL UNIQUE
);

-- Insert records into the 'contacts' table
INSERT INTO contacts (name, phone) VALUES ('billybob', 934922);
INSERT INTO contacts (name, phone) VALUES ('billybob', 432021);

-- Create a table 'parties' with columns 'name' and 'age' with a check constraint
CREATE TABLE parties (
    name VARCHAR(50),
    age INT CHECK (age > 18)
);

-- Insert a record into the 'parties' table
INSERT INTO parties (name, age) VALUES ("Jayant", 19);

-- Create a table 'palindrome' with a column 'word' and a check constraint for palindrome
CREATE TABLE palindrome (
    word VARCHAR(100) CHECK (REVERSE(word) = word)
);

-- Create a table 'user2' with columns 'username' and 'age' with a check constraint
CREATE TABLE user2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_check CHECK (age > 18)
);

-- Insert a record into the 'user2' table
INSERT INTO user2 (username, age) VALUES ('jayant', 19);

-- Select all records from the 'user2' table
SELECT * FROM user2;

-- Create a table 'companies' with columns 'supplier_id', 'name', 'phone', 'address'
-- and constraints for primary key and unique combination of 'name' and 'address'
CREATE TABLE companies (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT name_address UNIQUE (name, address)
);

-- Insert records into the 'companies' table
INSERT INTO companies (name, phone, address) VALUES ('jayant', '9592633222', '1715 sector 23B CHandigarh');
INSERT INTO companies (name, phone, address) VALUES ('jayant', '+12014238003', '1715 sector 23B CHandigarh');

-- Create a table 'houses' with columns 'purchase_price' and 'sale_price'
-- and a check constraint ensuring 'sale_price' is greater than 'purchase_price'
CREATE TABLE houses (
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT pp_gt_sp CHECK (sale_price > purchase_price)
);

-- Insert a record into the 'houses' table
INSERT INTO houses (purchase_price, sale_price) VALUES (23000, 24000);

-- Alter the 'companies' table by adding a new column 'phones'
ALTER TABLE companies ADD COLUMN phones VARCHAR(15);

-- Alter the 'suppliers' table by dropping the 'city' column
ALTER TABLE suppliers DROP COLUMN city;

-- Rename the 'companies' table to 'suppliers'
ALTER TABLE companies RENAME TO suppliers;

-- Rename the 'name' column of the 'suppliers' table to 'biz_name'
ALTER TABLE suppliers RENAME COLUMN name TO biz_name;

-- Alter the 'suppliers' table by changing the column 'biz_name' to 'VARCHAR(50)'
ALTER TABLE suppliers CHANGE biz_name biz_name VARCHAR(50);

-- Alter the 'houses' table by adding a check constraint for positive 'purchase_price'
ALTER TABLE houses ADD CONSTRAINT positive_price CHECK (purchase_price >= 0);
