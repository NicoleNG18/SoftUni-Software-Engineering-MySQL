delimiter $$


create function udf_stadium_players_count(stadium_name VARCHAR(30))
    returns int
    deterministic
begin
    return (select count(p.`id`)
            from `stadiums` as s
                     left join `teams` as t
                               on t.`stadium_id` = s.`id`
                     left join `players` as p
                               on p.`team_id` = t.`id`
            where s.`name` = stadium_name);
end$$

SELECT udf_stadium_players_count('Jaxworks') as `count`$$