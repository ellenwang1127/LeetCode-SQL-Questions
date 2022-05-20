create table countries (
	country_id int,
    country_name varchar(15)
);

insert into countries values
(2,'USA'),
(3,'Australia'),
(7,'Peru'),
(5,'China'),
(8,'Morocco'),
(9,'Spain');

create table weather (
	country_id int,
    weather_state int,
    day date
);

insert into weather values
(2,15,str_to_date('2019-11-01','%Y-%m-%d')),
(2,12,str_to_date('2019-10-28','%Y-%m-%d')),
(2,12,str_to_date('2019-10-27','%Y-%m-%d')),
(3,-2,str_to_date('2019-11-10','%Y-%m-%d')),
(3,0,str_to_date('2019-11-11','%Y-%m-%d')),
(3,3,str_to_date('2019-11-12','%Y-%m-%d')),
(5,16,str_to_date('2019-11-07','%Y-%m-%d')),
(5,18,str_to_date('2019-11-09','%Y-%m-%d')),
(5,21,str_to_date('2019-11-23','%Y-%m-%d')),
(7,25,str_to_date('2019-11-28','%Y-%m-%d')),
(7,22,str_to_date('2019-12-01','%Y-%m-%d')),
(7,20,str_to_date('2019-12-02','%Y-%m-%d')),
(8,25,str_to_date('2019-11-05','%Y-%m-%d')),
(8,27,str_to_date('2019-11-15','%Y-%m-%d')),
(8,31,str_to_date('2019-11-25','%Y-%m-%d')),
(9,7,str_to_date('2019-10-23','%Y-%m-%d')),
(9,3,str_to_date('2019-12-23','%Y-%m-%d'));



#Solution:
SELECT country_name,
		CASE WHEN AVG(weather_state) <= 15 THEN 'Cold'
			 WHEN AVG(weather_state) >= 25 THEN 'Hot'
             ELSE 'Warm' END AS weather_type
FROM weather w
JOIN countries c USING(country_id)
WHERE day BETWEEN '2019-11-01' AND '2019-11-30'
GROUP BY 1