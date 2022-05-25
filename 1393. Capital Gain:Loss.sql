create table stocks (
	stock_name varchar(50),
    operation enum('buy','sell'),
    operation_day int,
    price int
);

insert into stocks values
('Leetcode','buy',1,1000),
('Corona Masks','buy',2,10),
('Leetcode','sell',5,9000),
('Handbags','buy',17,30000),
('Corona Masks','sell',3,1010),
('Corona Masks','buy',4,1000),
('Corona Masks','sell',5,500),
('Corona Masks','buy',6,1000),
('Handbags','sell',29,7000),
('Corona Masks','sell',10,10000);


#Solution:
SELECT stock_name,
		SUM(CASE WHEN operation = 'buy' THEN -price ELSE price END) capital_gain_loss
FROM stocks
GROUP BY 1