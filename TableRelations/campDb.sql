CREATE DATABASE camp;
use camp;

CREATE TABLE rooms
(
    id         INT PRIMARY KEY,
    occupation VARCHAR(20) not null,
    beds_count int         not null
);

CREATE TABLE vehicles
(
    id           int primary key auto_increment not null,
    driver_id    int                            not null,
    vehicle_type varchar(30)                    not null,
    passengers   int                            not null
);

CREATE TABLE campers
(
    id         INT PRIMARY KEY auto_increment,
    first_name varchar(20) not null,
    last_name  varchar(20) not null,
    age        int         not null,
    room       int,
    vehicle_id int,
    CONSTRAINT fk_room_id FOREIGN KEY (room) REFERENCES rooms (id),
    CONSTRAINT fk_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) on delete cascade
);

CREATE TABLE routes
(
    id             INT PRIMARY KEY auto_increment,
    starting_point varchar(30) not null,
    end_point      varchar(30) not null,
    leader_id      int         not null,
    route_time     TIME        NOT NULL,
    CONSTRAINT fk_leader_id FOREIGN KEY (leader_id) REFERENCES campers (id)
);