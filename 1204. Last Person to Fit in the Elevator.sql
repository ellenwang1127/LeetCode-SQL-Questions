drop table if exists queue;
create table queue (
	person_id int,
    person_name varchar(45),
    weight int,
    turn int
);

insert into queue values
(5,'George Washington',250,1),
(3,'John Adams',350,2),
(6,'Thomas Jefferson',400,3),
(2,'Will Johnliams',200,4),
(4,'Thomas Jefferson',175,5),
(1,'James Elephant',500,6);


#Solution:
SELECT person_name
FROM
(SELECT person_name, turn,
	   SUM(weight) OVER (ORDER BY turn) total_weight
FROM queue) t1        
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1