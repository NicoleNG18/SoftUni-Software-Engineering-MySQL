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