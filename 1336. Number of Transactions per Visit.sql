create table visits (
	user_id int,
    visit_date date
);

insert into visits values
(1,str_to_date('2020-01-01','%Y-%m-%d')),
(2,str_to_date('2020-01-02','%Y-%m-%d')),
(12,str_to_date('2020-01-01','%Y-%m-%d')),
(19,str_to_date('2020-01-03','%Y-%m-%d')),
(1,str_to_date('2020-01-02','%Y-%m-%d')),
(2,str_to_date('2020-01-03','%Y-%m-%d')),
(1,str_to_date('2020-01-04','%Y-%m-%d')),
(7,str_to_date('2020-01-11','%Y-%m-%d')),
(9,str_to_date('2020-01-25','%Y-%m-%d')),
(8,str_to_date('2020-01-28','%Y-%m-%d'));

drop table if exists transactions;
create table transactions (
	user_id int,
    transaction_date date,
    amount int
);

insert into transactions values
(1,str_to_date('2020-01-02','%Y-%m-%d'),120),
(2,str_to_date('2020-01-03','%Y-%m-%d'),22),
(7,str_to_date('2020-01-11','%Y-%m-%d'),232),
(1,str_to_date('2020-01-04','%Y-%m-%d'),7),
(9,str_to_date('2020-01-25','%Y-%m-%d'),33),
(9,str_to_date('2020-01-25','%Y-%m-%d'),66),
(8,str_to_date('2020-01-28','%Y-%m-%d'),1),
(9,str_to_date('2020-01-25','%Y-%m-%d'),99);


#Solution:
WITH RECURSIVE
	t1 AS (
	SELECT v.user_id,visit_date,
			SUM(CASE WHEN visit_date=transaction_date THEN 1 ELSE 0 END) num_trans
	FROM visits v
	LEFT JOIN transactions t ON v.user_id = t.user_id
	AND t.transaction_date >= v.visit_date
	GROUP BY 1,2
),
	t2 AS (
    SELECT MIN(num_trans) transactions_count
    FROM t1
    UNION ALL
    SELECT transactions_count + 1
    FROM t2
    WHERE transactions_count < (SELECT MAX(num_trans) FROM t1)
    )

SELECT t2.transactions_count, COUNT(num_trans) visits_count
FROM t2
LEFT JOIN t1 ON t1.num_trans = t2.transactions_count
GROUP BY 1