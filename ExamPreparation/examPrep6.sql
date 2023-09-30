insert into `actors` (`first_name`, `last_name`, `birthdate`, `height`, `awards`, `country_id`)
SELECT (REVERSE(a.`first_name`)),
       (REVERSE(a.`last_name`)),
       (DATE(a.`birthdate` - 2)),
       (a.`height` + 10),
       (a.`country_id`),
       (3)
FROM `actors` a
WHERE a.`id` <= 10;

UPDATE `movies_additional_info`
SET `runtime` = `runtime` - 10
WHERE `id` >= 15
  AND `id` <= 25;


DELETE c, m
FROM `countries` AS c
         LEFT JOIN `movies` AS m
                   ON c.`id` = m.`country_id`
WHERE m.`country_id` IS NULL;