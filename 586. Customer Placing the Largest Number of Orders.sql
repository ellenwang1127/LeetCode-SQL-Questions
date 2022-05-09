create table orders (
	order_number int,
    customer_number int
);

insert into orders values
(1,1),(2,2),(3,3),(4,3);



#Solution:
SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1