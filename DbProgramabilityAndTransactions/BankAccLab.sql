delimiter $$
create procedure usp_get_holders_full_name()
begin
    select concat(`first_name`, " ", `last_name`) as `full_name`
    from `account_holders` as ah
    order by `full_name`, ah.`id`;
end$$

call usp_get_holders_full_name()$$

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(money decimal(12, 4))
BEGIN
    SELECT h.`first_name`, h.`last_name`
    FROM `account_holders` as h
             LEFT JOIN `accounts` as a ON h.`id` = a.`account_holder_id`
    GROUP BY h.`first_name`, h.`last_name`
    HAVING SUM(a.`balance`) > `money`
    ORDER BY h.`id`;
END$$

call usp_get_holders_with_balance_higher_than(7000)$$

create function ufn_calculate_future_value(initial_sum decimal(19, 4), yearly_interest_rate decimal(19, 4),
                                           number_of_years int)
    returns decimal(39, 4)
    deterministic
begin
    declare result decimal(39, 4);
    set result := initial_sum * pow((1 + yearly_interest_rate), number_of_years);
    return result;
end$$

select ufn_calculate_future_value(1000, 0.5, 5)$$



create procedure usp_calculate_future_value_for_account(id int, interest_rate decimal(19, 4))
begin
    select a.`id`,
           ah.`first_name`,
           ah.`last_name`,
           a.`balance`,
           ufn_calculate_future_value(a.`balance`, interest_rate, 5) as `balance_in_5_years`
    from `account_holders` as ah
             join `accounts` as a
                  on ah.`id` = a.`account_holder_id`
    where a.`id` = id;
end$$

call usp_calculate_future_value_for_account(1, 0.1)$$

create procedure usp_deposit_money(account_id int, money_amount decimal(19, 4))
begin
    start transaction;
    if money_amount < 0
    then
        rollback;
    else
        update `accounts`
        set `balance`=`balance` + money_amount
        where `id` = account_id;
    end if;
end$$

call usp_deposit_money(1, 10)$$

create procedure usp_withdraw_money(account_id int, money_amount decimal(19, 4))
begin
    start transaction;
    if (money_amount <= 0 OR (SELECT `balance` FROM accounts AS a WHERE a.`id` = id) < money_amount)
    then
        rollback;
    else
        update `accounts`
        set `balance`=`balance` - money_amount
        where `id` = account_id;
        commit;
    end if;
end$$


create procedure usp_transfer_money(from_account_id int, to_account_id int, amount decimal(19, 4))
begin
    start transaction;
    if
                from_account_id = to_account_id or
                amount <= 0 or
                (amount > (select `balance` from `accounts` where `id` = from_account_id) or
                 (select count(`id`) from `accounts` where `id` = from_account_id) <> 1 or
                 (select count(`id`) from `accounts` where `id` = to_account_id) <> 1)
    then
        rollback;
    else
        update `accounts`
        set `balance`=`balance` - amount
        where `id` = from_account_id;
        update `accounts`
        set `balance`=`balance` + amount
        where `id` = to_account_id;
        commit;
    end if;
end$$

create table `logs`
(
    `log_id`     int primary key auto_increment,
    `account_id` int            not null,
    `old_sum`    decimal(19, 4) not null,
    `new_sum`    decimal(19, 4) not null
)
$$

create trigger add_log
    after update
    on `accounts`
    for each row
begin
    insert into `logs` (`account_id`, `old_sum`, `new_sum`)
    values (old.`id`, old.`balance`, new.`balance`);
end$$



create table `notification_emails`
(
    `id`        int primary key auto_increment,
    `recipient` int not null,
    `subject`   text,
    `body`      text
)$$

create trigger add_email
    after insert
    on `logs`
    for each row
begin
    insert into `notification_emails` (`recipient`, `subject`, `body`)
    values (new.`account_id`,
            concat("Balance change for account: ", `account_id`),
            concat("On ", now(), " your balance was changed from ", new.`old_sum`, " to ", new.`new_sum`, "."));
end$$

