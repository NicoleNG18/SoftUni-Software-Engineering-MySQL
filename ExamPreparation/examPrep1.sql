create database `football_scout`;

use `football_scout`;

CREATE TABLE `countries` (
                             `id` INT AUTO_INCREMENT PRIMARY KEY,
                             `name` VARCHAR(45) NOT NULL
);

CREATE TABLE `coaches` (
                           `id` INT AUTO_INCREMENT PRIMARY KEY,
                           `first_name` VARCHAR(10) NOT NULL,
                           `last_name` VARCHAR(20) NOT NULL,
                           `salary` DECIMAL(10 , 2 ) NOT NULL DEFAULT 0,
                           `coach_level` INT NOT NULL DEFAULT 0
);

CREATE TABLE `skills_data` (
                               `id` INT AUTO_INCREMENT PRIMARY KEY,
                               `dribbling` INT DEFAULT 0,
                               `pace` INT DEFAULT 0,
                               `passing` INT DEFAULT 0,
                               `shooting` INT DEFAULT 0,
                               `speed` INT DEFAULT 0,
                               `strength` INT DEFAULT 0
);

CREATE TABLE `towns` (
                         `id` INT AUTO_INCREMENT PRIMARY KEY,
                         `name` VARCHAR(45) NOT NULL,
                         `country_id` INT NOT NULL,
                         CONSTRAINT fk FOREIGN KEY (`country_id`)
                             REFERENCES `countries` (`id`)
);
