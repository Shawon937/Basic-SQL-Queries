-- joining 
CREATE DATABASE db_university_join;
USE db_university_join;

CREATE TABLE students (
id INT AUTO_INCREMENT,
student_id VARCHAR(15),
student_name VARCHAR(50),
student_dob DATE,
course_id VARCHAR(15),
PRIMARY KEY(id),
FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

INSERT INTO students(student_id, student_name, student_dob, course_id) VALUES 
('SWE001-145','Abdur Rahim','1995-09-02','101'),
('SWE001-145','Abdur Rahim','1995-09-02','102'),
('SWE001-145','Abdur Rahim','1995-09-02','103'),
('CSE005-001','Sazid Noor','1991-06-12','101'),
('CSE005-001','Sazid Noor','1991-06-12','103'),
('CSE005-001','Sazid Noor','1991-06-12','104'),
('ETE009-027','Misuk Nayem','1992-03-11','101'),
('ETE009-027','Misuk Nayem','1992-03-11','102'),
('ETE009-027','Misuk Nayem','1992-03-11','103'),
('ETE009-027','Misuk Nayem','1992-03-11','104')
;

CREATE TABLE courses (
course_id VARCHAR(15),
course_name VARCHAR(50),
course_teacher VARCHAR(15),
PRIMARY KEY(course_id),
FOREIGN KEY(course_teacher) REFERENCES teachers(teacher_id)
);

INSERT INTO courses VALUES 
('101','Computer Fundamental','CSE-1035'),
('102','Physics','EEE-1245'),
('103','English','CSE-1076'),
('104','Basic Networking','ETE-1339'),
('105','Troubleshooting','SWE-1198')
;

CREATE TABLE teachers (
teacher_id VARCHAR(15),
teacher_name VARCHAR(50),
PRIMARY KEY(teacher_id)
);

INSERT INTO teachers(teacher_id,teacher_name) VALUES 
('CSE-1035','Abdul Wadud Sarker'),
('SWE-1198','Golam Rabbaney'),
('EEE-1245','Yousuf Ali'),
('ETE-1339','Sayef Mortaza'),
('CSE-1076','Muaz Ibne Jabal')
;

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM teachers;

-- join/ inner join

SELECT * FROM `courses` JOIN `teachers` ON courses.`course_teacher` = `teachers`.`teacher_id`;
SELECT * FROM `courses` c JOIN `teachers` t ON c.`course_teacher` = `t`.`teacher_id`;
SELECT * FROM `students` s JOIN `courses` c ON s.`course_id` = `c`.`course_id`;

SELECT c.`course_id`,c.`course_name`,t.`teacher_name` FROM `courses` c JOIN `teachers` t ON c.`course_teacher` = `t`.`teacher_id`;

-- left join 
SELECT * FROM `students` s LEFT JOIN `courses` c ON s.`course_id` = `c`.`course_id`;

-- right join
SELECT * FROM `students` s RIGHT JOIN `courses` c ON s.`course_id` = `c`.`course_id`;

-- joining Students, Courses, Teachers Table
SELECT id, `student_id`, `student_name`, `course_name`, `teacher_name` 
FROM students s JOIN `courses`c ON s.`course_id`=c.`course_id` JOIN teachers t ON c.`course_teacher`=t.`teacher_id`
ORDER BY s.`id`;

-- delete course or students row as these are connected