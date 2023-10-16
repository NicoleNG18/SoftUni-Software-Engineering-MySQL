insert into `games` (`name`, `rating`, `budget`, `team_id`)
select reverse(substring(lower(t.`name`), 2)), t.`id`, (t.`leader_id` * 1000), t.`id`
from `teams` as t
where t.`id` between 1 and 9;


update `employees` as e
set e.`salary`=e.`salary` + 1000
where e.`age` < 40
  and e.`salary` < 5000;


delete g
from `games` as g
         left join `games_categories` as gc
                   on g.`id` = gc.`game_id`
         left join `categories` as c
                   on gc.`category_id` = c.`id`
where g.`release_date` is null
  and gc.`category_id` is null;

SELECT `first_name`,
       `last_name`,
       `age`,
       `salary`,
       `happiness_level`
FROM `employees`
ORDER BY `salary`, `id`;

SELECT t.`name`              AS `team_name`,
       a.`name`              AS `address_name`,
       CHAR_LENGTH(a.`name`) AS `count_of_characters`
FROM `teams` AS t
         JOIN
     `offices` AS o ON t.`office_id` = o.`id`
         JOIN
     `addresses` AS a ON o.`address_id` = a.`id`
where o.`website` is not null
ORDER BY t.`name`, a.`name`;

SELECT c.`name`,
       COUNT(g.`id`)             AS `games_count`,
       ROUND(AVG(g.`budget`), 2) AS `avg_budget`,
       MAX(g.`rating`)           AS `max_rating`
FROM categories AS c
         JOIN
     `games_categories` AS gc ON c.`id` = gc.`category_id`
         JOIN
     `games` AS g ON gc.`game_id` = g.`id`
GROUP BY c.`name`
HAVING `max_rating` >= 9.5
ORDER BY `games_count` DESC, c.`name`;


SELECT g.`name`,
       g.`release_date`,
       CONCAT(SUBSTRING(g.`description`, 1, 10), '...') AS `summary`,
       (CASE
            WHEN
                        MONTH(g.`release_date`) = 01
                    OR MONTH(g.`release_date`) = 02
                    OR MONTH(g.`release_date`) = 03
                THEN
                'Q1'
            WHEN
                        MONTH(g.`release_date`) = 04
                    OR MONTH(g.`release_date`) = 05
                    OR MONTH(g.`release_date`) = 06
                THEN
                'Q2'
            WHEN
                        MONTH(g.`release_date`) = 07
                    OR MONTH(g.`release_date`) = 08
                    OR MONTH(g.`release_date`) = 09
                THEN
                'Q3'
            WHEN
                        MONTH(g.`release_date`) = 10
                    OR MONTH(g.`release_date`) = 11
                    OR MONTH(g.`release_date`) = 12
                THEN
                'Q4'
           END)                                         AS `quarter`,
       t.`name`
FROM `games` AS g
         JOIN
     `teams` AS t ON t.`id` = g.`team_id`
WHERE MOD(MONTH(g.`release_date`), 2) = 0
  AND YEAR(g.`release_date`) = 2022
  AND g.`name` LIKE ('%2')
ORDER BY `quarter`;

SELECT g.`name`,
       (CASE
            WHEN g.`budget` < 50000 THEN 'Normal budget'
            WHEN g.`budget` >= 50000 THEN 'Insufficient budget'
           END) AS `budget_level`,
       t.`name`,
       a.`name`
FROM `games` AS g
         LEFT JOIN
     `games_categories` AS gc ON g.`id` = gc.`game_id`
         JOIN
     `teams` AS t ON t.`id` = g.`team_id`
         JOIN
     `offices` AS o ON t.`office_id` = o.`id`
         JOIN
     `addresses` AS a ON a.`id` = o.`address_id`
WHERE g.`release_date` IS NULL
  AND gc.`category_id` IS NULL
ORDER BY g.`name`;