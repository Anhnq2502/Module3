use quan_ly_sinh_vien;

-- hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
select *
from subject_c11
where credit = (select max(credit) from subject_c11);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select *
from subject_c11
inner join mark on mark.subject_id = subject_c11.subject_id
where mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần.
select *, avg(mark.mark) as diem_tb
from student
inner join mark on mark.student_id = student.student_id
group by student.student_id
order by diem_tb;