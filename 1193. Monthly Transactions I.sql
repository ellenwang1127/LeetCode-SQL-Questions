create table transactions (
	id int,
    country varchar(10),
    state enum('approved','declined'),
    amount int,
    trans_date date
);

insert into transactions values
(121,'US','approved',1000,str_to_date('2018-12-18', '%Y-%m-%d')),
(122,'US','declined',2000,str_to_date('2018-12-19', '%Y-%m-%d')),
(123,'US','approved',2000,str_to_date('2019-01-01', '%Y-%m-%d')),
(124,'DE','approved',2000,str_to_date('2019-01-07', '%Y-%m-%d'));



#Solution:
SELECT DATE_FORMAT(trans_date, '%Y-%m') month, country,
		COUNT(DISTINCT id) trans_count,
        SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) approved_count,
        SUM(amount) trans_total_amount,
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) approved_total_amount
FROM transactions
GROUP BY 1,2   