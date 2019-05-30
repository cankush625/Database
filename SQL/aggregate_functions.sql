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