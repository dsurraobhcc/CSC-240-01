/*
Get the number of addresses in each district from the address table.

Hint: use the GROUP BY clause
*/

select district, count(*) as Total from address
group by district;

select count(address_id), district from address
group by district;
