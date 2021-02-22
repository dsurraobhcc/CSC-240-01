/*
	 Get all actors who starred in the film titled 'OKLAHOMA JUMANJI'.

Hint: join actor, film_actor and film tables
*/

select concat(a.first_name, ' ', a.last_name) as 'actor_name'
from actor a
join film_actor fa on a.actor_id = fa.actor_id 
join film f on fa.film_id = f.film_id
where f.title in ('OKLAHOMA JUMANJI') ;