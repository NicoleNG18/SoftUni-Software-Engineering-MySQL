SELECT `first_name`,
       `age`,
       `salary`
FROM `players`
ORDER BY `salary` DESC;

SELECT p.`id`,
       CONCAT(p.`first_name`, ' ', p.`last_name`) AS `full_name`,
       p.`age`,
       p.`position`,
       p.`hire_date`
FROM `players` AS p
         JOIN
     `skills_data` AS sd ON p.`skills_data_id` = sd.`id`
WHERE p.`age` < 23
  AND p.`position` LIKE 'A'
  AND p.`hire_date` IS NULL
  AND sd.`strength` > 50
ORDER BY `salary`, `age`;


select t.`name`      as `team_name`,
       t.`established`,
       t.`fan_base`,
       count(p.`id`) as `players_count`
from `teams` as t
         left join `players` as p
                   on t.`id` = p.`team_id`
group by t.`id`
order by `players_count` desc, t.`fan_base` desc;

SELECT MAX(sd.`speed`) AS `max_speed`,
       tw.`name`
FROM `skills_data` AS sd
         RIGHT JOIN
     `players` AS p ON sd.`id` = p.`skills_data_id`
         RIGHT JOIN
     `teams` AS t ON t.`id` = p.`team_id`
         JOIN
     `stadiums` AS s ON s.`id` = t.`stadium_id`
         right JOIN
     `towns` AS tw ON tw.`id` = s.`town_id`
WHERE t.`name` NOT LIKE 'Devify'
GROUP BY tw.`id`
ORDER BY `max_speed` DESC, tw.`name`;


select c.`name`,
       count(p.`id`)   as `total_count_of_players`,
       sum(p.`salary`) as `total_sum_of_salaries`
from `countries` as c
         left join `towns` as tw
                   on c.`id` = tw.`country_id`
         left join `stadiums` as s
                   on tw.`id` = s.`town_id`
         left join `teams` as t
                   on s.`id` = t.`stadium_id`
         left join `players` as p
                   on t.`id` = p.`team_id`
group by c.`id`
order by `total_count_of_players` desc, c.`name`;