-- use bookshop;
-- SELECT COUNT(*) FROM books;
 
-- SELECT COUNT(author_lname) FROM books;
--  
-- SELECT COUNT(DISTINCT author_lname) FROM books;
-- select COUNT(*),author_lname from books group by author_lname order by 1 DESC
-- select MIN(released_year) from books group by 1
-- select * from books where pages= (SELECT min(pages) from books )
-- select count(*),author_fname,author_lname from books group by 2,3 
-- SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
-- FROM books
-- GROUP BY author;
-- select author_lname,MIN(released_year) from books group by author_lname
-- SELECT 
-- 	author_lname, 
-- 	COUNT(*) as books_written, 
-- 	MAX(released_year) AS latest_release,
-- 	MIN(released_year)  AS earliest_release,
--       MAX(pages) AS longest_page_count
-- FROM books GROUP BY author_lname;
-- select SUM(pages) from books;
-- select author_lname,SUM(pages) from books group by author_lname
-- select author_lname,COUNT(*),avg(released_year) from books group by author_lname
-- SELECT 
--     released_year, 
--     AVG(stock_quantity), 
--     COUNT(*) FROM books
-- GROUP BY released_year;
-- select sum(stock_quantity) from books
-- select count(*),released_year from books group by 2
-- select count(*),author_lname,author_fname,avg(released_year) from books group by 2,3
-- select concat(author_fname,' ',author_lname) AS 'Full Name' from books where pages=(select MAX(pages) from books)
-- select released_year,COUNT(*) as 'books',AVG(pages) from books group by 1
-- use bookshop; 
-- select * from states
-- CREATE TABLE product
-- (amount DECIMAL(5,2));
-- insert into product (amount) values (4.50)
-- select 
-- CREATE TABLE number(x float,y decimal)
-- insert into number (x,y) values (1.23,1.23)
-- use bookshop;
-- CREATE TABLE people(
-- name VARCHAR(100),
-- birthdate DATE,
-- birthtime time,
-- birthdt datetime
-- )
-- INSERT INTO people (name,birthdate,birthtime,birthdt) values ('Elton','2000-12-25','16:00:00','2000-12-25 11:00:00')
-- INSERT INTO people (name, birthdate, birthtime, birthdt)
-- VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
--  
-- INSERT INTO people (name, birthdate, birthtime, birthdt)
-- VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');
-- INSERT INTO people (name, birthdate, birthtime, birthdt)
-- VALUES ('Hazel', CURDATE(), CURTIME(), NOW());
-- select curdate(),current_time(),NOW()
-- select birthdate from people 
-- select birthdate,day(birthdate) from people;
-- select dayofweek(birthdate) from people;
-- select monthname(birthdate) from people;
-- SELECT 
--     birthdt,
--     MONTH(birthdt),
--     DAY(birthdt),
--     HOUR(birthdt),
--     MINUTE(birthdt)
-- FROM people;
-- SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
--  
-- SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
--  
-- SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;
-- select DATEDIFF(curdate(),birthdate) from people;
-- select date_add(curdate(),interval 1 year)
-- create table captions(
-- text varchar(150),
-- created_at timestamp default current_timestamp);

-- create table captions2(
-- text varchar(150),
-- created_at timestamp default current_timestamp);
-- CREATE TABLE captions3 (
--   text VARCHAR(150),
--   created_at TIMESTAMP default CURRENT_TIMESTAMP,
--   updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- );
-- SELECT current_time();
-- SELECT dayofweek(current_day());
-- use bookshop;
-- select title,author_lname from books where author_lname!='Gaiman'
-- select title from books where title not like '% %'
-- select title ,author_fname from books where author_fname=''
-- select title,author_fname from books where title not like 'dav%'
-- select * from books where released_year>2005
-- select * from books where pages>500
-- select 80>40;
-- select title,released_year from books where released_year <2000
-- select title,released_year from books where released_year <= 2010
-- select * from books where released_year%2=0
-- select released_year,title,
-- CASE
-- WHEN released_year >=2000 then 'modern_lit'
-- else '20th centery lit'
-- END as 'genre'
-- from books
-- select * from books where released_year<1980
-- select * from books where author_lname='Eggers' or author_lname='Chabon'
-- select * from books where released_year>2000 AND author_lname='Lahiri'
-- select * from books where author_lname='Eggers' or author_lname='Chabon'
-- select * from books where pages between 100 AND 200
-- select * from books where author_lname like 'C%'  OR author_lname like 'S%'
-- select title,author_lname,
-- CASE
-- WHEN title like '%stories%' THEN 'short stories'
-- WHEN title='Just Kids' OR title='A Heartbreaking Work of Staggering Genius' THEN 'Menior'
-- ELSE 'NOVEL' 
-- END as 'type' from books
select author_fname,author_lname,concat(count(*),' ','books') AS total from books group by 1,2