create table my_numbers (
	num int
);

insert into my_numbers values
(8),(8),(3),(3),(1),(4),(5),(6);


#Solution:
SELECT MAX(num) num
FROM
(SELECT num
FROM my_numbers
GROUP BY 1
HAVING COUNT(*) = 1) t1
