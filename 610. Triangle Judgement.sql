create table triangle (
	x int,
    y int,
    z int
);

insert into triangle values
(13,15,30),(10,20,15);


#Solution:
SELECT *,
		CASE WHEN x+y>z AND x+z>y AND z+y>x THEN 'Yes' ELSE 'No' END AS triangle
FROM triangle