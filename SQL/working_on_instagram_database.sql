use instagram;

select database();

-- Finding 5 oldest users

select * from users order by createdAt limit 5;

-- Most popular registration day

select username, dayname(createdAt) as dayname, count(*) as totalUsers from users group by dayname order by totalUsers desc limit 2;