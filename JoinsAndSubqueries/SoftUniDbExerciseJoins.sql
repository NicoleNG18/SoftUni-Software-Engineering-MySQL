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

SELECT e.`employee_id`,
       e.`first_name`,
       e.`salary`,
       d.`name` AS `department_name`
FROM `employees` AS e
         JOIN
     `departments` AS d ON e.`department_id` = d.`department_id`
WHERE e.`salary` > 15000
ORDER BY d.`department_id` DESC
LIMIT 5;

SELECT e.`employee_id`,
       e.`first_name`
FROM `employees` AS e
         LEFT JOIN
     `employees_projects` AS p ON e.`employee_id` = p.`employee_id`
WHERE p.`project_id` IS NULL
ORDER BY e.`employee_id` DESC
LIMIT 3;

SELECT e.`first_name`,
       e.`last_name`,
       e.`hire_date`,
       d.`name` AS `dept_name`
FROM `employees` AS e
         JOIN
     `departments` AS d ON e.`department_id` = d.`department_id`
WHERE d.`name` = 'Sales'
   OR d.`name` = 'Finance'
    AND `hire_date` > '1999-01-01'
ORDER BY e.`hire_date`;

SELECT e.`employee_id`,
       e.`first_name`,
       p.`name` AS `project_name`
FROM `employees` AS e
         JOIN
     `employees_projects` AS ep ON e.`employee_id` = ep.`employee_id`
         JOIN
     `projects` AS p ON ep.`project_id` = p.`project_id`
WHERE date(p.`start_date`) > '2002-08-13'
  AND p.`end_date` IS NULL
ORDER BY e.`first_name`, p.`name`
LIMIT 5;

SELECT e.`employee_id`,
       e.`first_name`,
       IF(YEAR(p.`start_date`) >= 2005, NULL, p.`name`) AS 'project_name'
FROM `employees` AS e
         JOIN
     `employees_projects` AS ep ON e.`employee_id` = ep.`employee_id`
         JOIN
     `projects` AS p ON ep.`project_id` = p.`project_id`
WHERE e.`employee_id` = 24
ORDER BY p.`name`;
