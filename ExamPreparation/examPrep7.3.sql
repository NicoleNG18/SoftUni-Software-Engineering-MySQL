insert into `products` (`name`, `type`, `price`)
select concat(w.`last_name`, " specialty") as `name`, "Cocktail" as `type`, ceiling(0.01 * w.`salary`) as `price`
from `waiters` as w
where w.`id` > 6;

UPDATE `orders`
SET `table_id` = `table_id` - 1
WHERE `id` BETWEEN 12 AND 23;

DELETE w
FROM `waiters` AS w
         LEFT JOIN
     `orders` AS o ON o.`waiter_id` = w.`id`
WHERE o.`waiter_id` IS NULL;

select o.`table_id`,
       t.`capacity`,
       count(c.`id`) as `count_clients`,
       (
           case
               when t.`capacity` > count(o.`table_id`) then "Free seats"
               when t.`capacity` = count(o.`table_id`) then "Full"
               when t.`capacity` < count(o.`table_id`) then "Extra seats"
               end)  as `availability`
from `orders` as o
         join `tables` as t
              on o.`table_id` = t.`id`
         join `orders_clients` as oc
              on oc.`order_id` = o.`id`
         join `clients` as c
              on c.`id` = oc.`client_id`
where t.`floor` = 1
group by o.`table_id`
order by o.`table_id` desc;