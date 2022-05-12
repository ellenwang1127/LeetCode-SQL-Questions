create table customer (
	customer_id int,
    product_key int
);

insert into customer values
(1,5),(2,6),(3,5),(3,6),(1,6);

create table product (
	product_key int
);

insert into product values
(5),(6);


#Solution:
SELECT customer_id
FROM customer
GROUP BY 1
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM product)