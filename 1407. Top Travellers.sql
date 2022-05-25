drop table if exists users;
create table users (
	id int, name varchar(10)
);

insert into users values
(1,'Alice'),(2,'Bob'),(3,'Alex'),(4,'Donald'),(7,'Lee'),(13,'Jonathan'),(19,'Elvis');

create table rides (
	id int,
    user_id int,
    distance int
);

insert into rides values
(1,1,120),(2,2,317),(3,3,222),(4,7,100),(5,13,312),(6,19,50),(7,7,120),(8,19,400),(9,7,230);


#Solution:
SELECT u.name, IFNULL(SUM(r.distance), 0) travelled_distance
FROM Users u
LEFT JOIN Rides r ON u.id=r.user_id
GROUP BY 1
ORDER BY 2 DESC, 1