use online_orders;

drop procedure if exists p_add_customer;

use delimiter //

create procedure p_add_customer(
	IN i_last_name varchar(25),
  IN i_first_name varchar(25),
  IN i_email varchar(100),
  OUT o_customer_id int
)
begin
	declare v_customer_id int;
    
    -- check if customer exists
    select customer_id into v_customer_id from customer
    where email = i_email;
    
    if v_customer_id is null then
		  -- new customer
		  insert into customer (last_name, first_name, email)
        values (i_last_name, i_first_name, i_email);
        
      set o_customer_id = last_insert_id();
	else
		-- existing customer
		set o_customer_id = v_customer_id;
    end if;

end//

use delimiter ;