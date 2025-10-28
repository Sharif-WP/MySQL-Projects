create database StudentDB;
use StudentDB;
create table Student(
class_id varchar(20) primary key  not null,
name varchar(50),
sex varchar(6),
age int,
email varchar(50)
);
describe student;

create table lecturer;
use studentDB;
create table Studentuser(
lecturer_id varchar(20) primary key not null,
name varchar(50),
sex varchar(6),
age int,
email varchar(50)
);
describe student;