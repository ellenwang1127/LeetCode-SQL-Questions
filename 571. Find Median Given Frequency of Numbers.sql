create table numbers (
	number int,
    frequency int
);

insert into numbers values
(0,7),(1,1),(2,3),(3,1);


#Solution:
SELECT ROUND(AVG(number),2) median
FROM
(SELECT *, SUM(frequency) OVER (ORDER BY number) row_num,
		  SUM(frequency) OVER () total_num
FROM numbers) t1
WHERE total_num/2 BETWEEN row_num - frequency AND row_num

/*
12:6,7 (total/2, total/2 +1)
13:7   ((total+1)/2)
14:7,8
*/