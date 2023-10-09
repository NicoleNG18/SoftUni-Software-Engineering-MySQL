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

select `id`, `first_name`, `last_name`, `birthdate`, `card`, `review`
from `clients`
order by `birthdate` desc, `id` desc;

select c.`first_name`, c.`last_name`, c.`birthdate`, c.`review`
from `clients` as c
where (year(c.`birthdate`) between 1978 and 1993)
  and c.`card` is null
order by c.`last_name` desc, c.`id`
limit 5;

select concat(w.`last_name`, w.`first_name`, char_length(w.`first_name`), "Restaurant") as `username`,
       substring(1, 4, w.`email`)
                                                                                        as `password`
from `waiters` as w
where w.`salary` is not null
order by `password` desc;

select p.`id`, p.`name`, count(op.`product_id`) as `count`
from `products` as p
         join `orders_products` as op
              on op.`product_id` = p.`id`
group by p.`id`
having `count` >= 5
order by `count` desc, p.`name`;
