use sakila;

-- set @category = 'Action';
set @category = 'Documentary';
select udf_get_most_popular_film_by_category(@category);

select category_id, 
	name,
    udf_get_most_popular_film_by_category(name) as most_popular_film,
    last_update
from category;

-- TODO: function to get most popular actor by category
-- i.e. actor in the most number of movies by category

