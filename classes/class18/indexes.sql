/*
NOTE: This program may run for more than 30 seconds.

Before executing it, modify this setting to, say, 300 seconds:

MySQLWorkbench > Preferences > SQL Editor 
	> DBMS connection read timeout interval (in seconds)
*/

drop schema if exists index_tests;
create schema index_tests;
use index_tests;

create table large_table_1 (
	id int primary key,
    code varchar(20),
    index `idx_code` (`code`)
);

select * from large_table_1;

-- create a stored procedure to populate the above table

delimiter //

create procedure populate_large_table()
begin
	set @count = 0;
    
    while @count <= 1000000 do
		set @count = @count + 1;
        insert into large_table_1 (id, code)
		values (@count, concat('code', @count));
    end while;
end;
//

delimiter ;

-- call the procedure to populate the table with a million rows
-- this may take a few minutes to run
call populate_large_table();

-- Error Code: 2013. Lost connection to MySQL server during query
-- 300.012 sec

select count(*) from large_table_1;
-- Error Code: 1046. No database selected Select the default DB to 
-- be used by double-clicking its name in the SCHEMAS list in the sidebar.

select count(*) from large_table_1;
select * from large_table_1 order by id limit 10;

-- testing the index
select * from large_table_1 where code = 'code9999';
-- duration/fetch time: 0.00036 sec / 0.0000072 sec

-- drop the index
alter table large_table_1 drop index `idx_code`;

select * from large_table_1 where code = 'code9999';
-- duration/fetch time: 0.321 sec / 0.0000081 sec

-- performance difference: 0.00036 sec vs 0.321 sec

-- simplistic projection for a billion rows: 0.36 secs with index vs 321 sec without
-- NOTICE THE DIFFERENCE IN PERFORMANCE AFTER THE INDEX IS DROPPED!!!