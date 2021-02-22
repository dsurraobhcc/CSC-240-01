use sakila;

/*
Return all film titles that are in the 'Action' film category.

Hint: join film, film_category, and category tables
*/

select title from film
join film_category using (film_id) join category using (category_id)
where name= 'Action'
and title not in
(
	select f.title from film f
	inner join film_category fc on  f.film_id = fc.film_id
	inner join category c on c.category_id = fc.category_id
	where c.name = 'action'
);

select f.title from film f
inner join film_category fc on  f.film_id = fc.film_id
inner join category c on c.category_id = fc.category_id
where c.name = 'action'
and f.title not in
(
	select title from film
	join film_category using (film_id) join category using (category_id)
	where name= 'Action'
);



select f.title from film f
join film_category fc on f.film_id = fc.film_id
join category c on c.category_id = fc.category_id
where c.name in ('Action') ;