Create table Logs(
    id INT,
    num INT
);
Insert into Logs (id, num) Values
(1,1),
(2,1),
(3,1),
(4,2),
(5,1),
(6,2),
(7,2);

#Solution 1:
select distinct num as ConsecutiveNums
from Logs
where (id + 1, num) in (select * from Logs) and (id + 2, num) in (select * from Logs)


#Solution 2: Window Function
SELECT DISTINCT num ConsecutiveNums
FROM
(SELECT *, 
		LEAD(num) OVER () next,
        LAG(num) OVER () prev
FROM logs) t1
WHERE num = next AND num = prev



#Solution 3: Self Join
SELECT DISTINCT l1.num ConsecutiveNums
FROM logs l1
JOIN logs l2 ON l1.id=l2.id-1 AND l1.num=l2.num
JOIN logs l3 ON l1.id=l3.id-2 AND l2.num=l3.num

