create table numbers (
	number int,
    frequency int
);

insert into numbers values
(0,7),(1,1),(2,3),(3,1);


#Solution 1:
WITH RECURSIVE rec_cte AS (
SELECT number, frequency, 1 cnt FROM numbers
UNION
SELECT number, frequency, cnt+1 FROM rec_cte
WHERE cnt<frequency
),
	t1 AS (
SELECT *, ROW_NUMBER() OVER(ORDER BY number) row_num,
		COUNT(number) OVER() count
FROM rec_cte
ORDER BY number, frequency, count    
)

SELECT AVG(number)
FROM t1
WHERE row_num BETWEEN count/2 AND count/2 + 1



#Soltution 2:
SELECT ROUND(AVG(number),2) median
FROM
(SELECT *, SUM(frequency) OVER (ORDER BY number) row_num,
		  SUM(frequency) OVER () total_num
FROM numbers) t1
WHERE total_num/2 BETWEEN row_num - frequency AND row_num