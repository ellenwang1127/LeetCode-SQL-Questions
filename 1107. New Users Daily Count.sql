create table traffic (
	user_id int,
    activity enum('login','homepage','logout','jobs','groups'),
    activity_date date
);

insert into traffic values
(1,'login',str_to_date('2019-05-01','%Y-%m-%d')),
(1,'homepage',str_to_date('2019-05-01','%Y-%m-%d')),
(1,'logout',str_to_date('2019-05-01','%Y-%m-%d')),
(2,'login',str_to_date('2019-06-21','%Y-%m-%d')),
(2,'logout',str_to_date('2019-06-21','%Y-%m-%d')),
(3,'login',str_to_date('2019-01-01','%Y-%m-%d')),
(3,'jobs',str_to_date('2019-01-01','%Y-%m-%d')),
(3,'logout',str_to_date('2019-01-01','%Y-%m-%d')),
(4,'login',str_to_date('2019-06-21','%Y-%m-%d')),
(4,'groups',str_to_date('2019-06-21','%Y-%m-%d')),
(4,'logout',str_to_date('2019-06-21','%Y-%m-%d')),
(5,'login',str_to_date('2019-03-01','%Y-%m-%d')),
(5,'logout',str_to_date('2019-03-01','%Y-%m-%d')),
(5,'login',str_to_date('2019-06-21','%Y-%m-%d')),
(5,'logout',str_to_date('2019-06-21','%Y-%m-%d'));


#Solution:
SELECT login_date, COUNT(*) user_count
FROM
(SELECT MIN(activity_date) login_date, user_id
FROM traffic
GROUP BY user_id
) t1
WHERE login_date BETWEEN '2019-03-30' AND '2019-06-30'
GROUP BY 1
