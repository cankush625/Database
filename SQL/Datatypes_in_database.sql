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