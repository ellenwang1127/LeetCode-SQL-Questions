drop table if exists cinema;
CREATE TABLE cinema (
	id INT,
    movie VARCHAR(45),
    description VARCHAR(45),
    rating FLOAT
);

INSERT INTO cinema Values
(1,'War','great 3D',8.9),
(2,'Science','fiction',8.5),
(3,'irish','boring',6.2),
(4,'Ice song','Fantacy',8.6),
(5,'House card','Interestng',9.1);



#Solution:
SELECT *
FROM cinema
WHERE id%2 != 0 AND description NOT LIKE '%boring%'
ORDER BY rating DESC