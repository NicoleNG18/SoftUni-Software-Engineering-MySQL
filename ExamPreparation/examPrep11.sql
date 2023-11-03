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