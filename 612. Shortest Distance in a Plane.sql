create table point_2d (
	x int,
    y int
);

insert into point_2d values
(-1,-1),(0,0),(-1,-2);


#Solution:
SELECT round(sqrt(min(pow(p1.x-p2.x,2) + pow(p1.y-p2.y,2))),2) shortest
FROM point_2d p1
JOIN point_2d p2 ON p1.x != p2.x OR p1.y != p2.y