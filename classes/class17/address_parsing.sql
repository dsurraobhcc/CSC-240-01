drop schema if exists address_schema;
create schema address_schema;
use address_schema;

create table address (
	full_address varchar(500)
);

insert into address values 
	('123 ABC Lane, Boston, MA 02114'),
    ('10 Main Street, Somerville, MA'),
    ('10 Wall Street,New York, NY');
    
select * from address;

-- use ALTER, SUBSTRING_INDEX(), UPDATE to modify the address table 
-- to have columns: address_line_1, city, state, zip

-- address line 1
select substring_index(full_address, ',', 1) from address;

-- city
select 
	trim(
		substring_index(
			substring_index(full_address, ',', 2), 
			',', 
			-1
		)
	)
from address;

-- create columns address_line_1 and city in the table
-- and assign values to them based on the above substring_index() code
alter table address add (address_line_1 varchar (100));
alter table address add (city varchar (20));
select * from address;
update address set address_line_1 = substring_index(full_address, ',', 1);
select * from address;


