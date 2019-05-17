show databases;
USE test;
select database();

/*CREATE TABLE tweets
(
	ID int,
    Name varchar(20),
    Tweets int
);*/

show tables;

show columns from tweets; /*desc tweets;*/

drop table numbers;

insert into tweets(ID, Name, Tweets) values(1, 'cankush', 12);

insert into tweets(ID, Tweets, Name) values(2, 20, 'roshan');

/*select * from tweets;*/

insert into tweets(ID, Name, Tweets) values(3, 'alex', 13), (4, 'mike', 33), (5, 'adam', 43);

select * from tweets;

/*Null value*/
insert into tweets(Name) values('John'); /*Here only for Name the value is
										added, so other values are shown null*/

select * from tweets;

/*No values are inserted. So the values for Name, ID, and Tweets is null*/
insert into tweets() values();

select * from tweets;

/*To overcome this we have to define variables in table followed by not null*/

create table verifiedTweets(
	ID int not null,
    Name varchar(20) not null,
    Tweets int not null
);

show tables;

desc verifiedTweets;

insert into verifiedTweets(ID, Name, Tweets) values(1, 'Ankush', 40);

select * from verifiedTweets;

insert into verifiedTweets() values(); /*This will throws an error as we
										 set default values are not null*/

select * from verifiedTweets;

insert into verifiedTweets(Name) values('Roshan');

select * from verifiedTweets;