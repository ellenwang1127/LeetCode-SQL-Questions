drop table if exists person;
create table person (
	personId int,
    lastName varchar(10),
    firstName varchar(10)
);

insert into person values
(1, 'Wang', 'Allen'), (2,'Alice', 'Bob');

drop table if exists address;
create table address (
	addressId int,
    personId int,
    city varchar(50),
    state varchar(50)
);

insert into address values
(1,2,'New York City','New York'), (2,3, 'Leetcode','California');


#Solution:
SELECT firstName, lastName, city, state
FROM person p
LEFT JOIN address a USING (personId)