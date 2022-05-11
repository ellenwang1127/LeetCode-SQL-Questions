CREATE TABLE follow (
	followee ENUM('A','B','D'),
    follower ENUM('B','C','D','E')
);

INSERT INTO follow VALUES
('A','B'),
('B','C'),
('B','D'),
('D','E');


#Solution:
SELECT f1.followee follower, COUNT(DISTINCT f1.follower) num
FROM follow f1
JOIN follow f2 ON f1.followee=f2.follower
GROUP BY 1