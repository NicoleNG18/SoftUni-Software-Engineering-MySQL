SELECT `id`,
       `name`,
       `continent`,
       `currency`
FROM `countries`
ORDER BY `currency` DESC, `id`;


SELECT ma.`id`,
       m.`title`,
       ma.`runtime`,
       ma.`budget`,
       ma.`release_date`
FROM `movies_additional_info` AS ma
         JOIN
     `movies` AS m ON m.`movie_info_id` = ma.`id`
WHERE YEAR(ma.`release_date`) >= 1996
  AND YEAR(ma.`release_date`) <= 1999
ORDER BY ma.`runtime`, ma.`id`
LIMIT 20;

SELECT CONCAT(a.`first_name`, ' ', a.`last_name`) AS `full_name`,
       CONCAT(REVERSE(a.`last_name`),
              CHAR_LENGTH(`last_name`),
              '@cast.com')                        AS `email`,
       2022 - YEAR(a.`birthdate`)                 AS `age`,
       a.`height`
FROM `actors` AS a
         LEFT JOIN
     `movies_actors` AS ma ON a.`id` = ma.`actor_id`
WHERE ma.`movie_id` IS NULL
ORDER BY `height`;

SELECT c.`name`,
       COUNT(m.`id`) AS `movies_count`
FROM `countries` AS c
         JOIN
     `movies` AS m ON m.`country_id` = c.`id`
GROUP BY c.`id`
having `movies_count` >= 7
ORDER BY c.`name` DESC;