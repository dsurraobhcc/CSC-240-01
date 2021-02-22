/*
Get the number of films in each category.

Hints:
join film, film_category, category
use group by
*/

select c.name,
        count(*) from film f
join film_category fc using (film_id) 
join category c using (category_id)
group by c.name;

-- GROUP BY, HAVING
-- HAVING: used to filter grouped queries
select c.name, count(*) as num_films from film_category fc 
join category c using (category_id)
group by c.name
having num_films >= 60;

-- the category(ies) with the most number of films: using limit
select c.name, count(*) as num_films from film_category fc 
join category c using (category_id)
group by c.name
order by num_films desc limit 1;

-- the category(ies) with the most number of films: using max()
/*
Error Code: 1248. Every derived table must have its own alias
*/
-- returns 74
select max(num_films) from 
(
	select c.name, count(*) as num_films from film_category fc 
	join category c using (category_id)
	group by c.name
) film_counts;

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

-- the category(ies) with the fewest number of films: using min()
-- avg()

-- can the above be done with correlated subqueries