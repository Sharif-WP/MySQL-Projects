-- student.sql
CREATE DATABASE student_db;

USE student_db;

-- table : students
CREATE TABLE students(
student_id  INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
age INT,
gender ENUM('Male', 'Female', 'Other'),
course VARCHAR (100),
year_of_study INT,
email VARCHAR(100),
phone VARCHAR(15),
date_enrolled DATE
);

-- Table: courses
CREATE TABLE courses(
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR (100),
duration_years INT,
department VARCHAR(100)
);

-- table enrollments;
CREATE TABLE Enrollments(
enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY (student_id) REFERENCES Studentds(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);