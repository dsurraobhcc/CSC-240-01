use online_orders;

call p_add_customer('Claus', 'Santa', 'santa@northpole.com', @o_customer_id);

select @o_customer_id;
