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

create procedure usp_raise_salary_by_id(id int)
begin
    update `employees` as e
    set `salary`=`salary` * 1.05
    where e.`employee_id` = id;
end $$

call usp_raise_salary_by_id(17);
$$



CREATE TABLE `deleted_employees`
(
    `employee_id`   INT         not null auto_increment,
    `first_name`    VARCHAR(50) not null,
    `last_name`     VARCHAR(50) not null,
    `middle_name`   VARCHAR(50) not null,
    `job_title`     VARCHAR(50) not null,
    `department_id` INT         NOT NULL,
    `salary`        DECIMAL(19, 4),
    primary key (`employee_id`)
);
$$

create trigger tr_deleted_employees
    after delete
    on `employees`
    for each row
begin
    insert into `deleted_employees` (`first_name`, `last_name`, `middle_name`, `job_title`, `department_id`, `salary`)
    values (old.`first_name`, old.`last_name`, old.`middle_name`, old.`job_title`,
            old.`department_id`, old.`salary`);
end

$$


