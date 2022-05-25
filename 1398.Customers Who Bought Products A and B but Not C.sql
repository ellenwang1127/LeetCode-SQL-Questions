drop table if exists customers;
create table customers (
	customer_id int,
    customer_name varchar(15)
);

insert into customers values
(1,'Daniel'),(2,'Diana'),(3,'Elizabeth'),(4,'Jhon');

drop table if exists orders;
create table orders (
	order_id int,
    customer_id int,
    product_name varchar(5)
);

insert into orders values
(10,1,'A'),
(20,1,'B'),
(30,1,'D'),
(40,1,'C'),
(50,2,'A'),
(60,3,'A'),
(70,3,'B'),
(80,3,'D'),
(90,4,'C');



#Solution:
SELECT DISTINCT customer_id, customer_name
FROM customers
WHERE customer_id IN (
SELECT customer_id
FROM orders 
WHERE product_name = 'A')
AND customer_id IN (
SELECT customer_id
FROM orders 
WHERE product_name = 'B')
AND customer_id NOT IN
(SELECT customer_id
FROM orders 
WHERE product_name = 'C')

