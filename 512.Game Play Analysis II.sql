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
SELECT player_id, device_id
FROM activity
WHERE (player_id, event_date) IN
(SELECT player_id, MIN(event_date) first_login
FROM activity
GROUP BY player_id) 
