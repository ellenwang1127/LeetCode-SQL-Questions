drop table if exists product;
create table product (
	product_id int,
    product_name varchar(10),
    unit_price int
);

drop table if exists sales;
create table sales (
	seller_id int,
    product_id int,
    buyer_id int,
    sale_date date,
    quantity int,
    price int
);

insert into product values
(1,'S8',1000),
(2,'G4',800),
(3,'iPhone',1400);

insert into sales values
(1,1,1,str_to_date('2019-01-21','%Y-%m-%d'),2,2000),
(1,2,2,str_to_date('2019-02-17','%Y-%m-%d'),1,800),
(2,1,3,str_to_date('2019-06-02','%Y-%m-%d'),1,800),
(3,3,3,str_to_date('2019-05-13','%Y-%m-%d'),2,2800);


#Solution:
WITH t1 AS (
SELECT buyer_id, product_name
FROM product p
LEFT JOIN sales s USING(product_id))

SELECT DISTINCT buyer_id
FROM t1
WHERE product_name = 'S8' AND buyer_id NOT IN
(SELECT buyer_id 
FROM t1
WHERE product_name = 'iPhone')

