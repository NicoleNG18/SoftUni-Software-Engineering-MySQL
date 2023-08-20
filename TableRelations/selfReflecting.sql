CREATE TABLE `teachers` (
                            `teacher_id` INT AUTO_INCREMENT PRIMARY KEY,
                            `name` VARCHAR(50) NOT NULL,
                            `manager_id` INT
);

insert into `teachers` (`teacher_id`,`name`,`manager_id`) values
                                                              (101 ,"John",null),
                                                              (102,"Maya",106),
                                                              (103,"Silvia",106),
                                                              (104,"Ted",105),
                                                              (105,"Mark",101),
                                                              (106,"Greta",101);

alter table `teachers`
    add  CONSTRAINT fk_teacher_manager FOREIGN KEY (`manager_id`)
        REFERENCES `teachers` (`teacher_id`);