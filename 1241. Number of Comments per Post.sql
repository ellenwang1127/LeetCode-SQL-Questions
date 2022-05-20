create table submissions (
	sub_id int,
    parent_id int
);

insert into submissions values
(1,null),
(2,null),
(1,null),
(12,null),
(3,1),
(5,2),
(3,1),
(4,1),
(9,1),
(10,2),
(6,7);


#Solution:
SELECT DISTINCT s1.sub_id post_id, COUNT(DISTINCT s2.sub_id) number_of_comments
FROM submissions s1
LEFT JOIN submissions s2 ON s1.sub_id=s2.parent_id
WHERE s1.sub_id IS NULL
GROUP BY 1