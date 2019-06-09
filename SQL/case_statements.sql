use books_db;
select database();

/*select genre as '20th century lit' if released year is less than 2000 else if greater than or equal to 2000 then ''modern lit*/
select title, released_year, 
	case
		when released_year >= 2000 then 'Modern lit'
        else '20th century lit'
        end as genre
from books;

/*display stock quantity using 1 to 3 stars*/
select title, stock_quantity,
	case
		when stock_quantity between 0 and 50 then '*'
		when stock_quantity between 51 and 100 then '**'
		else '***'
        end as stock
from books;

select title, stock_quantity,
	case
		when stock_quantity <= 50 then '*'
		when stock_quantity <= 100 then '**'
		else '***'
        end as stock
from books;