drop table if exists users;
create table users (
	user_id int,
    join_date date,
    favorite_brand varchar(10)
);

drop table if exists orders;
create table orders (
	order_id int,
    order_date date,
    item_id int,
    buyer_id int,
    seller_id int
);

drop table if exists items;
create table items (
	item_id int,
    item_brand varchar(10)
);

insert into users values
(1,str_to_date('2018-01-01','%Y-%m-%d'),'Lenovo'),
(2,str_to_date('2018-02-09','%Y-%m-%d'),'Samsung'),
(3,str_to_date('2018-01-19','%Y-%m-%d'),'LG'),
(4,str_to_date('2018-05-21','%Y-%m-%d'),'HP');

insert into orders values
(1,str_to_date('2019-08-01','%Y-%m-%d'),4,1,2),
(2,str_to_date('2019-08-02','%Y-%m-%d'),2,1,3),
(3,str_to_date('2019-08-03','%Y-%m-%d'),3,2,3),
(4,str_to_date('2019-08-04','%Y-%m-%d'),1,4,2),
(5,str_to_date('2019-08-04','%Y-%m-%d'),1,3,4),
(6,str_to_date('2019-08-05','%Y-%m-%d'),2,2,4);

insert into items values
(1,'Samsung'),
(2,'Lenovo'),
(3,'LG'),
(4,'HP');


#Solution:
WITH t1 AS
(SELECT u.user_id seller_id, favorite_brand, order_date, o.item_id, item_brand,
		RANK() OVER(PARTITION BY seller_id ORDER BY order_date) rnk
FROM users u
LEFT JOIN orders o ON u.user_id = o.seller_id
LEFT JOIN items i ON o.item_id = i.item_id) 

SELECT seller_id, CASE WHEN favorite_brand = item_brand THEN 'yes' ELSE 'no' END AS 2nd_item_fav_brand
FROM t1
WHERE rnk = 2
UNION ALL
SELECT seller_id,'no'
FROM t1
WHERE order_date IS NULL
ORDER BY seller_id