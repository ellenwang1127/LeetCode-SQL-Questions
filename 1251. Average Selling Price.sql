drop table if exists prices;
create table prices (
	product_id int,
    start_date date,
    end_date date,
    price int
);

insert into prices values
(1,str_to_date('2019-02-17','%Y-%m-%d'),str_to_date('2019-02-28','%Y-%m-%d'),5),
(1,str_to_date('2019-03-01','%Y-%m-%d'),str_to_date('2019-03-22','%Y-%m-%d'),20),
(2,str_to_date('2019-02-01','%Y-%m-%d'),str_to_date('2019-02-20','%Y-%m-%d'),15),
(2,str_to_date('2019-02-21','%Y-%m-%d'),str_to_date('2019-03-31','%Y-%m-%d'),30);

create table unitssold (
	product_id int,
    purchase_date date,
    units int
);

insert into unitssold values
(1,str_to_date('2019-02-25','%Y-%m-%d'),100),
(1,str_to_date('2019-03-01','%Y-%m-%d'),15),
(2,str_to_date('2019-02-10','%Y-%m-%d'),200),
(2,str_to_date('2019-03-22','%Y-%m-%d'),30);

#Solution:SELECT p.product_id,
		ROUND(SUM(price*units)/SUM(units),2) average_price
FROM prices p
JOIN unitssold u ON p.product_id=u.product_id 
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 1