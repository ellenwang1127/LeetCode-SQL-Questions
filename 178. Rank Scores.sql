drop table if exists scores;
create table scores (
	id int,
    score decimal(4,2)
);

insert into scores values
(1,3.50),(2,3.65),(3,4.00),(4,3.85),(5,4.00),(6,3.65);


#Solution:
SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) 'rank'
FROM scores