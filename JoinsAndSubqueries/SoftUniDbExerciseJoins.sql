SELECT e.`employee_id`,
       e.`job_title`,
       a.`address_id`,
       a.`address_text`
FROM `employees` AS e
         JOIN
     `addresses` AS a ON e.`address_id` = a.`address_id`
ORDER BY `address_id`
LIMIT 5;


SELECT e.`first_name`,
       e.`last_name`,
       t.`name` AS `town`,
       a.`address_text`
FROM `employees` AS e
         JOIN
     `addresses` AS a ON e.`address_id` = a.`address_id`
         JOIN
     `towns` AS t ON a.`town_id` = t.`town_id`
ORDER BY e.`first_name`, e.`last_name`
LIMIT 5;

SELECT e.`employee_id`,
       e.`first_name`,
       e.`last_name`,
       d.`name` AS `department_name`
FROM `employees` AS e
         JOIN
     `departments` AS d
     ON e.`department_id` = d.`department_id`
where d.`name` = "Sales"
ORDER BY e.`employee_id` DESC;