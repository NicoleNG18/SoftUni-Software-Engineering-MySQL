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

create procedure udp_find_playmaker(min_dribble_points int, team_name varchar(45))
begin
    select concat(p.`first_name`, " ", p.`last_name`) as `full_name`,
           p.`age`,
           p.`salary`,
           sd.`dribbling`,
           sd.`speed`,
           t.`name`
    from `players` as p
             join `skills_data` as sd
                  on sd.`id` = p.`skills_data_id`
             join `teams` as t
                  on p.`team_id` = t.`id`
    where t.`name` = team_name
      and sd.`dribbling` >
          min_dribble_points
      and sd.`speed` > (select avg(`speed`) from `skills_data`)
    order by sd.`speed` desc
    limit 1;
end$$


CALL udp_find_playmaker(20, 'Skyble')$$




