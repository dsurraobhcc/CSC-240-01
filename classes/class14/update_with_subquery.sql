use sakila;

-- copy 
drop table if exists copy_film;
create table copy_film as select * from film;

-- Update all G-rated action films to PG-13, using a subquery

-- get G-rated action films
select f.film_id from copy_film f
inner join film_category fc on f.film_id = fc.film_id 
inner join category c on fc.category_id = c.category_id
where f.rating = 'G' and c.name = 'Action';

update copy_film
set rating = 'PG-13'
where film_id IN (
	select f.film_id from film f
	inner join film_category fc on f.film_id = fc.film_id 
	inner join category c on fc.category_id = c.category_id
	where f.rating = 'G' and c.name = 'Action'
);

/*
Error Code: 1093. You can't specify target table 'copy_film' for update in FROM clause
Error Code: 1242. Subquery returns more than 1 row
18 row(s) affected Rows matched: 18  Changed: 18  Warnings: 0
*/

-- this should now be empty
select f.film_id, c.name from copy_film f
inner join film_category fc on f.film_id = fc.film_id 
inner join category c on fc.category_id = c.category_id
where f.rating = 'G' and c.name = 'Action';

-- Update all G-rated horror films to R, using a subquery
select f.film_id, c.name from copy_film f
inner join film_category fc on f.film_id = fc.film_id 
inner join category c on fc.category_id = c.category_id
where f.rating = 'G' and c.name = 'Horror';

-- update with a join
update copy_film f
inner join film_category fc on f.film_id = fc.film_id 
inner join category c on fc.category_id = c.category_id
set f.rating = 'R'
where f.rating = 'G' and c.name = 'Horror';
-- 9 row(s) affected Rows matched: 9  Changed: 9  Warnings: 0

-- confirm
select f.film_id, c.name from copy_film f
inner join film_category fc on f.film_id = fc.film_id 
inner join category c on fc.category_id = c.category_id
where f.rating = 'R' and c.name = 'Horror'; -- 23 rows
