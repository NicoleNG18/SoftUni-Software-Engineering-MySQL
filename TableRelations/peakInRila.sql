SELECT
    `mountain_range`,
    `peak_name`,
    `elevation` AS `peak_elevation`
FROM
    `mountains` AS m,
    `peaks` AS p
WHERE
        m.`mountain_range` = 'Rila'
  AND p.`mountain_id` = 17
ORDER BY `elevation` DESC;