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

