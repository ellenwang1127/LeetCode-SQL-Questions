create table seat (
	id int,
    student varchar(10)
);

insert into seat values
(1,'Abbot'),
(2,'Doris'),
(3,'Emerson'),
(4,'Green'),
(5,'Jeames');


#Solution:
SELECT 
	CASE
    WHEN id%2 != 0 AND id= (select max(id) from seat) THEN id
    WHEN id%2 = 0 THEN id-1
    ELSE id+1
    END AS id,
    student
FROM seat
ORDER BY id