SELECT `department_id`,
       MIN(`salary`) AS `minimum_salary`
FROM `employees`
WHERE `department_id` IN (2, 5, 7)
  AND `hire_date` > '2000-01-01'
GROUP BY `department_id`
ORDER BY `department_id`;
-- 12

CREATE TABLE `salary_more_than` AS
SELECT *
FROM `employees`
WHERE `salary` > 30000;

DELETE
FROM `salary_more_than`
WHERE `manager_id` = 42;

UPDATE `salary_more_than`
SET `salary` = `salary` + 5000
WHERE `department_id` = 1;

SELECT `department_id`, avg(`salary`) AS `avg_salary`
FROM `salary_more_than`
GROUP BY `department_id`
ORDER BY `department_id`;

USE `soft_uni1`;

SELECT `department_id`, MAX(`salary`) AS `max_salary`
FROM `employees`
GROUP BY `department_id`
HAVING `max_salary` < 30000
    OR `max_salary` > 70000
ORDER BY `department_id`;

SELECT COUNT(`employee_id`) AS " "
FROM `employees`
WHERE `manager_id` IS NULL;

SELECT `department_id`, MAX(`salary`) AS `third_highest_salary`
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_Id`;

SELECT `department_id`, SUM(`salary`) AS `total_salary`
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id`;


SELECT DISTINCT `department_id`,
                (SELECT DISTINCT `salary`
                 FROM `employees` e
                 WHERE e.`department_id` = `employees`.`department_id`
                 ORDER BY `salary` DESC
                 LIMIT 1 OFFSET 2) AS `third_highest_salary`
FROM `employees`
HAVING `third_highest_salary` IS NOT NULL
ORDER BY `department_id`;



SELECT `first_name`, `last_name`, `department_id`
FROM `employees` f
WHERE `salary` > (SELECT avg(`salary`)
                  FROM `employees` e
                  WHERE e.department_id = f.department_id)
ORDER BY `department_id`, `employee_id`
LIMIT 10;