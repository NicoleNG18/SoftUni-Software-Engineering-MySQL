CREATE TABLE `categories`
(
    `id`           INT AUTO_INCREMENT PRIMARY KEY,
    `category`     VARCHAR(30) NOT NULL,
    `daily_rate`   DECIMAL(10, 2),
    `weekly_rate`  DECIMAL(10, 2),
    `monthly_rate` DECIMAL(10, 2),
    `weekend_rate` DECIMAL(10, 2)
);

CREATE TABLE `cars`
(
    `id`            INT AUTO_INCREMENT PRIMARY KEY,
    `plate_number`  INT,
    `make`          VARCHAR(30),
    `model`         VARCHAR(30) NOT NULL,
    `car_year`      YEAR,
    `category_id`   INT,
    `doors`         INT,
    `picture`       BLOB,
    `car_condition` VARCHAR(30),
    `available`     BOOLEAN
);

CREATE TABLE `employees`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name`  VARCHAR(30) NOT NULL,
    `title`      VARCHAR(30),
    `notes`      TEXT
);

CREATE TABLE `customers`
(
    `id`                    INT AUTO_INCREMENT PRIMARY KEY,
    `driver_licence_number` INT,
    `full_name`             VARCHAR(30) NOT NULL,
    `address`               VARCHAR(30),
    `city`                  VARCHAR(30),
    `zip_code`              INT,
    `notes`                 TEXT
);

CREATE TABLE `rental_orders`
(
    `id`                INT AUTO_INCREMENT PRIMARY KEY,
    `employee_id`       INT NOT NULL,
    `customer_id`       INT NOT NULL,
    `car_id`            INT NOT NULL,
    `car_condition`     VARCHAR(30),
    `tank_level`        INT NOT NULL,
    `kilometrage_start` INT,
    `kilometrage_end`   INT,
    `total_kilometrage` INT,
    `start_date`        DATE,
    `end_date`          DATE,
    `total_days`        INT NOT NULL,
    `rate_applied`      INT NOT NULL,
    `tax_rate`          INT NOT NULL,
    `order_status`      VARCHAR(30),
    `notes`             TEXT
);
