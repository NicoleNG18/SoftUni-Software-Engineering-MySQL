CREATE TABLE `customers`
(
    `id`            INT AUTO_INCREMENT PRIMARY KEY,
    `first_name`    VARCHAR(20) NOT NULL,
    `last_name`     VARCHAR(20) NOT NULL,
    `phone`         VARCHAR(30) NOT NULL UNIQUE,
    `address`       VARCHAR(60) NOT NULL,
    `discount_card` bit(1)      NOT NULL DEFAULT 0
);

CREATE TABLE `orders`
(
    `id`             INT AUTO_INCREMENT PRIMARY KEY,
    `order_datetime` DATETIME NOT NULL,
    `customer_id`    INT      NOT NULL,
    CONSTRAINT fk_customers_orders FOREIGN KEY (`customer_id`)
        REFERENCES `customers` (`id`)
);


CREATE TABLE `reviews`
(
    `id`           INT AUTO_INCREMENT PRIMARY KEY,
    `content`      TEXT,
    `rating`       DECIMAL(10, 2) NOT NULL,
    `picture_url`  VARCHAR(80)    NOT NULL,
    `published_at` DATETIME       NOT NULL
);