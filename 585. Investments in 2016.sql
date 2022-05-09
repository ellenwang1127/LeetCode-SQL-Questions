create table tiv2016 (
	pid int,
    tiv_2015 int,
    tiv_2016 int,
    lat int,
    lon int
);

insert into tiv2016 values
(1,10,5,10,10),
(2,20,20,20,20),
(3,10,30,20,20),
(4,10,40,40,40);



#Solution:
SELECT SUM(tiv_2016) tiv_2016
FROM tiv2016
WHERE concat(lat,',',lon) IN
(SELECT concat(lat,',',lon)
FROM tiv2016
GROUP BY lat,lon
HAVING COUNT(1) = 1)
AND tiv_2015 IN
(SELECT tiv_2015
FROM tiv2016
GROUP BY 1
HAVING COUNT(1) > 1)