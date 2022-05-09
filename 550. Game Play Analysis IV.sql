DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (
	player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);

INSERT INTO Activity VALUES
(1,2,str_to_date('2016-03-01', '%Y-%m-%d'),5),
(1,2,str_to_date('2016-03-02', '%Y-%m-%d'),6),
(2,3,str_to_date('2017-06-25', '%Y-%m-%d'),1),
(3,1,str_to_date('2016-03-02', '%Y-%m-%d'),0),
(3,4,str_to_date('2018-07-03', '%Y-%m-%d'),5);


#Solution:
WITH t1 AS (
SELECT COUNT(a1.player_id) cnt
FROM activity a1
JOIN activity a2 ON a1.player_id=a2.player_id 
WHERE a1.event_date = a2.event_date + INTERVAL 1 day
)
SELECT ROUND((SELECT * FROM t1)/COUNT(DISTINCT player_id),2) fraction
FROM activity