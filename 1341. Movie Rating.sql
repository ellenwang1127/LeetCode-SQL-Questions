create table movie (
	movie_id int,
    title varchar(50)
);

insert into movie values
(1,'Avengers'),(2,'Frozen 2'),(3,'Joker');

create table users (
	user_id int,
    name varchar(10)
);

insert into users values
(1,'Daniel'),(2,'Monica'),(3,'Maria'),(4,'James');

drop table if exists movie_rating;
create table movie_rating (
	movie_id int,
    user_id int,
    rating int,
    created_at date
);

insert into movie_rating values
(1,1,3,str_to_date('2020-01-12', '%Y-%m-%d')),
(1,2,4,str_to_date('2020-02-11', '%Y-%m-%d')),
(1,3,2,str_to_date('2020-02-12', '%Y-%m-%d')),
(1,4,1,str_to_date('2020-01-01', '%Y-%m-%d')),
(2,1,5,str_to_date('2020-02-17', '%Y-%m-%d')),
(2,2,2,str_to_date('2020-02-01', '%Y-%m-%d')),
(2,3,2,str_to_date('2020-03-01', '%Y-%m-%d')),
(3,1,3,str_to_date('2020-02-22', '%Y-%m-%d')),
(3,2,4,str_to_date('2020-02-25', '%Y-%m-%d'));



#Solution:
(SELECT name results
FROM movie_rating mr
JOIN users u USING(user_id)
GROUP BY 1
ORDER BY COUNT(DISTINCT rating) DESC, name
LIMIT 1)
UNION ALL
(SELECT title
FROM movie_rating mr
JOIN movie m USING(movie_id)
WHERE created_at < '2020-03-01'
GROUP BY 1
ORDER BY AVG(rating) DESC, title
LIMIT 1)
