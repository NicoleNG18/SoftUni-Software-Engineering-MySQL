CREATE TABLE `people`
(
    `id`        INT AUTO_INCREMENT PRIMARY KEY,
    `name`      VARCHAR(200) NOT NULL,
    `picture`   BLOB,
    `height`    DOUBLE(10, 2),
    `weight`    DOUBLE(10, 2),
    `gender`    CHAR(1)      NOT NULL,
    `birthdate` DATE         NOT NULL,
    `biography` TEXT
);

INSERT INTO `people` (`name`, `gender`, `birthdate`)
VALUES ("Nicole", "f", DATE(NOW())),
       ("Nina", "f", DATE(NOW())),
       ("Nikola", "m", DATE(NOW())),
       ("Pesho", "m", DATE(NOW())),
       ("Adi", "f", DATE(NOW()));

CREATE TABLE `users`
(
    `id`              INT AUTO_INCREMENT PRIMARY KEY,
    `username`        VARCHAR(30) NOT NULL,
    `password`        VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` TIME,
    `is_deleted`      BOOLEAN
);

INSERT INTO `users` (`username`, `password`, `last_login_time`,
                     `is_deleted`)
VALUES ("PESHO", "123", TIME(NOW()), true),
       ("gosho", "456", TIME(NOW()), false),
       ("drago", "789", TIME(NOW()), true),
       ("kalin", "1234", TIME(NOW()), true),
       ("milka", "123456", TIME(NOW()), false);

ALTER TABLE `users`
    DROP PRIMARY KEY,
    ADD PRIMARY KEY pk_users (`id`,`username`);

ALTER TABLE `users`
    MODIFY COLUMN `last_login_time` DATETIME DEFAULT NOW();

ALTER TABLE `users`
    DROP PRIMARY KEY,
    ADD PRIMARY KEY pk_users (`id`);

ALTER TABLE `users`
    MODIFY COLUMN `username` VARCHAR(30) UNIQUE;