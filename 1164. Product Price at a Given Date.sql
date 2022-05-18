drop table if exists products;
create table products (
	product_id int,
    new_price int,
    change_date date
);

insert into products values
(1,20,str_to_date('2019-08-14','%Y-%m-%d')),
(2,50,str_to_date('2019-08-14','%Y-%m-%d')),
(1,30,str_to_date('2019-08-15','%Y-%m-%d')),
(1,35,str_to_date('2019-08-16','%Y-%m-%d')),
(2,65,str_to_date('2019-08-17','%Y-%m-%d')),
(3,20,str_to_date('2019-08-18','%Y-%m-%d'));


#Solution:
#note: want to find the last time when the price was changed before or on 16
#if changed, the new_price will be the price on the change date (before or on 16)
#if not, new_price will be 10 (no change before 16)

WITH t1 AS (
	SELECT DISTINCT product_id, new_price
	FROM
	(SELECT *,
		   ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) last_date
	FROM products
	WHERE change_date <= '2019-08-16') tmp
	WHERE last_date = 1)
    
SELECT *
FROM t1
UNION ALL    
SELECT product_id, 10 new_price
FROM products
WHERE product_id NOT IN (SELECT product_id FROM t1)    
    
    