drop schema if exists trigger_test;
create schema trigger_test;
use trigger_test;

CREATE TABLE account (acct_num INT, amount DECIMAL(10,2));

CREATE TRIGGER ins_sum BEFORE INSERT ON account
       FOR EACH ROW SET @sum = @sum + NEW.amount;
       
create table aggregates (account_total decimal(10, 2));

delimiter //
CREATE TRIGGER ins_sum_2 BEFORE INSERT ON account
       FOR EACH ROW
       begin
	      if exists (select * from aggregates) then
			update aggregates set account_total = account_total + NEW.amount;
          else
			insert into aggregates values (NEW.amount);
          end if;
       end//
delimiter ;

SET @sum = 0;
INSERT INTO account VALUES (137,14.98),
	(141,1937.50),
    (97,-100.00);
SELECT @sum AS 'Total amount inserted';

select * from account;
select * from aggregates;
