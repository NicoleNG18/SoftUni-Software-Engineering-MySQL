CREATE TABLE `addresses`
(
    `id`   INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `clients`
(
    `id`           INT AUTO_INCREMENT PRIMARY KEY,
    `full_name`    VARCHAR(50) NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL
);

CREATE TABLE `drivers`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name`  VARCHAR(30) NOT NULL,
    `age`        INT         NOT NULL,
    `rating`     FLOAT DEFAULT 5.5
);

CREATE TABLE `categories`
(
    `id`   INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL
);

CREATE TABLE `cars`
(
    `id`          INT AUTO_INCREMENT PRIMARY KEY,
    `make`        VARCHAR(20) NOT NULL,
    `model`       VARCHAR(20),
    `year`        INT         NOT NULL DEFAULT 0,
    `mileage`     INT                  DEFAULT 0,
    `condition`   CHAR(1)     NOT NULL,
    `category_id` INT         NOT NULL,
    CONSTRAINT fk_cars_cat FOREIGN KEY (`category_id`)
        REFERENCES `categories` (`id`)
);

CREATE TABLE `cars_drivers`
(
    `car_id`    INT NOT NULL,
    `driver_id` INT NOT NULL,
    primary KEY (`car_id`, `driver_id`),
    CONSTRAINT fk_cd_c FOREIGN KEY (`car_id`)
        REFERENCES `cars` (`id`),
    CONSTRAINT fk_cd_d FOREIGN KEY (`driver_id`)
        REFERENCES `drivers` (`id`)
);


CREATE TABLE `courses`
(
    `id`              INT AUTO_INCREMENT PRIMARY KEY,
    `from_address_id` INT      NOT NULL,
    `start`           DATETIME NOT NULL,
    `bill`            DECIMAL(10, 2) DEFAULT 10,
    `car_id`          INT      NOT NULL,
    `client_id`       INT      NOT NULL,
    constraint fk_c_car
        foreign key (`car_id`)
            references `cars` (`id`),
    constraint fk_c_address
        foreign key (`from_address_id`)
            references `addresses` (`id`),
    constraint fk_c_client
        foreign key (`client_id`)
            references `clients` (`id`)
);

insert into `clients` (`full_name`, `phone_number`)
select concat(d.`first_name`, " ", d.`last_name`) as `full_name`,
       concat("(088) 9999", (d.`id` * 2))         as `phone_number`
from `drivers` as d
where d.`id` between 10 and 20;

update `cars`
set `condition`='C'
where (`mileage` >= 800000 or `mileage` is null)
  and `year` <= 2010
  and `make` not like 'Mercedes-Benz';
