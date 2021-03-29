use sakila;

-- create a copy of the film table.
create table copy_film as select * from film;

select * from copy_film;

-- update release_year to 2007
-- updates all rows, since there is no where clause
update copy_film 
set release_year = 2007;

-- confirm result
select count(*) from copy_film where release_year != 2007;

-- increase the rental rate by one dollar for all films
select title, rental_rate from copy_film;

update copy_film
set rental_rate = rental_rate + 1;

-- decrement rental rate by one dollar
update copy_film
set rental_rate = rental_rate - 1;

-- update all 'PG' movies to .99
select rental_rate from copy_film
where rating = 'PG' and rental_rate != .99;

update copy_film 
set rental_rate =.99 
where rating ='PG';

-- Double the rental duration for films longer than 120 minutes
select title, rental_duration from copy_film
where length > 120; -- 457

update copy_film 
set rental_duration = rental_duration * 2 
where length > 120;     

/* 
 Update multiple columns in a single statement
*/

-- double the rental duration and lower the rental rate by 50 cents
-- for all movies rated G
select rental_rate, rental_duration from copy_film
where rating = 'G'; -- 178 rows

update copy_film 
	set rental_rate = rental_rate - .50, 
		rental_duration = rental_duration * 2 
where rating= 'G';  
/*
178 row(s) affected Rows matched: 178  Changed: 178  Warnings: 0
*/







