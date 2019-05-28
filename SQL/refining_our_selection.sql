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

/*order by/
/*Sorting using 'order by'*/
select author_lname from books order by author_lname; /*By default it is ascending*/

/*Sort using 'order by' in descending order*/
select author_lname from books order by author_lname desc;

select released_year from books order by released_year;
select released_year from books order by released_year desc;

select title, released_year, pages from books order by released_year;
select title, pages from books order by released_year; /*We can also sort without printing that field*/

/*We can set 'order by' using index of the selected field*/
select title, author_fname, author_lname from books order by 2;

/*sorting or ordering by two different columns or fields*/
/*Sometimes it is happen that john comes before james because we have sorted using onky the last name and
not by using both last name and first name. To overcome this we are sorting using both the fields*/
select title, author_fname, author_lname from books order by author_fname, author_lname;

/*limit*/
/*Limit the number of results that we are selecting*/
select * from books limit 3;
select title from books limit 5;

/*Limit the results using order by with limit*/
select title, released_year from books order by released_year desc limit 3;

/*limit by specifying starting point and how many results we want*/
select title, released_year from books order by released_year desc limit 0, 5;
select title, released_year from books order by released_year desc limit 2, 5;

/*To choose item at specific index*/
select title, released_year from books order by released_year desc limit 8, 1;

/*To get the items from starting index to the end of the table we specify a giant number*/
select title, released_year from books limit 5, 1442545533334;