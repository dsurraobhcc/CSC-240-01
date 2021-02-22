use scheduling;

delete from attendance;

insert into attendance (class_date, class_time, class_type, class_description)
values ('2021-01-27', '4:30 - 5:45pm', 'All students', 'Regular session'),
('2021-02-01', '4:30 - 5:45pm', 'All students', 'Regular session'),
('2021-02-03', '4:30 - 5:45pm', 'All students', 'Regular session'),
('2021-02-15', '4:30 - 5:45pm', 'All students', 'Regular session');

insert into attendance (class_date, class_time, class_type, class_description)
values ('2021-02-03', '4:30 - 5:45pm', 'All students', 'Regular session');

set @attendance_id = last_insert_id();

insert into student (last_name, first_name)
values ('Vaughn', 'Vince'), ('Kim', 'Jane');

-- Vince id 1, Jane id 2
-- class on 2/3 attendance id 11

-- Mark Vince as present
insert into attendance_student (student_id, attendance_id, attendance_status)
values (1, @attendance_id, 'present');

-- Mark Jane as absent
insert into attendance_student (student_id, attendance_id, attendance_status)
values (2, @attendance_id, 'absent');

insert into attendance_student (student_id, attendance_id, attendance_status)
values (2, @attendance_id, 'present');


-- delete a session
delete from attendance 
where attendance_id = 5;

select * from attendance;
select * from attendance_student;

insert into student (last_name, first_name)
values (NULL, NULL);

select * from student;


