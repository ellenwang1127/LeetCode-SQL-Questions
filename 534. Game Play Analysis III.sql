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
(1,3,str_to_date('2017-06-25', '%Y-%m-%d'),1),
(3,1,str_to_date('2016-03-02', '%Y-%m-%d'),0),
(3,4,str_to_date('2018-07-03', '%Y-%m-%d'),5);


#Solution 1: window function
SELECT player_id, event_date, 
		SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date) games_played_so_far
FROM activity


#Solution 2: self join
SELECT a1.player_id, a1.event_date, SUM(a2.games_played) games_played_so_far
FROM activity a1
JOIN activity a2 USING(player_id)
WHERE a1.event_date >= a2.event_date
GROUP BY 1,2
ORDER BY 1,2


