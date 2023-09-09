SELECT e.`employee_id`,
       CONCAT(`first_name`, ' ', `last_name`) AS `full_name`,
       d.`department_id`,
       d.`name`
FROM `employees` AS e
         JOIN
     `departments` AS d ON e.`employee_id` = d.`manager_id`
ORDER BY e.`employee_id`
LIMIT 5;


SELECT t.`town_id`,
       t.`name` AS `town_name`,
       a.`address_text`
FROM `towns` AS t
         JOIN
     `addresses` AS a ON t.`town_id` = a.`town_id`
WHERE t.`town_id` IN (9, 15, 32)
ORDER BY t.`town_id`, a.`address_id`;

SELECT e.`employee_id`,
       e.`first_name`,
       e.`last_name`,
       d.`department_id`,
       e.`salary`
FROM `employees` AS e
         JOIN
     `departments` AS d ON e.`department_id` = d.`department_id`
WHERE e.`manager_id` IS NULL;

SELECT COUNT(*) AS 'count'
FROM `employees`
WHERE `salary` > (SELECT AVG(`salary`)
                  FROM `employees`);








