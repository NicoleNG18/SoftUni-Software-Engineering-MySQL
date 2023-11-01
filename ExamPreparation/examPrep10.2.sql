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

select m.`title`,
       (case
            when ma.`rating` <= 4 then "poor"
            when ma.`rating` > 4 and ma.`rating` <= 7 then "good"
            when ma.`rating` > 7 then "excellent"
           end) as `rating`,
       (case
            when ma.`has_subtitles` = 0 then "-"
            when ma.`has_subtitles` = 1 then "english"
           end) as `subtitles`,
       ma.`budget`
from `movies_additional_info` ma
         join `movies` as m
              on m.`movie_info_id` = ma.`id`
order by `budget` desc;

delimiter $$
create function udf_actor_history_movies_count(name VARCHAR(50))
    returns int
    deterministic
begin
    declare history_movies int;
    set history_movies :=
            (select count(a.`id`)
             from `actors` as a
                      join `movies_actors` as ma
                           on a.`id` = ma.`actor_id`
                      join `genres_movies` as gm
                           on ma.`movie_id` = gm.`movie_id`
             where gm.`genre_id` = 12
               and concat(a.`first_name`, " ", a.`last_name`) like name);
    return history_movies;
end$$


SELECT udf_actor_history_movies_count('Stephan Lundberg') AS 'history_movies';

create procedure udp_award_movie(movie_title varchar(50))
begin
    update `actors` as a
        join `movies_actors` as ma
        on a.`id` = ma.`actor_id`
        join `movies` as m
        on ma.`movie_id` = m.`id`
    set a.`awards`=a.`awards` + 1
    where m.`title` = movie_title;
end$$

