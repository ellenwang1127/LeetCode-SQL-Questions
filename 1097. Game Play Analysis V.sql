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
(3,1,str_to_date('2016-03-01', '%Y-%m-%d'),0),
(3,4,str_to_date('2016-07-03', '%Y-%m-%d'),5);


#Solution:
WITH t1 AS (
SELECT player_id, MIN(event_date) install_dt
FROM activity
GROUP BY player_id)

SELECT install_dt,
		COUNT(install_dt) installs,
        ROUND(COUNT(a.player_id)/COUNT(install_dt),2) Day1_retention
FROM activity a
RIGHT JOIN t1 ON datediff(a.event_date, t1.install_dt) = 1 AND a.player_id = t1.player_id
GROUP BY install_dt