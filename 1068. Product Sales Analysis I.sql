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
SELECT product_name, year, price
FROM sales s
LEFT JOIN product p USING(product_id)
