SELECT COUNT(`id`) AS `count`
FROM `wizzard_deposits`;

USE `gringotts`;

SELECT MAX(`magic_wand_size`) AS `longest_magic_wand`
FROM `wizzard_deposits`;

SELECT `deposit_group`,
       MAX(`magic_wand_size`) AS `longest_magic_wand`
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `longest_magic_wand`, `deposit_group`;

SELECT `deposit_group`
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY AVG(`magic_wand_size`)
LIMIT 1;

SELECT `deposit_group`, SUM(`deposit_amount`) AS `total_sum`
FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `total_sum`;

SELECT `deposit_group`, SUM(`deposit_amount`) AS `total_sum`
FROM `wizzard_deposits`
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
ORDER BY `deposit_group`;