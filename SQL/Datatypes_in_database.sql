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