use sakila;

select * from 
(
	select title, description from film 
	where rental_rate = .99
) as films_for_99_cents;


select avg(rental_rate) from film;