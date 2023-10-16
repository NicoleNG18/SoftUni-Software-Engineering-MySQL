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