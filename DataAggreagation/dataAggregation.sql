SELECT `department_id`, COUNT(`id`) AS `Number of employees`
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id`, `Number of employees`;

SELECT `department_id`, ROUND(AVG(`salary`), 2)
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id`;

SELECT `department_id`,
       MIN(`salary`) AS `Min Salary`
FROM `employees`
GROUP BY `department_id`
HAVING `Min Salary` > 800;

SELECT COUNT(`id`) AS `Count`
FROM `products`
WHERE `category_id` = 2
  AND `price` > 8
GROUP BY `category_id`;

SELECT `category_id`,
       ROUND(AVG(`price`), 2) AS `Average`,
       ROUND(MIN(`price`), 2) AS `Cheapest product`,
       ROUND(MAX(`price`), 2) AS `Most Expensive Product`
FROM `products`
GROUP BY `category_id`;
