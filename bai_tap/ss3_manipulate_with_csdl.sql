create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class_c11(
	class_id int auto_increment,
	class_name varchar(255),
	start_date varchar(255) default "CurrentDate",
	class_status bit,
    
    primary key(class_id)
);

create table student(
	student_id int auto_increment,
    student_name varchar(255),
    address varchar(255),
    phone varchar(255) default "",
    student_status bit,
    class_id int,
    mark_id int,
    
    primary key(student_id),
    foreign key(class_id) references class_c11(class_id),
    foreign key(mark_id) references mark(mark_id)
);

create table subject_c11(
	subject_id int auto_increment,
    subject_name varchar(255),
    credit int,
    subject_status bit,
    
    primary key(subject_id)
);

create table mark(
	mark_id int auto_increment,
    subject_id int not null,
    student_id int not null,
    mark float,
    exam_time float,
    
    unique key(subject_id,student_id),
    primary key(mark_id),
    foreign key(subject_id) references subject_c11(subject_id),
    foreign key(student_id) references student(student_id)
);

insert into class_c11(class_name,start_date,class_status)
value("A1","20/12/2008",1),
	("A2","22/12/2008",1),
    ("B3","",0);

insert into student(student_name,address,phone,student_status,class_id)
value("Hung","Ha Noi","0912113113",1,1),
	("Hoa","Hai Phong","",1,1),
    ("Manh","HCM","0123123123",0,2);
    
insert into subject_c11(subject_name,credit,subject_status)
value("CF",5,1),
	("C",6,1),
    ("HDJ",5,1),
    ("HDBMS",10,1);
    
insert into mark(subject_id,student_id,mark,exam_time)
value(1,1,8,1),
	(1,2,10,2),
    (2,1,12,1);


select student_name from student
where student_name like 'h%';

select class_name from class_c11
where start_date like '%12%';

select subject_name from subject_c11
where credit >= 3 and credit <= 5;

update student
set class_id = 2
where student_name = 'Hung';

select student_name,mark
from mark inner join student
order by mark;