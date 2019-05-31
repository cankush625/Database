use books_db; /*Using the database which is already created*/
select database();

/*count*/
/*Using count to count number of records*/
select count(*) as 'Number of books' from books;
select count(author_fname) as 'Number of Authors' from books;

/*Using count with distinct*/
select count(distinct(author_fname)) as 'Number of Authors' from books;
select count(distinct author_fname, author_lname) as 'Number of Authors' from books;

/*Using count with like*/
select count(title) as "Title containing 'the'" from books where title like '%the%';

/*group by*/
/*It groups the results under the mentioned field and shows only first record*/
select title, author_lname from books group by author_lname;

/*Using group by with count*/
/*Count how many books each author have written*/
select author_lname, count(*) as 'Books by each author' from books group by author_lname;
select author_fname, author_lname, count(*) as 'Books by each author' from books group by author_fname, author_lname;

/*Using group by with count and order by*/
select released_year, count(*) as 'Books released in year' from books group by released_year order by released_year;

/*Using group by with concat, count and order by*/
select concat('In ', released_year, ', ', count(*), ' book(s) are released!') as 'Books released in year' from books group by released_year order by released_year;

/*min or max*/
select min(released_year) from books;
select min(pages) from books;

select max(released_year) from books;
select max(pages) from books;

/*Selecting title of the longest book*/
/*Both gives same result by changing the position of the column*/
/*But both of these gives wrong result*/
select max(pages), title from books; /*gives wrong result*/
select title, max(pages) from books; /*gives wrong result*/

/*Solution to the problem above is 'Subquery'*/
/*Subquery*/
select * from books where pages = (select max(pages) from books);
select title, pages from books where pages = (select max(pages) from books);

/*Another wway of doing it using only one select*/
select * from books order by pages desc limit 1;
select * from books order by pages asc limit 1;

/*Using min and max with group by*/
select author_fname, author_lname, min(released_year) from books group by author_fname, author_lname;
select author_fname, author_lname, max(released_year) from books group by author_fname, author_lname;

/*selecting longest page count for the authors*/
select author_fname, author_lname, max(pages) from books group by author_fname, author_lname;

/*selecting smallest page count for the authors*/
select author_fname, author_lname, min(pages) from books group by author_fname, author_lname;

/*Using max, group by and concat together*/
select concat(author_fname, ' ', author_lname) as 'Author', max(pages) as 'Longest book' from books group by author_fname, author_lname;