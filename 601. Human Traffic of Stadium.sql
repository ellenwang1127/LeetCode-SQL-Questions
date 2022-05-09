create table stadium (
	id int,
    visit_date date,
    people int
);

insert into stadium values
(1,str_to_date('2017-01-01','%Y-%m-%d'),10),
(2,str_to_date('2017-01-02','%Y-%m-%d'),109),
(3,str_to_date('2017-01-03','%Y-%m-%d'),150),
(4,str_to_date('2017-01-04','%Y-%m-%d'),99),
(5,str_to_date('2017-01-05','%Y-%m-%d'),145),
(6,str_to_date('2017-01-06','%Y-%m-%d'),1455),
(7,str_to_date('2017-01-07','%Y-%m-%d'),199),
(8,str_to_date('2017-01-09','%Y-%m-%d'),188);



#Solution 1: self join
WITH t1 AS (
SELECT s1.id id1, s2.id id2, s3.id id3
FROM stadium s1, stadium s2, stadium s3
WHERE s1.id + 1 = s2.id AND s2.id + 1 = s3.id
AND s1.people >= 100 AND s2.people >= 100 AND s3.people >= 100)

SELECT id, visit_date, people
FROM stadium
WHERE id IN (
SELECT id1 FROM t1
UNION
SELECT id2 FROM t1
UNION 
SELECT id3 FROM t1
)


#Solution 2: window function
SELECT id, visit_date,people
FROM
(SELECT *,
		LAG(people) OVER (ORDER BY id) pre,        
		LAG(people,2) OVER (ORDER BY id) pre2,        
		LEAD(people) OVER (ORDER BY id) nxt,        
		LEAD(people,2) OVER (ORDER BY id) nxt2        
FROM stadium) t1
WHERE (people>=100 AND nxt>=100 AND nxt2>=100)
OR (pre>=100 AND people >=100 AND nxt>=100)
OR (pre2>=100 AND pre>=100 AND people>=100)

