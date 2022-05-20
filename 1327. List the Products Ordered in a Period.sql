drop table if exists products;
create table products (
	product_id int,
    product_name varchar(45),
    product_category varchar(20)
);

insert into products values
(1,'Leetcode Solutions','Book'),
(2,'Jewels of Stringology','Book'),
(3,'HP','Laptop'),
(4,'Lenovo','Laptop'),
(5,'Leetcode Kit','T-shirt');

drop table if exists orders;
create table orders (
	product_id int,
    order_date date,
    unit int
);

insert into orders values
(1,str_to_date('2020-02-05','%Y-%m-%d'),60),
(1,str_to_date('2020-02-10','%Y-%m-%d'),70),
(2,str_to_date('2020-01-18','%Y-%m-%d'),30),
(2,str_to_date('2020-02-11','%Y-%m-%d'),80),
(3,str_to_date('2020-02-17','%Y-%m-%d'),2),
(3,str_to_date('2020-02-24','%Y-%m-%d'),3),
(4,str_to_date('2020-03-01','%Y-%m-%d'),20),
(4,str_to_date('2020-03-04','%Y-%m-%d'),30),
(4,str_to_date('2020-03-04','%Y-%m-%d'),60),
(5,str_to_date('2020-02-25','%Y-%m-%d'),50),
(5,str_to_date('2020-02-27','%Y-%m-%d'),50),
(5,str_to_date('2020-03-01','%Y-%m-%d'),50);


#Solution:
SELECT product_name, SUM(unit) unit
FROM orders o
JOIN products p USING(product_id)
WHERE DATE_FORMAT(order_date, '%Y-%m') = '2020-02'
GROUP BY product_name
HAVING SUM(unit) >= 100