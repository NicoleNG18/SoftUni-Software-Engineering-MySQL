CREATE TABLE `categories`
(
    `id`   INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL
);

CREATE TABLE `employees`
(
    `id`              INT AUTO_INCREMENT PRIMARY KEY,
    `first_name`      VARCHAR(30)    NOT NULL,
    `last_name`       VARCHAR(30)    NOT NULL,
    `age`             INT            NOT NULL,
    `salary`          DECIMAL(10, 2) NOT NULL,
    `job_title`       VARCHAR(20)    NOT NULL,
    `happiness_level` CHAR(1)        NOT NULL
);

CREATE TABLE `addresses`
(
    `id`   INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `offices`
(
    `id`                 INT AUTO_INCREMENT PRIMARY KEY,
    `workspace_capacity` INT NOT NULL,
    `website`            VARCHAR(50),
    `address_id`         INT NOT NULL,
    CONSTRAINT fk_of_ad FOREIGN KEY (`address_id`)
        REFERENCES `addresses` (`id`)
);
