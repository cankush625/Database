use instagram;

select database();

-- Finding 5 oldest users

select * from users order by createdAt limit 5;

-- Most popular registration day

select username, dayname(createdAt) as dayname, count(*) as totalUsers from users group by dayname order by totalUsers desc limit 2;

-- Finding the users who have never posted a photo

select username, user_id, image_url from users left join photos on users.id = user_id where user_id is null;

-- Finding who can get a most likes on a single photo

select username, image_url as image, count(photo_id) as likes from photos inner join likes on likes.photo_id = photos.id inner join users on photos.user_id = users.id group by photo_id order by likes desc limit 1;

-- How many times does the average user post

select (select count(*) from photos) / (select count(*) from users) as "average posts";

-- Finding top 5 most commonly used hashtags

select tag_id, tag_name, count(tag_id) as count from photo_tags join tags on photo_tags.tag_id = tags.id group by tags.id order by count desc limit 5;

-- Finding users who have liked every single photo on the site

select username, count(user_id) as total_likes from users inner join likes on users.id = likes.user_id group by likes.user_id having total_likes = (select count(*) from photos);