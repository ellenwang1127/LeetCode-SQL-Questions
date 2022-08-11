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
WITH t1 AS(
SELECT user_id, spend_date, amount,
		CASE WHEN cnt = 2 THEN 'both' ELSE platform END AS platform
FROM (
SELECT *,
		COUNT(platform) OVER(PARTITION BY user_id, spend_date) cnt
FROM spending) tmp),
     t2 AS (SELECT DISTINCT spend_date FROM t1),
     t3 AS (SELECT DISTINCT platform FROM t1)
SELECT t2.spend_date, t3.platform, 
		IFNULL(SUM(amount),0) total_amount, 
        IFNULL(COUNT(DISTINCT user_id),0) total_users
FROM t2
CROSS JOIN t3
LEFT JOIN t1 ON t1.spend_date=t2.spend_date AND t1.platform=t3.platform
GROUP BY 1,2

