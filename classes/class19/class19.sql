create schema class19;
use class19;

create table customer (
	`name` varchar(20),
    `password_hash` varchar(100),
    `password_salt` varchar(100),
    `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

insert into customer (name) values ('May'), ('June');

update customer set name = 'July' where name = 'June';

select * from customer;
