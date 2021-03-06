create schema crud_commands;
use crud_commands;
select database();

create table tweeterUsers(
	userID int not null auto_increment primary key,
    name varchar(20) not null,
    username varchar(20) not null,
    password varchar(30) not null,
    age int not null
);

desc tweeterUsers;

insert into tweeterUsers(name, username, password, age) values('Robert', 'rob2133', 'robs@366t86', 56);

/*Reading all columns from the table*/
select * from tweeterUsers;

/*Selecting only the required column from the table*/
select username from tweeterUsers;

/*Selecting two or more columns from the table*/
select name, age from tweeterUsers; /*We may change the sequence of the columns by rearranging the column
									  names in select command for displaying purpose only*/
                                      
/*Using 'where'*/
select * from tweeterUsers where username = 'cankush';
select * from tweeterUsers where username = 'CankUSh'; /*It is case insensitive*/

/*Aliases - It use to make the column title to show as we want*/
select name, age as years from tweeterUsers;

/*Updating*/
update tweeterUsers set age=18 where name = 'Rob';

/*Deleting or Removing*/
delete from tweeterUsers where name = 'Robert';

/*When the record is deleted, the id are not going to alter. This is because for each record
an unique id is generated.*/
insert into tweeterUsers(name, username, password, age) values('Ronda', 'ron2353', 'rondar@33687', 20);

/*To delete all records from the database*/
delete from tweeterUsers;