create table useractivity (
	username varchar(10),
    activity varchar(10),
    startdate date,
    enddate date
);

insert into useractivity values
('Alice','Travel',str_to_date('2020-02-12','%Y-%m-%d'),str_to_date('2020-02-20','%Y-%m-%d')),
('Alice','Dancing',str_to_date('2020-02-21','%Y-%m-%d'),str_to_date('2020-02-23','%Y-%m-%d')),
('Alice','Travel',str_to_date('2020-02-24','%Y-%m-%d'),str_to_date('2020-02-28','%Y-%m-%d')),
('Bob','Travel',str_to_date('2020-02-11','%Y-%m-%d'),str_to_date('2020-02-18','%Y-%m-%d'));


#Solution:
SELECT username, activity, startdate, enddate
FROM
(SELECT *,
		RANK() OVER (PARTITION BY username ORDER BY startdate) rnk,
		COUNT(*) OVER (PARTITION BY username) cnt
FROM useractivity) t1
WHERE (cnt > 1 AND rnk = 2) OR (cnt = 1)