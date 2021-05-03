use delimiter //

create function udf_get_most_popular_film_by_category (
	category_name varchar(25)
)
returns varchar(128)
	deterministic
begin
	declare v_movie_ int;
    
    select count(ri.RecipeID) into v_num_recipes from Recipe_Ingredients ri
	inner join Ingredients i on ri.IngredientID = i.IngredientID
	where i.IngredientName = ingredient_name;
    
    return v_num_recipes;
end//

use delimiter ;