CREATE TABLE `passports`
(
    `passport_id`     INT PRIMARY KEY,
    `passport_number` VARCHAR(50) UNIQUE
);


CREATE TABLE `people`
(
    `person_id`   INT AUTO_INCREMENT PRIMARY KEY,
    `first_name`  VARCHAR(255),
    `salary`      DECIMAL(10, 2),
    `passport_id` INT UNIQUE,
    CONSTRAINT fk_people_passports
        FOREIGN KEY (`passport_id`)
            REFERENCES `passports` (`passport_id`)
);

INSERT INTO `passports`(`passport_id`, `passport_number`)
VALUES (101, "N34FG21B"),
       (102, "K65LO4R7"),
       (103, "ZE657QP2");


INSERT INTO `people`(`first_name`, `salary`, `passport_id`)
VALUES ("Roberto", 43300.00, 102),
       ("Tom", 56100.00, 103),
       ("Yana", 60200.00, 101);



CREATE TABLE `manufacturers`
(
    `manufacturer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name`            VARCHAR(50) NOT NULL,
    `established_on`  DATE
);

INSERT INTO `manufacturers` (`manufacturer_id`, `name`, `established_on`)
VALUES (1, "BMW", 01 - 03 - 1916),
       (2, "Tesla", 01 - 01 - 2003),
       (3, "Lada", 01 - 05 - 1966);

CREATE TABLE `models`
(
    `model_id`        INT PRIMARY KEY AUTO_INCREMENT,
    `name`            VARCHAR(50) NOT NULL,
    `manufacturer_id` INT,
    CONSTRAINT fk_models_manuf FOREIGN KEY (`manufacturer_id`)
        REFERENCES `manufacturers` (`manufacturer_id`)
);

INSERT INTO `models` (`model_id`, `name`, `manufacturer_id`)
VALUES (101, "X1", 1),
       (102, "i6", 1),
       (103, "Model S", 2),
       (104, "Model X", 2),
       (105, "Model 3", 2),
       (106, "Nova", 3);