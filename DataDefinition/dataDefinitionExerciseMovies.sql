CREATE TABLE `directors`
(
    `id`            INT AUTO_INCREMENT PRIMARY KEY,
    `director_name` VARCHAR(15) NOT NULL,
    `notes`         TEXT
);

CREATE TABLE `genres`
(
    `id`         INT AUTO_INCREMENT PRIMARY KEY,
    `genre_name` VARCHAR(30) NOT NULL,
    `notes`      TEXT
);

CREATE TABLE `categories`
(
    `id`            INT AUTO_INCREMENT PRIMARY KEY,
    `category_name` VARCHAR(30) NOT NULL,
    `notes`         TEXT
);

CREATE TABLE `movies`
(
    `id`             INT AUTO_INCREMENT PRIMARY KEY,
    `title`          VARCHAR(30) NOT NULL,
    `director_id`    INT,
    `copyright_year` YEAR,
    `length`         TIME,
    `genre_id`       INT,
    `category_id`    INT,
    `rating`         INT,
    `notes`          TEXT
);

INSERT INTO `categories` (`category_name`)
VALUES ("SCIENCE-FICTION"),
       ("HORROR"),
       ("COMEDY"),
       ("ANIMATION"),
       ("SITCOM");

INSERT INTO `directors` (`director_name`)
VALUES ("nicole"),
       ("veni"),
       ("ivan"),
       ("nikola"),
       ("iordan");

INSERT INTO `genres` (`genre_name`)
VALUES ("sitcom"),
       ("comedy"),
       ("chalga"),
       ("horror"),
       ("turski");

INSERT INTO `movies` (`title`)
VALUES ("fandf"),
       ("devil"),
       ("mercedes"),
       ("bmw"),
       ("kustendil");