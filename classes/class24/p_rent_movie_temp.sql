use sakila;

/*
To rent a movie:
input: movie, customer, store
check if movie is in store inventory
check if a copy of the movie is not rented out
generate rental
*/
set @film_title = 'Academy Dinosaur';
set @customer_email = 'PATRICIA.JOHNSON@sakilacustomer.org';
set @store_id = 1;

-- search store inventory for film
select * from inventory i
inner join film f on i.film_id = f.film_id
where i.store_id = @store_id
and f.title = upper(@film_title)
-- where the film is in the store
and i.inventory_id not in 
(select inventory_id from rental where return_date is null)
limit 1;




