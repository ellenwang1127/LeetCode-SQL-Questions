create table tree (
	id int,
    p_id int
);

insert into tree values
(1,null),(2,1),(3,1),(4,2),(5,2);


#Solution:
SELECT DISTINCT t1.id,
	   CASE
       WHEN t1.p_id IS NULL THEN 'Root'
       WHEN t1.p_id IS NOT NULL AND t2.id IS NOT NULL THEN 'Inner'
       WHEN t1.p_id IS NOT NULL AND t2.id IS NULL THEN 'Leaf'
       END AS type
FROM tree t1
LEFT JOIN tree t2 ON t1.id=t2.p_id