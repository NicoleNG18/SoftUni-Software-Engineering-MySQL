CREATE TABLE `waiters`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name`  VARCHAR(50) NOT NULL,
    `email`      VARCHAR(50) NOT NULL,
    `phone`      VARCHAR(50),
    `salary`     DECIMAL(10, 2)
);

CREATE TABLE `tables`
(
    `id`       INT AUTO_INCREMENT PRIMARY KEY,
    `floor`    INT NOT NULL,
    `reserved` BOOLEAN,
    `capacity` INT NOT NULL
);


CREATE TABLE `orders`
(
    `id`           INT AUTO_INCREMENT PRIMARY KEY,
    `table_id`     INT  NOT NULL,
    `waiter_id`    INT  NOT NULL,
    `order_time`   TIME NOT NULL,
    `payed_status` BOOLEAN,
    CONSTRAINT fk_o_t FOREIGN KEY (`table_id`)
        REFERENCES `tables` (`id`),
    CONSTRAINT fk_o_w FOREIGN KEY (`waiter_id`)
        REFERENCES `waiters` (`id`)
);


CREATE TABLE `products`
(
    `id`    INT AUTO_INCREMENT PRIMARY KEY,
    `name`  VARCHAR(30)    NOT NULL UNIQUE,
    `type`  VARCHAR(30)    NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL
);
