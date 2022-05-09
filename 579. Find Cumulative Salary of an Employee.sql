drop table if exists employee;
create table employee (
	id int,
    month int,
    salary int
);

insert into employee values
(1,1,20),(2,1,20),(1,2,30),(2,2,30),(3,2,40),(1,3,40),(3,3,60),(1,4,60),(3,4,70);


#Solution:
SELECT id, month, salary
FROM
(SELECT id, month, 
			MAX(month) OVER (PARTITION BY id) max_month,
			SUM(salary) OVER (PARTITION BY id ORDER BY month) salary
FROM employee) t1
WHERE month <> max_month
ORDER BY 1,2 DESC