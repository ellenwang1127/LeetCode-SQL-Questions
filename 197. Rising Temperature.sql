create table weather (
	id int,
    recordDate date,
    temperature int
);

insert into weather values
(1,str_to_date('2015-01-01','%Y-%m-%d'),10),
(2,str_to_date('2015-01-02','%Y-%m-%d'),25),
(3,str_to_date('2015-01-03','%Y-%m-%d'),20),
(4,str_to_date('2015-01-04','%Y-%m-%d'),30);



#Solution 1: window function
SELECT id
FROM
(SELECT *,
		LAG(temperature) OVER (ORDER BY recordDate) prev
FROM weather) t1
WHERE temperature > prev


#Solution 2: self join
SELECT w2.id
FROM weather w1
JOIN weather w2 ON w1.recordDate = w2.recordDate - INTERVAL 1 day
WHERE w1.temperature < w2.temperature

