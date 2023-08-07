SELECT *
FROM `departments`
ORDER BY `department_id`;



SELECT `name`
FROM `departments`
ORDER BY `department_id`;



SELECT `first_name`,
       `last_name`,
       `salary`
FROM `employees`
ORDER BY `employee_id`;



SELECT `first_name`,
       `middle_name`,
       `last_name`
FROM `employees`
ORDER BY `employee_id`;


SELECT DISTINCT `salary`
FROM `employees`;

SELECT *
FROM `employees`
WHERE `job_title` = "Sales Representative"
ORDER BY `employee_id`;


SELECT `first_name`,
       `last_name`,
       `job_title`
FROM `employees`
WHERE `salary` >= 20000
  AND `salary` <= 30000
ORDER BY `employee_id`;

SELECT CONCAT_WS(' ',
                 `first_name`,
                 `middle_name`,
                 `last_name`) AS 'Full Name'
FROM `employees`
WHERE `salary` IN (25000, 14000, 12500, 23600);
