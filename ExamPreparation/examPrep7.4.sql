delimiter $$
create function udf_client_bill(full_name VARCHAR(50))
    returns decimal(19, 2)
    deterministic
begin
    declare bill decimal(19, 2);
    set bill := (select sum(p.`price`)
                 from `clients` as c
                          join `orders_clients` as oc
                               on oc.`client_id` = c.`id`
                          join `orders` as o
                               on o.`id` = oc.`order_id`
                          join `orders_products` as op
                               on op.`order_id` = o.`id`
                          join `products` as p
                               on p.`id` = op.`product_id`
                 where concat(c.`first_name`, " ", c.`last_name`) = full_name);
    return bill;
end$$

SELECT c.first_name, c.last_name, udf_client_bill('Silvio Blyth') as 'bill'
FROM clients c
WHERE c.first_name = 'Silvio'
  AND c.last_name = 'Blyth'$$


delimiter $$
create procedure udp_happy_hour(type varchar(50))
begin
    update `products` as p
    set p.`price`=0.8 * p.`price`
    where p.`type` = type
      and p.`price` >= 10;
end$$

CALL udp_happy_hour('Cognac')$$
