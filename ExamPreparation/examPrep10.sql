create database `movies`;

drop database `movies`;

CREATE TABLE `genres`
(
    `id`   INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE `movies_additional_info`
(
    `id`            INT AUTO_INCREMENT PRIMARY KEY,
    `rating`        DECIMAL(10, 2) NOT NULL,
    `runtime`       INT            NOT NULL,
    `picture_url`   VARCHAR(80)    NOT NULL,
    `budget`        DECIMAL(10, 2),
    `release_date`  DATE           NOT NULL,
    `has_subtitles` BOOLEAN        NOT NULL not null,
    `description`   TEXT
);


CREATE TABLE `countries`
(
    `id`        INT AUTO_INCREMENT PRIMARY KEY,
    `name`      VARCHAR(30) NOT NULL UNIQUE,
    `continent` VARCHAR(30) NOT NULL,
    `currency`  VARCHAR(5)  NOT NULL
);