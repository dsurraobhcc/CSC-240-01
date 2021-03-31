use world;

drop table if exists copy_city;
create table copy_city as select * from city;

select * from copy_city;

-- delete all rows
delete from copy_city;
truncate table copy_city; -- 0 row(s) affected

-- delete all cities in India
select * from copy_city
where CountryCode = 'IND'; -- 341 rows

-- count: 4080 before delete, 3739 after delete
select count(ID) from copy_city;

delete from copy_city
where CountryCode = 'IND'; -- 341 row(s) affected

-- delete all cities in Asia
select * from copy_city;

-- countries in Asia
select Code from country
where Continent = 'Asia';

-- select all countries in Asia
select * from copy_city
where CountryCode in (
	select Code from country
	where Continent = 'Asia'
);

delete from copy_city
where CountryCode in (
	select Code from country
	where Continent = 'Asia'
); -- 1425 rows affected



