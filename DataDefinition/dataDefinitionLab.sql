CREATE TABLE `employees`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name`  VARCHAR(100) NOT NULL
);

CREATE TABLE `categories`
(
    `id`   INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `products`
(
    `id`          INT AUTO_INCREMENT PRIMARY KEY,
    `name`        VARCHAR(100) NOT NULL,
    `category_id` INT          NOT NULL
);

INSERT INTO `employees`(`first_name`, `last_name`)
VALUES ("Pesho", "Peshov"),
       ("Gosho", "Goshov"),
       ("Zlatko", "Zlatkov");

ALTER TABLE `employees`
    ADD COLUMN `middle_name` VARCHAR(100);

ALTER TABLE `products`
    ADD CONSTRAINT fk_products_categories
        FOREIGN KEY `products` (`category_id`)
            REFERENCES `categories` (`id`);

ALTER TABLE `employees`
    MODIFY COLUMN `middle_name` VARCHAR(100);