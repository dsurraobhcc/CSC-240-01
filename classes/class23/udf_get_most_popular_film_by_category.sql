use sakila;

drop function if exists udf_get_most_popular_film_by_category;

use delimiter //

create function udf_get_most_popular_film_by_category (
	category_name varchar(25)
)
returns varchar(128)
	deterministic
begin
	declare v_film_title varchar(128);
    
    select title into v_film_title from sales_by_film s1
	where s1.total_sales = (
		select max(s2.total_sales) from sales_by_film s2
		where s2.name = s1.name
	)
    and name = category_name limit 1;
    
    return v_film_title;
end//

use delimiter ;