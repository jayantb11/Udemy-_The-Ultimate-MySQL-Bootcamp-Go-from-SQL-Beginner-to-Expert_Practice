-- use bookshop;
-- INSERT INTO books
--     (title, author_fname, author_lname, released_year, stock_quantity, pages)
--     VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
--            ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
--            ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
-- select distinct author_lname from books
-- select distinct concat(author_fname,' ',author_lname),released_year from books
-- select * from books order by released_year DESC
-- select * from books order by author_fname,author_lname
-- select * from books  order by released_year limit 5
-- select * from books order by released_year limit 5,2
-- select * from books where author_fname like '%da'
-- select * from books where author_fname like '____'
-- select * from books where title like '%\%%'
-- select * from books where title like '%stories%'
-- select * from books order by pages DESC LIMIT 1 
select concat(title,' was released - ',released_year) from books order by released_year DESC limit 3
-- select title,author_lname from books where author_lname like '% %'
-- select title,released_year,stock_quantity from books order by stock_quantity limit 3
-- select title, author_lname from books order by 2,1
-- select   CONCAT(
--         'MY FAVORITE AUTHOR IS ',
--         UPPER(author_fname),
--         ' ',
--         UPPER(author_lname),
--         '!'
--     ) as yell from books order by author_lname