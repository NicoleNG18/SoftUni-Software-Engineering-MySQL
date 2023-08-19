CREATE TABLE `students`
(
    `student_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name`       VARCHAR(50) NOT NULL
);

CREATE TABLE `exams`
(
    `exam_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name`    VARCHAR(50) NOT NULL
);

CREATE TABLE `students_exams`
(
    `student_id` INT,
    `exam_id`    INT,
    CONSTRAINT pk_student_exam PRIMARY KEY (`student_id`, `exam_id`),
    CONSTRAINT fk_students_exams_students FOREIGN KEY (`student_id`)
        REFERENCES `students` (`student_id`),
    CONSTRAINT fk_exams_students_exams FOREIGN KEY (`exam_id`)
        REFERENCES `exams` (`exam_id`)
);

insert into `students` (`student_id`, `name`)
values (1, "Mila"),
       (2, "Toni"),
       (3, "Ron");

insert into `exams` (`exam_id`, `name`)
values (101, "Spring MVC"),
       (102, "Neo4j"),
       (103, "Oracle 11g");

insert into `students_exams` (`student_id`, `exam_id`)
values (1, 101),
       (1, 102),
       (2, 101),
       (3, 103),
       (2, 102),
       (2, 103);
