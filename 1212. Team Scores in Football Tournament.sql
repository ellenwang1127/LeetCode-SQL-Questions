drop table if exists teams;
create table teams (
	team_id int,
    team_name varchar(20)
);

insert into teams values
(10,'Leetcode FC'),
(20,'NewYork FC'),
(30,'Atlanta FC'),
(40,'Chicago FC'),
(50,'Toronto FC');

drop table if exists matches;
create table matches (
	match_id int,
    host_team int,
    guest_team int,
    host_goals int,
    guest_goals int
);

insert into matches values
(1,10,20,3,0),
(2,30,10,2,2),
(3,10,50,5,1),
(4,20,30,1,0),
(5,50,30,1,0);


#Solution:
SELECT t.team_id, team_name,
   SUM(CASE WHEN team_id = host_team AND host_goals > guest_goals THEN 3
             WHEN team_id = guest_team AND guest_goals > host_goals THEN 3
             WHEN host_goals = guest_goals THEN 1
             ELSE 0
        END) AS num_points
FROM Teams t
LEFT JOIN Matches m 
ON t.team_id = m.host_team OR t.team_id = m.guest_team
GROUP BY 1,2
ORDER BY 3 DESC, 1