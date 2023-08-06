SELECT `peak_name`
FROM `peaks`
ORDER BY `peak_name`;

SELECT `country_name`, `population`
FROM `countries`
WHERE `continent_code` = "EU"
ORDER BY `population` DESC,
         `country_name`
LIMIT 30;

USE `geography`;

ALTER TABLE `countries`
    ADD COLUMN `currency` VARCHAR(255);

UPDATE `countries`
SET `currency` = "Euro"
WHERE `currency_code` = "EUR";

UPDATE `countries`
SET `currency` = "Not Euro"
WHERE NOT `currency_code` = "EUR";

SELECT `country_name`, `country_code`, `currency`
FROM `countries`
ORDER BY `country_name`;