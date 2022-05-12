drop table if exists product;
CREATE TABLE Product (
	product_id INT,
    product_name VARCHAR(45)
);

INSERT INTO Product Values
(100,'Nokia'),
(200,'Apple'),
(300,'Samsung')
;

drop table if exists sales;
CREATE TABLE Sales (
	sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT
);

INSERT INTO Sales Values
(1,100,2008,10,5000),
(2,100,2009,12,5000),
(7,200,2011,15,9000);



#Solution:
SELECT product_id, year, quantity, price
FROM sales
WHERE (product_id, year) IN
(SELECT product_id, MIN(year)
FROM sales
GROUP BY 1)
