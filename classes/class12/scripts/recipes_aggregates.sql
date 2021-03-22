use RecipesExample;

select rc.RecipeClassDescription,
	r.RecipeTitle
from Recipe_Classes rc
inner join Recipes r on rc.RecipeClassID = r.RecipeClassID;

-- how many recipes are in each class? use GROUP BY
select rc.RecipeClassDescription, count(r.RecipeTitle) from Recipe_Classes rc
inner join Recipes r on rc.RecipeClassID = r.RecipeClassID
group by rc.RecipeClassDescription;

-- which recipe class has the most recipes?
-- using table aliases, group by, subqueries
with RecipeClassCount as (
	select rc.RecipeClassDescription, count(r.RecipeTitle) as RecipeCount
    from Recipe_Classes rc
	inner join Recipes r on rc.RecipeClassID = r.RecipeClassID
	group by rc.RecipeClassDescription
)
select * from RecipeClassCount
where RecipeCount = (select max(RecipeCount) from RecipeClassCount);

-- which recipe class has the least number of recipes?
with RecipeClassCount as (
	select rc.RecipeClassDescription, count(r.RecipeTitle) as RecipeCount
    from Recipe_Classes rc
	inner join Recipes r on rc.RecipeClassID = r.RecipeClassID
	group by rc.RecipeClassDescription
)
select * from RecipeClassCount
where RecipeCount = (select min(RecipeCount) from RecipeClassCount);
