USE `book_library`;

SELECT `title`
FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = "The"
ORDER BY `id`;

SELECT REPLACE(`title`, "The", "***") AS `title`
FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = "The"
ORDER BY `id`;

SELECT ROUND(SUM(`cost`), 2)
FROM `books`;

SELECT CoNCAT(`first_name`, " ", `last_name`)  AS "Full name",
       ABS(TIMESTAMPDIFF(DAY, `died`, `born`)) AS "Days Lived"
FROM `authors`;

SELECT `title`
FROM `books`
WHERE `title` LIKE "Harry Potter%"
ORDER BY `id`;