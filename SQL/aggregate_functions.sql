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