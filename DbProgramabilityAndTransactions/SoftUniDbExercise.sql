delimiter $$
create procedure usp_get_employees_salary_above_35000()
begin
    (select `first_name`, `last_name`
     from `employees`
     where `salary` > 35000
     order by `first_name`, `last_name`);
end$$

call usp_get_employees_salary_above_35000()$$



create procedure usp_get_employees_salary_above(salary_number double)
begin
    (select `first_name`, `last_name`
     from `employees`
     where `salary` >= salary_number
     order by `first_name`, `last_name`);
end$$


call usp_get_employees_salary_above(45000)$$



CREATE PROCEDURE usp_get_towns_starting_with(letter varchar(50))
BEGIN
    SELECT `name` AS `town_name`
    FROM `towns`
    WHERE `name` LIKE concat(letter, '%')
    ORDER BY `name`;
END$$

CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(50))
BEGIN
    SELECT `first_name`, `last_name`
    FROM `employees` AS e
             join `addresses` as a
                  on e.`address_id` = a.`address_id`
             JOIN `towns` AS t
                  ON a.`town_id` = t.`town_id`
    WHERE t.`name` = town_name
    ORDER BY e.`first_name`, e.`last_name`, e.`employee_id`;
END$$

call usp_get_employees_from_town("Sofia")$$

use `soft_uni`$$


create function ufn_get_salary_level(employee_salary double)
    returns varchar(8)
    deterministic
begin
    declare salary_Level varchar(8);
    if employee_salary < 30000 then
        set salary_Level := "Low";
    elseif employee_salary between 30000 and 50000 then
        set salary_Level := "Average";
    else
        set salary_Level := "High";
    end if;
    return salary_Level;
end$$



create procedure usp_get_employees_by_salary_level(salary_level varchar(8))
begin
    select `first_name`, `last_name`
    from `employees`
    where ufn_get_salary_level(`salary`) like salary_level
    order by `first_name` desc, `last_name` desc;
end$$


call usp_get_employees_by_salary_level("High");


create function ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
    returns int
    deterministic
begin
    RETURN word REGEXP (CONCAT('^[', set_of_letters, ']+$'));
end$$