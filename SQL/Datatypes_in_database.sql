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
select concat(day(birthdate), ' ', monthname(birthdate), ' ', year(birthdate)) from people;

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

/*date math*/
/*Using datediff to calculate differnce between two dates*/
select name, birthdate, datediff(birthdate, curdate()) from people; /*gives negative answer*/
select name, birthdate, datediff(curdate(), birthdate) from people; /*gives positive answer*/

/*Using date_add to add the date or time to the date*/
/*Add 1 second to the 2018-12-31 23:59:59*/
select date_add('2018-12-31 23:59:59', interval 1 second); /*It gives answer as 2019-01-01 00:00:00*/

/*Add 1 minute to the 2018-12-31 23:59:59*/
select date_add('2018-12-31 23:59:59', interval 1 minute); /*It gives answer as 2019-01-01 00:00:59*/

/*Add 1 hour to the 2018-12-31 23:59:59*/
select date_add('2018-12-31 23:59:59', interval 1 hour); /*It gives answer as 2019-01-01 00:59:59*/

/*Add 1 day to the 2018-12-31 23:59:59*/
select date_add('2018-12-31 23:59:59', interval 1 day); /*It gives answer as 2019-01-01 23:59:59*/

/*Add 1:1 minute second to the 2018-12-31 23:59:59*/
select date_add('2018-12-31 23:59:59', interval '1:1' minute_second); /*It gives answer as 2019-01-01 00:01:00*/

/*Add -1 day and 5 hours to the 2018-12-31 23:59:59*/
select date_add('2018-12-31 23:59:59', interval '-1:5' day_hour); /*It gives answer as 2018-12-30 18:59:59*/
select date_add('2018-12-31 23:59:59', interval '-1 5' day_hour); /*It gives answer as 2018-12-30 18:59:59*/

/*Subtract 1day and 1hour, 1 minute and 1 second from the 2018-12-31 23:59:59*/
select date_sub('2018-12-31 23:59:59', interval '1 1:1:1' day_second); /*It gives answer as 2018-12-30 22:58:58*/

/*Using date_add and date_sub with datebase*/
select date_add(birthdate, interval 1 month) from people;
select date_sub(birthdate, interval 1 month) from people;

/*using + or - sign instead of date_add and date_sub*/
select birthdate + interval 1 month from people;
select birthdate - interval 1 month from people;

/*Adding 15 hours and 10 seconds using + sign*/
select birthdt, birthdt + interval 15 hour + interval 10 second from people;

/*Timestamps*/
create table comments(
	content varchar(100),
    created_at timestamp default now()
);

insert into comments(content) values('India won its first world cup 2019 match');

select * from comments;

/*Selecting most recent comments on the top*/
select * from comments order by created_at desc;

create table comments2(
	content varchar(100),
    created_at timestamp default now() on update current_timestamp
);

insert into comments2(content) values('shjfbsbjfbsj');
insert into comments2(content) values('dfnvkfshsfjssfv');

select * from comments2;

/*updating already added comment to see on update in action*/
update comments2 set content = 'Hey this is ...' where content = 'shjfbsbjfbsj';

select * from comments2;