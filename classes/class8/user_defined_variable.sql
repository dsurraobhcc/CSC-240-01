use online_orders;

-- user-defined variable
select @clothing_id := category_id from item_category
where category_name = 'Clothing';

select @clothing_id;

select * from item_category
where category_id = @clothing_id;