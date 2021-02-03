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

create table student (
	student_id int unsigned primary key auto_increment,
    last_name varchar(50) not null,
    first_name varchar(50) not null
);

create table attendance_student (
	student_id int unsigned not null,
    attendance_id mediumint unsigned not null,
    attendance_status enum ('present', 'absent') not null,
    foreign key (student_id) references student(student_id),
    foreign key (attendance_id) references attendance(attendance_id) 
		on delete cascade,
	unique key (student_id, attendance_id)
);

create table academic_calendar (
	calendar_id mediumint unsigned primary key auto_increment,
    event_date date,
    event_description varchar(1000)
);





