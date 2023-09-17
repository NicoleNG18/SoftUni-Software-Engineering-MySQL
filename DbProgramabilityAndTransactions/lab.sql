delimiter $$
create function ufn_count_employees_by_town(town_name varchar(50))
    returns int
    deterministic
begin
    declare count_employees int;
    set count_employees := (select count(*)
                            from `employees` as e
                                     join `addresses` as a
                                          on e.`address_id` = a.`address_id`
                                     join `towns` as t
                                          on a.`town_id` = t.`town_id`
                            where t.`name` = town_name);
    return count_employees;
end$$

SELECT UFN_COUNT_EMPLOYEES_BY_TOWN('Sofia') AS `count`;



$$
create procedure usp_raise_salaries(department_name varchar(50))
begin
    update `employees` as e
        join `departments` as d
        on e.`department_id` = d.`department_id`
    set `salary` = `salary` * 1.05
    where d.`name` = department_name;
end$$

call usp_raise_salaries('Finance');

$$
