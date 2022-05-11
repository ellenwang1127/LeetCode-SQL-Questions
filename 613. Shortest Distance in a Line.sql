create table point (
	x int
);

insert into point values
(-1),(0),(2);


#Solution:
SELECT min(abs(p1.x-p2.x)) shortest
FROM point p1
JOIN point p2 ON p1.x != p2.x