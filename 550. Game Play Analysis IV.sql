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
SELECT player_id, MIN(event_date) first_login
FROM activity
GROUP BY 1)

SELECT ROUND(COUNT(DISTINCT player_id)/(SELECT COUNT(DISTINCT player_id) FROM activity),2) fraction
FROM activity a
JOIN t1 USING(player_id) 
WHERE a.event_date = t1.first_login + INTERVAL 1 day