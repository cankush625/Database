use books_db;
select database();

/*Using not equal != */
/*select released years excluding 2014*/
select released_year from books where released_year != 2014 order by released_year;

/*select books that were not released in 2017*/
select title, released_year from books where released_year != 2017 order by released_year;

/*select authors except for harris*/
select title, author_lname from books where author_lname != 'harris';

/*Using not like*/
select title from books where title not like 'W%';