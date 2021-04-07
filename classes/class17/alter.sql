drop schema if exists online_orders_alter;
create schema online_orders_alter;
use online_orders_alter;

create table customer (
	customer_id mediumint,
    last_name varchar(25),
    first_name varchar(25),
    middle_initial char(1)
);

-- add an email field
alter table customer add column email varchar(100) not null;

-- add primary key constraint
alter table customer modify column customer_id mediumint auto_increment,
	add primary key (customer_id);
    
-- alternative for primary key definition
-- alter table customer add constraint primary key (customer_id);

-- insert some data
insert into customer (last_name, first_name, middle_initial, email)
values ('Mohan', 'Ram', 'A', 'rm@test.com'),
	('Jones', 'Sue', null, 'sj@test.com'),
    ('Ko', 'Marie', 'H', 'mko@test.com'),
    ('White', 'Barry', 'M', 'bw@testing.com'),
    ('Monster', 'Cookie', null, 'cm@sesamestreet.com');
    
select * from customer;

-- we want to enforce not null constraints on first, last name
-- we also want to store middle names, not just initials
alter table customer modify column last_name varchar(25) not null;
alter table customer modify column first_name varchar(25) not null;

-- add a middle name column
alter table customer add column middle_name varchar(25);

-- alter table customer modify column middle_initial char(1) not null;
-- Error Code: 1138. Invalid use of NULL value

-- copy middle initial values to middle name
update customer set middle_name = middle_initial;
select * from customer;

-- drop middle initial column, we don't need it anymore
alter table customer drop column middle_initial;
select * from customer;

-- reorder columns so that middle_name is after first_name
-- in the resultset
alter table customer modify middle_name varchar(25) 
	after first_name;

select * from customer;

-- verify updates
describe customer;

