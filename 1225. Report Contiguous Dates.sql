create table failed (
	fail_date date
);

insert into failed values
(str_to_date('2018-12-28','%Y-%m-%d')),
(str_to_date('2018-12-29','%Y-%m-%d')),
(str_to_date('2019-01-04','%Y-%m-%d')),
(str_to_date('2019-01-05','%Y-%m-%d'));

create table succeeded (
	success_date date
);

insert into succeeded values
(str_to_date('2018-12-30','%Y-%m-%d')),
(str_to_date('2018-12-31','%Y-%m-%d')),
(str_to_date('2019-01-01','%Y-%m-%d')),
(str_to_date('2019-01-02','%Y-%m-%d')),
(str_to_date('2019-01-03','%Y-%m-%d')),
(str_to_date('2019-01-06','%Y-%m-%d'));



#Solution:
SELECT 'succeeded' period_state, MIN(success_date) start_date, MAX(success_date) end_date
FROM
(SELECT *, 
		ROW_NUMBER() OVER (ORDER BY success_date) row_num
FROM succeeded
WHERE year(success_date) = 2019
) t1
GROUP BY dayofyear(success_date)-row_num

UNION ALL

SELECT 'failed', MIN(fail_date), MAX(fail_date) 
FROM
(SELECT *, 
		ROW_NUMBER() OVER (ORDER BY fail_date) row_num
FROM failed
WHERE year(fail_date) = 2019
) t1
GROUP BY dayofyear(fail_date)-row_num

ORDER BY start_date
