use sakila;

set @film_title = 'Academy Dinosaur';
set @customer_email = 'PATRICIA.JOHNSON@sakilacustomer.org';
set @store_id = 1;
set @staff_id = 1;

call p_rent_movie(@film_title, @customer_email,
    @store_id, @staff_id, @o_success_flag);