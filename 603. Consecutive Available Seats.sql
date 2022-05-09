create table cinema (
	seat_id int,
    free int
);

insert into cinema values
(1,1),(2,0),(3,1),(4,1),(5,1);


#Solution 1: self join
WITH t1 AS
(SELECT c1.seat_id id1, c2.seat_id id2, c3.seat_id id3
FROM cinema c1, cinema c2, cinema c3
WHERE c1.seat_id + 1 = c2.seat_id AND c2.seat_id + 1 = c3.seat_id 
AND c1.free=c2.free=c3.free=1) 

SELECT id1 seat_id FROM t1 
UNION ALL
SELECT id2 FROM t1
UNION ALL
SELECT id3 FROM t1


#Solution 2: window function
WITH t1 AS (
SELECT *,
		LAG(free) OVER (ORDER BY seat_id) prev,
		LEAD(free) OVER (ORDER BY seat_id) next
FROM cinema        
)

SELECT seat_id
FROM t1
WHERE (free=1 AND next=1) OR (free=1 AND prev=1)
ORDER BY 1

