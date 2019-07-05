create database instagram;
use instagram;
select database();

/*To make a duplicate instagram database we must need : 
	1. Users 2. Photos 3.Likes 4.Comments 5.Followers and Followees 6.Hashtags */
    
create table users(
	id int auto_increment primary key,
    username varchar(45) unique not null,
    createdAt timestamp default now()
);

describe users;

/*If we enter same data for unique filed then the data is not going to store in the database and gives error
but the id which is on auto increament is increamented and that incremented id is not going to assign to others.
Means for each duplicate entry id is increamented but the data is not stored in the database and id further
increments for the correct and unique data and store it.*/

create table photos(
	id int auto_increment primary key,
    image_url varchar(255) not null,
    user_id int not null,
    created_at timestamp default now(),
    foreign key(user_id) references users(id)
);

show tables;

create table comments(
 id int auto_increment primary key,
 comment_text varchar(1000) not null,
 user_id int not null,
 photo_id int not null,
 created_at timestamp default now(),
 foreign key(user_id) references users(id),
 foreign key(photo_id) references photos(id)
);

create table likes(
    user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
    foreign key(user_id) references users(id),
    foreign key(photo_id) references photos(id),
    primary key(user_id, photo_id) -- this is used because we don't want user to give more than one like to the same post
);

create table follows(
	follower_id int not null,
    followee_id int not null,
    created_at timestamp default now(),
    foreign key(follower_id) references users(id),
    foreign key(followee_id) references users(id),
    primary key(follower_id, followee_id)
);

create table tags(
	id int auto_increment primary key,
    tag_name varchar(255) unique,
    created_at timestamp default now()
);

create table photo_tags(
	photo_id int not null,
    tag_id int not null,
    foreign key(photo_id) references photos(id),
    foreign key(tag_id) references tags(id),
    primary key(photo_id, tag_id)
);