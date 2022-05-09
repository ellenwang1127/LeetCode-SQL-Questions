CREATE TABLE Candidate (
	id INT,
    name ENUM('A','B','C','D','E')
);

INSERT INTO Candidate VALUES
(1,'A'),
(2,'B'),
(3,'C'),
(4,'D'),
(5,'E');

CREATE TABLE Vote (
	id INT,
    candidate_id INT
);

INSERT INTO Vote VALUES
(1,2),
(2,4),
(3,3),
(4,2),
(5,5);


#Solution:
SELECT c.name
FROM candidate c
WHERE c.id =
(SELECT c.id
FROM candidate c
LEFT JOIN vote v ON c.id=v.candidate_id
GROUP BY c.id
ORDER BY COUNT(v.id) DESC
LIMIT 1)