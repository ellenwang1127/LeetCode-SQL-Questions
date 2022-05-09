drop table if exists employee;
create table employee (
	id int,
    company ENUM('A','B','C'),
    salary int
);

insert into employee values
(1,'A',2341),
(2,'A',341),
(3,'A',15),
(4,'A',15314),
(5,'A',451),
(6,'A',513),
(7,'B',15),
(8,'B',13),
(9,'B',1154),
(10,'B',1345),
(11,'B',1221),
(12,'B',234),
(13,'C',2345),
(14,'C',2645),
(15,'C',2645),
(16,'C',2652),
(17,'C',65);





#Solution:
SELECT id, company, salary
FROM
(SELECT *, ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary) rnk,
			COUNT(id) OVER (PARTITION BY company) max_row
FROM employee) t1
WHERE rnk BETWEEN max_row/2 AND max_row/2 + 1



