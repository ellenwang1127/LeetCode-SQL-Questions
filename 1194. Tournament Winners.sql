drop table if exists players;
create table players (
	player_id int,
    group_id int
);

insert into players values
(15,1),(25,1),(30,1),(45,1),(10,2),(35,2),(50,2),(20,3),(40,3);

drop table if exists matches;
create table matches (
	match_id int,
    first_player int,
    second_player int,
    first_score int,
    second_score int
);

insert into matches values
(1,15,45,3,0),(2,30,25,1,2),(3,30,15,2,0),(4,40,20,5,2),(5,35,50,1,1);



#Solution:
WITH t1 AS (
	SELECT player_id, IFNULL(SUM(score),0) total_score
	FROM
	(SELECT first_player player_id, first_score score
	FROM matches m1
	UNION ALL
	SELECT second_player, second_score 
	FROM matches m2) tmp
	GROUP BY player_id),
	t2 AS (
	SELECT group_id, player_id,
		   RANK() OVER (PARTITION BY group_id ORDER BY total_score DESC, player_id) rnk
	FROM players p
	LEFT JOIN t1 USING(player_id))
SELECT group_id, player_id
FROM t2
WHERE rnk = 1



