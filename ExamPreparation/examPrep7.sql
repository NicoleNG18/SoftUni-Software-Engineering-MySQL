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

CREATE TABLE `orders_products`
(
    `order_id`   INT,
    `product_id` INT,
    KEY (`order_id`, `product_id`),
    CONSTRAINT fk_op_o FOREIGN KEY (`order_id`)
        REFERENCES `orders` (`id`),
    CONSTRAINT fk_op_p FOREIGN KEY (`product_id`)
        REFERENCES `products` (`id`)
);



CREATE TABLE `clients`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name`  VARCHAR(50) NOT NULL,
    `birthdate`  DATE        NOT NULL,
    `card`       VARCHAR(50),
    `review`     TEXT
);



CREATE TABLE `orders_clients`
(
    `order_id`  INT,
    `client_id` INT,
    KEY (`order_id`, `client_id`),
    CONSTRAINT fk_oc_o FOREIGN KEY (`order_id`)
        REFERENCES `orders` (`id`),
    CONSTRAINT fk_oc_c FOREIGN KEY (`client_id`)
        REFERENCES `clients` (`id`)
);

