CREATE TABLE ActorDirector (
	actor_id INT,
    director_id INT,
    timestamp INT
);

INSERT INTO ActorDirector Values
(1,1,0),
(1,1,1),
(1,1,2),
(1,2,3),
(1,2,4),
(2,1,5),
(2,1,6);


#Solution:
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY 1,2
HAVING COUNT(*) >= 3