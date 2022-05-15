create table events (
	business_id int,
    event_type varchar(10),
    occurences int
);

insert into events values
(1,'reviews',7),
(3,'reviews',3),
(1,'ads',11),
(2,'ads',7),
(3,'ads',6),
(1,'page views',3),
(2,'page views',12);


#Solution 1: window function
SELECT business_id
FROM
(SELECT *,
		AVG(occurences) OVER (PARTITION BY event_type) avg_occ
FROM events) t1
GROUP BY business_id
HAVING SUM(CASE WHEN occurences > avg_occ THEN 1 ELSE 0 END) > 1


#Solution 2: subquery, join
SELECT business_id
FROM events e
JOIN
(SELECT event_type, AVG(occurences) avg_occ
FROM events
GROUP BY 1) t1
USING(event_type)
WHERE occurences > avg_occ
GROUP BY business_id
HAVING COUNT(*) > 1