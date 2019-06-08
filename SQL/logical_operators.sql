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

/*Using > (greater than)*/
/*select all the books released after year 2000*/
select title, released_year from books where released_year > 2000;
select title, stock_quantity from books where stock_quantity > 100;

/*Using >= (greater than or equal to)*/
select title, released_year from books where released_year >= 2000 order by released_year;

/*boolean logic in other languages is work in sql as numbers*/
/*it returns 1 for true and 0 for false*/
select 99 > 1;  /*returns 1*/
select 99 > 123;  /*returns 0*/

/*String comparison*/
select 'a' > 'b'; /*returns 0*/
select 'A' > 'B'; /*returns 0*/
select 'A' = 'a'; /*returns 1*/

/*Using < (less than)*/
/*select all the books released after year 2000*/
select title, released_year from books where released_year < 2000;
select title, stock_quantity from books where stock_quantity < 100;

/*Using <= (less than or equal to)*/
select title, released_year from books where released_year <= 2000 order by released_year;

/*Using 'and' or '&&' (logical and)*/
/*select book written by dave eggers and published after the year 2010*/
select title, concat(author_fname, ' ', author_lname) as "Author name", released_year from books where concat(author_fname, ' ', author_lname) = "dave eggers" && released_year > 2010;
select title, concat(author_fname, ' ', author_lname) as "Author name", released_year from books where concat(author_fname, ' ', author_lname) = "dave eggers" and released_year > 2010;
select title, concat(author_fname, ' ', author_lname) as "Author name", released_year from books where concat(author_fname, ' ', author_lname) = "dave eggers" and released_year > 2010 and title like '%novel%';

/*Comparisons*/
select 1 > 2 && 1 < 2; /*returns 0*/
select 1 > 2 and 1 < 2; /*returns 0*/
select 32 > 12 and 'A' = 'a'; /*returns 1*/

/*Using 'or' or '||' (logical or)*/
/*select book written by dave eggers and published after the year 2010*/
select title, concat(author_fname, ' ', author_lname) as "Author name", released_year from books where concat(author_fname, ' ', author_lname) = "dave eggers" || released_year > 2010;
select title, concat(author_fname, ' ', author_lname) as "Author name", released_year from books where concat(author_fname, ' ', author_lname) = "dave eggers" or released_year > 2010;
select title, concat(author_fname, ' ', author_lname) as "Author name", released_year from books where concat(author_fname, ' ', author_lname) = "dave eggers" and released_year > 2010 or title like '%novel%';