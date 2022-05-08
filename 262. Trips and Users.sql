Create table Trips(
    Id INT,
    Client_id INT,
    Driver_id INT,
    City_id INT,
    Status ENUM('completed', 'cancelled_by_driver', 'cancelled_by_client'),
    Request_at DATE
);
Insert into Trips Values
(1,1,10,1,'completed', str_to_date('2013-10-01', '%Y-%m-%d')),
(2,2,11,1,'cancelled_by_driver', str_to_date('2013-10-01', '%Y-%m-%d')),
(3,3,12,6,'completed', str_to_date('2013-10-01', '%Y-%m-%d')),
(4,4,13,6,'cancelled_by_driver', str_to_date('2013-10-01', '%Y-%m-%d')),
(5,1,10,1,'completed', str_to_date('2013-10-02', '%Y-%m-%d')),
(6,2,11,6,'completed', str_to_date('2013-10-02', '%Y-%m-%d')),
(7,3,12,6,'completed', str_to_date('2013-10-02', '%Y-%m-%d')),
(8,2,12,12,'completed', str_to_date('2013-10-03', '%Y-%m-%d')),
(9,3,10,12,'completed', str_to_date('2013-10-03', '%Y-%m-%d')),
(10,4,13,12,'cancelled_by_driver', str_to_date('2013-10-03', '%Y-%m-%d'));

Create table Users(
    Users_id INT,
    Banned ENUM('No', 'Yes'),
    Role ENUM('client', 'driver', 'partner')
);
Insert into Users Values
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');


#Solution:
SELECT  request_at day,
		ROUND(SUM(CASE WHEN status <> 'completed' THEN 1 ELSE 0 END)/COUNT(DISTINCT id),2) cancellation_rate
FROM trips t
JOIN users u
ON t.client_id = u.users_id
WHERE banned = 'No'AND Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at








