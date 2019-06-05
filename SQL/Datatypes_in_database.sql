use test;
select database();

create table datatypes(
	ID int not null auto_increment primary key,
    ProductName varchar(40),
    Price decimal(5,2)
);

insert into datatypes(ProductName, Price) values('A', 5);
insert into datatypes(ProductName, Price) values('B', 6);
insert into datatypes(ProductName, Price) values('C', 8.443);
insert into datatypes(ProductName, Price) values('D', 9.36677);

select * from datatypes;

create table datatypes1(
	ID int not null auto_increment primary key,
    Price float
);

insert into datatypes1(Price) values(132.232432);

select * from datatypes1;

/*data, time, datetime*/
create table people(
	name varchar(20),
    birthdate date,
    birthtime time,
    birthdt datetime
);

insert into people(name, birthdate, birthtime, birthdt) values('James', '1998-03-23', '10:02:23', '1998-03-23 10:02:23');
insert into people(name, birthdate, birthtime, birthdt) values('Martin', '1993-12-24', '12:02:32', '1993-12-24 12:02:32');

select * from people;

/*curdete, curtime, now functions*/
select curdate(); /*current date*/
select curtime(); /*current time*/
select now(); /*current datetime*/

/*Inserting current date and time in the database using the functions*/
insert into people(name, birthdate, birthtime, birthdt) values('Daniel', curdate(), curtime(), now());

select * from people;

/*Formating dates*/
/*selecting the dayname*/
select name, birthdate, dayname(birthdate) from people;

/*selecting day of week*/
select name, birthdate, dayofweek(birthdate) from people;

/*selecting day of year*/
select name, birthdate, dayofyear(birthdate) from people;

/*selecting month*/
select name, birthdate, month(birthdate) from people;

/*selecting monthname*/
select name, birthdate, monthname(birthdate) from people;

/*trying for the time*/
select name, birthtime, dayofyear(birthtime) from people; /*It gives a warning*/
select name, birthdt, dayofyear(birthdt) from people;

/*selecting hour*/
select name, birthtime, hour(birthtime) from people;

/*selecting minute*/
select name, birthtime, minute(birthtime) from people;

/*Writing date in the format of 21 June 2015*/
select concat(day(birthdate), ' ', dayname(birthdate), ' ', year(birthdate)) from people;

/*Using date_format*/
/*data_format is a case sensitive*/
/*line 81 and 82 gives same output in the two different ways*/
select date_format(birthdt, '%w-%m-%y') from people;
select date_format(birthdt, '%W-%M-%Y') from people;

select date_format(birthdt, 'Was born on a %W') from people;

/*Writing date in the format 12/12/2012*/
select date_format(birthdt, '%d/%m/%Y') from people;

/*Writing date in the format 12st December 2012*/
select date_format(birthdt, '%D %M %Y') from people;

/*Formating time in the date_format*/
/*Writing date in the format 12st December 2012 at 10:12*/
select date_format(birthdt, '%D %M %Y at %h:%m') from people;