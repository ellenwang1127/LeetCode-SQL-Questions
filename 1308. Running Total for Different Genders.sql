create table scores (
	player_name varchar(15),
    gender enum('F','M'),
    day date,
    score_points int
);

insert into scores values
('Aron','F',str_to_date('2020-01-01','%Y-%m-%d'),17),
('Alice','F',str_to_date('2020-01-07','%Y-%m-%d'),23),
('Bajrang','M',str_to_date('2020-01-07','%Y-%m-%d'),7),
('Kahli','M',str_to_date('2019-12-25','%Y-%m-%d'),11),
('Slaman','M',str_to_date('2019-12-30','%Y-%m-%d'),13),
('Joe','M',str_to_date('2019-12-31','%Y-%m-%d'),3),
('Jose','M',str_to_date('2019-12-18','%Y-%m-%d'),2),
('Priya','F',str_to_date('2019-12-31','%Y-%m-%d'),23),
('Priyanka','F',str_to_date('2019-12-30','%Y-%m-%d'),17);


#Solution:
SELECT gender, day,
		SUM(score_points) OVER (PARTITION BY gender ORDER BY day) total
FROM scores
ORDER BY gender, day