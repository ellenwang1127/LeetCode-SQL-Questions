create table student (
	name varchar(10),
    continent varchar(10)
);

insert into student values 
('Jack','America'),('Pascal','Europe'),('Xi','Asia'),('Jane','America');


#Solution:
SELECT America, Asia, Europe
FROM
(SELECT name America, 
		ROW_NUMBER() OVER () rn
FROM student
WHERE continent = 'America') t1
LEFT JOIN 
(SELECT name Asia, 
		ROW_NUMBER() OVER () tn
FROM student
WHERE continent = 'Asia') t2
ON rn = tn
LEFT JOIN
(SELECT name Europe, 
		ROW_NUMBER() OVER () kn
FROM student
WHERE continent = 'Europe') t3
ON rn = kn