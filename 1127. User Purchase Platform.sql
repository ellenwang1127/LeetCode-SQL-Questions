create table spending (
	user_id int,
    spend_date date,
    platform enum('mobile','desktop'),
    amount int)
;

insert into spending values
(1,str_to_date('2019-07-01', '%Y-%m-%d'),'mobile',100),
(1,str_to_date('2019-07-01', '%Y-%m-%d'),'desktop',100),
(2,str_to_date('2019-07-01', '%Y-%m-%d'),'mobile',100),
(2,str_to_date('2019-07-02', '%Y-%m-%d'),'mobile',100),
(3,str_to_date('2019-07-01', '%Y-%m-%d'),'desktop',100),
(3,str_to_date('2019-07-02', '%Y-%m-%d'),'desktop',100);


#Solution:
WITH t1 AS (
	SELECT user_id, spend_date, amount,
			CASE WHEN COUNT(*) OVER (PARTITION BY user_id, spend_date) = 2 THEN 'both'
				 ELSE platform END AS platform
    FROM spending),
	 t2 AS (
     SELECT spend_date, platform,
			SUM(amount) total_amount,
            COUNT(DISTINCT user_id) total_users
     FROM t1
     GROUP BY 1,2),
     t3 AS (
     SELECT DISTINCT spend_date 
     FROM t2),
     t4 AS (
     SELECT 'desktop' platform
	 UNION
     SELECT 'mobile'
     UNION
     SELECT 'both'
     )
SELECT t3.spend_date, t4.platform, 
		IFNULL(total_amount, 0) total_amount,
        IFNULL(total_users, 0) total_users
FROM t3
CROSS JOIN t4
LEFT JOIN t2 ON t2.spend_date=t3.spend_date AND t2.platform=t4.platform

