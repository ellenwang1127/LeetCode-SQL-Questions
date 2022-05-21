create table product (
	product_id int,
    product_name varchar(20)
);

insert into product values
(1,'LC Phone'),
(2,'LC T-shirt'),
(3,'LC Keychain');

create table sales (
	product_id int,
    period_start date,
    period_end date,
    average_daily_sales int
);

insert into sales values
(1,str_to_date('2019-01-25','%Y-%m-%d'),str_to_date('2019-02-28','%Y-%m-%d'),100),
(2,str_to_date('2018-12-01','%Y-%m-%d'),str_to_date('2020-01-01','%Y-%m-%d'),10),
(3,str_to_date('2019-12-01','%Y-%m-%d'),str_to_date('2020-01-31','%Y-%m-%d'),1);


#Solution:
SELECT s.product_id, product_name, YEAR(date) report_year,
		SUM(average_daily_sales) total_amount
FROM sales s
JOIN product p USING(product_id)
CROSS JOIN t1
WHERE date BETWEEN period_start AND period_end
GROUP BY 1,2,3
ORDER BY 1