create table queries (
	query_name varchar(10),
    result varchar(50),
    position int,
    rating int
);

insert into queries values
('Dog','Golden Retriever',1,5),
('Dog','German Shepherd',2,5),
('Dog','Mule',200,1),
('Cat','Shirazi',5,2),
('Cat','Siamese',3,3),
('Cat','Sphynx',7,4);


#Solution:
SELECT query_name, 
		ROUND(AVG(rating/position),2) quality,
        ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)/COUNT(*)*100,2) poor_query_percentage
FROM queries
GROUP BY query_name