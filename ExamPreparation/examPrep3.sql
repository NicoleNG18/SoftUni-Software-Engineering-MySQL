insert into coaches(`first_name`, `last_name`, `salary`, `coach_level`)
    (select `first_name`, `last_name`, `salary`, char_length(p.`first_name`) as `coach_level`
     from `players` as p
     where p.`age` >= 45);

UPDATE `coaches` AS c
SET c.`coach_level` = c.`coach_level` + 1
WHERE c.`id` IN (SELECT `coach_id`
                 FROM `players_coaches`)
  AND `first_name` LIKE ('A%');


