create table friends (
	id int,
    name varchar(20),
    activity varchar(50)
);

insert into friends values
(1,'Jonathan D.','eating'),
(2,'Jade W.','singing'),
(3,'Victor J.','singing'),
(4,'Elvis Q.','eating'),
(5,'Daniel A.','eating'),
(6,'Bob B.','house riding');

create table activities (
	id int,
	name varchar(50)
);

insert into activities values
(1,'eating'),(2,'singing'),(3,'horse riding');


#Solution:
WITH t1 AS (
SELECT activity, COUNT(name) cnt
FROM friends
GROUP BY 1)

SELECT activity
FROM t1
WHERE cnt NOT IN (
SELECT MAX(cnt) FROM t1
UNION ALL
SELECT MIN(cnt) FROM t1
)