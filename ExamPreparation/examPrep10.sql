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

CREATE TABLE `movies`
(
    `id`            INT AUTO_INCREMENT PRIMARY KEY,
    `title`         VARCHAR(70) NOT NULL UNIQUE,
    `country_id`    INT         NOT NULL,
    `movie_info_id` INT         NOT NULL UNIQUE,
    CONSTRAINT fk_countries FOREIGN KEY (`country_id`)
        REFERENCES `countries` (`id`),
    CONSTRAINT fk_movie_info FOREIGN KEY (`movie_info_id`)
        REFERENCES `movies_additional_info` (`id`)
);

CREATE TABLE `actors`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name`  VARCHAR(50) NOT NULL,
    `birthdate`  DATE        NOT NULL,
    `height`     INT,
    `awards`     INT,
    `country_id` INT         NOT NULL,
    CONSTRAINT fk_countries_actors FOREIGN KEY (`country_id`)
        REFERENCES `countries` (`id`)
);

CREATE TABLE `movies_actors`
(
    `movie_id` INT,
    `actor_id` INT,
    KEY (`movie_id`, `actor_id`),
    CONSTRAINT fk_movies_ma FOREIGN KEY (`movie_id`)
        REFERENCES `movies` (`id`),
    CONSTRAINT fk_actors_ma FOREIGN KEY (`actor_id`)
        REFERENCES `actors` (`id`)
);



CREATE TABLE `genres_movies`
(
    `genre_id` INT,
    `movie_id` INT,
    KEY (`genre_id`, `movie_id`),
    CONSTRAINT fk_genres_gm FOREIGN KEY (`genre_id`)
        REFERENCES `genres` (`id`),
    CONSTRAINT fk_movies_gm FOREIGN KEY (`movie_id`)
        REFERENCES `movies` (`id`)
);

insert into countries (`name`, `continent`, `currency`)
values ('Albania', 'Europe', 'ALL'),
       ('Argentina', 'South America', 'ARS'),
       ('Armenia', 'Asia', 'AMD'),
       ('Barbados', 'North America', 'BBD'),
       ('Belarus', 'Europe', 'BYN'),
       ('Belgium', 'Europe', 'EUR'),
       ('Belize', 'North America', 'BZD'),
       ('Bolivia', 'South America', 'BOB'),
       ('Bulgaria', 'Europe', 'BGN'),
       ('Cuba', 'North America', 'CUP'),
       ('Cyprus', 'Asia', 'EUR'),
       ('Czech Republic', 'Europe', 'CZK'),
       ('Denmark', 'Europe', 'DKK'),
       ('Dominican Republic', 'North America', 'DOP'),
       ('Ecuador', 'South America', 'USD'),
       ('Estonia', 'Europe', 'EUR'),
       ('Germany', 'Europe', 'EUR'),
       ('Greece', 'Europe', 'EUR'),
       ('Greenland', 'North America', 'DKK'),
       ('Haiti', 'North America', 'HTG'),
       ('Hong Kong', 'Asia', 'HKD'),
       ('Hungary', 'Europe', 'HUF'),
       ('Iceland', 'Europe', 'ISK'),
       ('India', 'Asia', 'INR'),
       ('Israel', 'Asia', 'ILS'),
       ('Japan', 'Asia', 'JPY'),
       ('Kazakhstan', 'Asia', 'KZT'),
       ('Kenya', 'Africa', 'KES'),
       ('Latvia', 'Europe', 'EUR'),
       ('Malta', 'Europe', 'EUR'),
       ('Mexico', 'North America', 'MXN'),
       ('Netherlands', 'Europe', 'EUR'),
       ('New Zealand', 'Oceania', 'NZD'),
       ('Pakistan', 'Asia', 'PKR'),
       ('Paraguay', 'South America', 'PYG'),
       ('Peru', 'South America', 'PEN'),
       ('Philippines', 'Asia', 'PHP'),
       ('Poland', 'Europe', 'PLN'),
       ('Portugal', 'Europe', 'EUR'),
       ('Romania', 'Europe', 'RON'),
       ('Serbia', 'Europe', 'RSD'),
       ('South Africa', 'Africa', 'ZAR'),
       ('Italy', 'Europe', 'EUR'),
       ('Sweden', 'Europe', 'SEK'),
       ('Switzerland', 'Europe', 'CHF'),
       ('Thailand', 'Asia', 'THB'),
       ('Tunisia', 'Africa', 'TND'),
       ('United Kingdom', 'Europe', 'GBP'),
       ('United States', 'North America', 'USD'),
       ('Uruguay', 'South America', 'UYU'),
       ('Suriname', 'South America', 'SRD'),
       ('Iran', 'Asia', 'PKR'),
       ('Uzbekistan', 'Asia', 'UZS');
