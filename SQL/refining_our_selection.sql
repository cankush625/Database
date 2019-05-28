use books_db; /*Using the database which is already created*/
select database();

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT title FROM books;

/*distinct*/
/*Using distinct to avoid duplicates*/
select distinct author_lname from books;
select distinct released_year from books;

/*It selects the distinct fields*/
/*If one field is differnt from another and we selected both using "destinct" word under single "select" then
it will select both the fields because no all fields are identical that are selected using
"select"*/
select distinct author_fname, author_lname from books;

/*distinct using concat*/
select distinct concat(author_fname, ' ', author_lname) as 'Author name' from books;