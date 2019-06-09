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

/*Using between*/
/*Select books published between 2004 and 2015*/
select title, released_year from books where released_year >= 2004 && released_year <= 2015;
/*we can replace this by using between as*/
select title, released_year from books where released_year between 2004 and 2015;

/*Using not between*/
select title, released_year from books where released_year not between 2004 and 2015;

/*Using cast()*/
/*cast is used to convert a data to a required type*/
select cast('2019-06-09' as datetime);

use test;
select database();

/*select birthdates between 1990 and 2000*/
select name, birthdt from people where birthdt between '1990-01-01' and '2000-01-01'; /*It works but compares the dates as string as they are in quotes*/
/*We can overcome this by casting them as datetime*/
select name, birthdt from people where birthdt between cast('1990-01-01' as datetime) and cast('2000-01-01' as datetime);

use books_db;
select database();
/*Using in*/
/*select book written by carver or lahiri or smith*/
select title, author_lname, author_fname from books where author_lname = 'Carver' or author_lname = 'Lahiri' or author_lname = 'Smith';
/*this can be done by using in as*/
select title, author_lname, author_fname from books where author_lname in ('Carver', 'Lahiri', 'Smith');

/*selecting released year 2017 or 1993*/
select title, released_year from books where released_year in (1985, 2017);

/*Using not in*/
select title, released_year from books where released_year not in (1985, 2017);

/*select all books released after 2000 and not including even releasing years*/
select title, released_year from books where released_year > 2000 and released_year % 2 != 0;