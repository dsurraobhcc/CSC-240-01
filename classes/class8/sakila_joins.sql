use sakila;

select c.name, count(*) as num_films from film_category fc
join category c using (category_id)
group by c.name
having num_films =
(
	select max(num_films) from 
	(
		select c.name, count(*) as num_films from film_category fc 
		join category c using (category_id)
		group by c.name
	) film_counts
);