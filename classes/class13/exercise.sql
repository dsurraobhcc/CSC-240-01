use world;

-- get the country with the largest population
select max(Population) from country;

select name, population 
from country order by population 
desc LIMIT 1;

select name, population from country 
where population = (select max(population) from country);

-- country with min population
select name, population from country 
where population = (
	select min(population) from country
    where population != 0
);

-- List continents and the largest country population in each, use GROUP BY and MAX()
select Name, Continent, Population from country
order by Continent, Population desc;

SELECT continent, MAX(population) FROM country
GROUP BY continent;

SELECT MAX(population) FROM country
GROUP BY continent;

-- Use the above in a correlated subquery to list the countries with 
-- the largest population in their continent.
-- Get all countries that have the maximum population for their continent
select Name, Continent, Population from country c_outer
where Population = (
	SELECT MAX(population) FROM country c_inner
    where c_inner.Continent = c_outer.Continent
	GROUP BY continent
)
and Population != 0;

-- Use a correlated subquery to get countries with the largest surface area in each continent.
select Name, Continent, SurfaceArea from country c_outer
where SurfaceArea = (
    SELECT MAX(SurfaceArea) FROM country c_inner
    where c_inner.Continent = c_outer.Continent
    GROUP BY continent
);

-- spot check result: canada north america 9970610.00
select * from country order by Continent asc, SurfaceArea desc;

-- Use a correlated subquery to get countries with the smallest surface area in each continent.
select Name, Continent, SurfaceArea from country c_outer
where SurfaceArea = (
    SELECT MIN(SurfaceArea) FROM country c_inner
    where c_inner.Continent = c_outer.Continent
    GROUP BY continent
);

-- Use a correlated subquery to get countries with above average surface area in each continent.
select Name, Continent, SurfaceArea from country c_outer
where SurfaceArea > (
    SELECT AVG(SurfaceArea) FROM country c_inner
    where c_inner.Continent = c_outer.Continent
    GROUP BY continent
);

-- countries with greater than average surface area for all countries
select Name, Continent, SurfaceArea from country c_outer
where SurfaceArea > (
    SELECT AVG(SurfaceArea) FROM country 
);

