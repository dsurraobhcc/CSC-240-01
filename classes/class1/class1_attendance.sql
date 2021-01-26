drop schema if exists scheduling;
create schema scheduling;
use scheduling;

create table attendance (
	attendance_id mediumint unsigned primary key auto_increment,
    class_date date,
    class_time varchar(20),
    class_type varchar(20),
    class_description varchar(50)
);

create table academic_calendar (
	calendar_id mediumint unsigned primary key auto_increment,
    event_date date,
    event_description varchar(1000)
)



