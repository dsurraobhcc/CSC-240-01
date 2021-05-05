use sakila;

drop procedure if exists p_rent_movie;

delimiter //

create procedure p_rent_movie(
	IN i_film_title varchar(128),
    IN i_customer_email varchar(50),
    IN i_store_id tinyint,
    IN i_staff_id tinyint,
    OUT o_success_flag bool
)
begin
	select * from inventory i
	inner join film f on i.film_id = f.film_id
	where i.store_id = @store_id
	and f.title = upper(@film_title)
	and i.inventory_id not in 
	(select inventory_id from rental where return_date is null)
	limit 1;
end//

delimiter ;

