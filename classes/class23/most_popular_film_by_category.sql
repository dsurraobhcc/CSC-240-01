use sakila;

-- write a function to:
-- get most popular movie rented by genre (category)
CREATE VIEW sales_by_film
AS
SELECT
	f.title, c.name, SUM(p.amount) AS total_sales
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
GROUP BY f.title, c.name;

select * from sales_by_film;

-- get maximum total sales by category
-- use MAX() and GROUP BY

