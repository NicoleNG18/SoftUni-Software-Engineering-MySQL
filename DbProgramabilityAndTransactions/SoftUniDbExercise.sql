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
