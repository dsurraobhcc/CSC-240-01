use transactions_tests;

drop table if exists pharmacy;

create table pharmacy (
	id int primary key auto_increment,
    pharmacy_name varchar(25)
);

insert into pharmacy (pharmacy_name) values ('CVS');
insert into pharmacy (pharmacy_name) values ('Walgreens');

select * from pharmacy;

-- Create a named savepoint 'mysavepoint1'
savepoint mysavepoint1;

insert into pharmacy (pharmacy_name) values ('Rite-Aid');
insert into pharmacy (pharmacy_name) values ('BMC');
rollback to mysavepoint1;

-- remove the savepoint
release savepoint mysavepoint1;

-- Only CVS and Walgreens are returned
select * from pharmacy;

insert into pharmacy (pharmacy_name) values ('XYZ');
rollback to mysavepoint1;
-- Error Code: 1305. SAVEPOINT mysavepoint1 does not exist
