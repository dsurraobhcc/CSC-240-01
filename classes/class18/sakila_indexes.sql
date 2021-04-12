use sakila;

-- execution plan with index
explain
select * from actor where last_name = 'ZELLWEGER';
-- 3 row(s) returned, 0.00044 sec / 0.000014 sec

-- execution plan without index: full table scan
explain
select * from actor where first_name = 'NICK';

-- duration without index
select * from actor where first_name = 'NICK';
-- 0.00039 sec / 0.000010 sec

alter table actor add index `idx_actor_first_name` (first_name);

show indexes from actor;

-- duration with index
select * from actor where first_name = 'NICK';
-- 0.00056 sec / 0.000014 sec: no significant difference
-- because there are only 200 rows of data, small data size




