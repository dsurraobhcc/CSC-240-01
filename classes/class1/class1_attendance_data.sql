use scheduling;

insert into attendance (class_date, class_time, class_type, class_description)
values ('2021-01-27', '4:30 - 5:45pm', 'All students', 'Regular session'),
('2021-02-01', '4:30 - 5:45pm', 'All students', 'Regular session'),
('2021-02-03', '4:30 - 5:45pm', 'All students', 'Regular session'),
('2021-02-15', '4:30 - 5:45pm', 'All students', 'Regular session');

insert into academic_calendar (event_date, event_description)
values ('2021-01-18', 'Martin Luther King Jr. Day – College closed'),
	('2021-02-15', 'Presidents Day – College closed'),
    ('2021-03-15', 'Start of Spring Break');
    
select * from attendance, academic_calendar;