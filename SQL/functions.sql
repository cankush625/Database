create database books_db;
use books_db;
select database();

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select * from books;

/*To concat the string*/
select concat('Ross', ' ', 'Orton');

/*Concatinating from the database*/
select concat(author_fname, ' ', author_lname) from books;

/*Concatinating and separating by comma*/
select concat(author_fname, ',', author_lname) from books;

/*Renaming the concatinated column*/
select concat(author_fname, ' ', author_lname) as 'Author Name' from books;
select author_fname as 'first name', author_lname as 'last name', concat(author_fname, ' ', author_lname) as 'Author Name' from books;

/*Concat with separator*/
select concat_ws(' - ', title, author_fname, author_lname) as 'Book Details' from books;

/*Substring*/
/*Selecting substring from starting index to the ending index*/
select substring('Ankush', 1, 4);

/*Selecting substring from starting index upto the end*/
select substring('Ankush', 4);
select substring('Ankush', -3);

/*Selecting a substring from the database*/
select substring(title, 1, 20) as 'Short title' from books;

/*Selecting a substring by using concat*/
select concat(substring(title, 1, 20), '...') as 'Short title' from books;

/*Replace*/
/*Replace a substring with another string*/
select replace('Hello World', 'He', '#@');
select replace('Hello World', 'He', '#@') as 'Replaced String';
select replace('Hello World', 'l', '1') as 'Replaced String';

/*Replace is case sensitive*/
select replace('HellO World', 'o', '0') as 'Replaced String';

/*Replace all spaces with and*/
select replace('Fruit sweet milk', ' ', ' and ') as 'Replaced String';

/*Replace a string in the database*/
select replace(title, 'e', '3') as 'Replaced String' from books;

/*Replace a string in the database by using concat*/
select substring(replace(title, 'e', '3'), 1, 20) as 'Replaced String' from books;

/*Reverse*/
/*Reverse a string*/
select reverse('Ankush') as 'Reversed string';

/*Reverse a string from database*/
select reverse(author_fname) as 'Reversed Author name' from books;

/*Reverse the string and concatinate with another string*/
select concat(author_fname, ' ', reverse(author_lname)) as 'Author name' from books;

/*char_length*/
/*Finding number of characters in the string*/
select char_length('Ankush');

/*Displaying length of author last name in front of author name*/
select author_lname, char_length(author_lname) as 'Length' from books;

/*Using concat with char_length*/
select concat(author_lname, ' is ', char_length(author_lname), ' characters long') as "Author's last name" from books;

/*Upper and Lower case string*/
select upper('Ankush') as 'Upper case';
select lower('Ankush') as 'Lower case';

/*Upper and Lower case in database*/
select upper(title) as 'Title' from books;
select lower(title) as 'Title' from books;

/*Using concat with upper and lower*/
select concat('My favorite book is ', upper(title)) as 'Favorite' from books;
select concat('My favorite book is ', lower(title)) as 'Favorite' from books;