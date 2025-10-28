-- School_table
CREATE DATABASE school;
USE school;

-- create students table
CREATE TABLE students (
student_id  INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
age INT,
course_id INT
);

-- create courses table
CREATE TABLE courses (
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR(100),
credits  INT
);

-- create lecturer's table
CREATE TABLE lecturer(
lecturer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(100)
);

-- create table library
CREATE TABLE library (
book_id  INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100),
author VARCHAR(100),
available BOOLEAN
);

-- insert two records in the students table 
INSERT INTO students (first_name, last_name,age, course_id)
VALUES
('John', 'Doe', 20,1),
('Jane', 'Smith', 22,2),
('Sharif', 'Ssebuguzi', 21,3),
('Kalanda', 'Paul', 26,4),
('Bwebare ', 'Peter', 30, 5);

-- insert two records into the courses table
INSERT INTO courses (course_name, credits)
VALUES
('computer_science', 3),
('Mathematics', 4),
('Bachelor of Technology', 3),
('Digital Logic', 4),
('Structured Programming', 3);


-- insert two records into  the lecturers table
INSERT INTO lecturer(first_name,last_name, department)
VALUES
('Kawoma', 'Derrick', 'computer science'),
('Kibuule', 'Wommack', 'mathematics'),
('Yuma', 'Eric', 'English'),
('Alikombo', 'Karis', 'IT'),
('Dutil', 'Rema', 'Sociology');

-- insert 5 records into the library table
INSERT INTO library (title, author, available)
VALUES
('Data structures & algorithms', 'Mark Weiss', TRUE),
('Database Management Systems', 'Raghu Ramarishnan', FALSE),
('Introduction to Digital Logic', 'Kisambira Innocent', FALSE),
('Basics Of Computing', 'Bwambale Sulayit', TRUE),
('Introduction to Advanced Computing', 'Patrick Kalanda', FALSE);


-- select students with age 20 and id 2
SELECT * FROM students
WHERE age = 30 OR  student_id = 5;

-- show tables in the current database
SHOW TABLES;

-- select from tables
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM lecturer;
SELECT * FROM  library;

