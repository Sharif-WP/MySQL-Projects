create database simpli_batch_sql_2;
create database 12_simpli_batch_sql_2;
create database simpli123_batch_sql_2;
create database 1simpli_batch_sql_2;
create database 1simpli_batch_sql;
create database 12simpli_batch345_sql_2;
create database 12simpli_batch_sql3_2;

show databases like '12%';
show databases like '_5%';
show databases like '12%3%';
show databases like '%simpli%sql__';
show databases like '2%3%';

drop database 12_simpli_batch_sql_2;
use 1simpli_batch_sql;

create table student(
id int not null primary key,
sname varchar(100),
school varchar(100),
marks_1 int,
marks_2 int,
mark_3 int
 );
 
 show tables;
 describe student;
 
 create table employee(
 id  int not null primary key,
 sname varchar(100),
lname varchar(100),
mname varchar(100),
department varchar(100),
age int,
jobdesc varchar(100),
salary float,
address varchar(100),
ranks varchar(20)
 );
 
 show tables;
 describe employee;
 
 create table cricker(
 id int not null primary key,
 sname varchar(100),
 lname varchar(100),
 mname varchar(100),
 country varchar(50),
 position varchar(50),
 age int, 
 address varchar(50)
 );
 
 show tables;
 describe cricker;
 
 alter table student
 add column phone_no bigint;
 
 alter table student
 add email varchar(200) after marks_3;
 
 alter table student
 add addr_line varchar(300) after mark_3;
 
 alter table student
 add city varchar(200) after addr_line;
 
 create table student1(
 id int not null primary key,
 sname varchar(100),
 school varchar(100),
 marks_1 int,
 marks_2 int,
 marks_3 int
 );
 
 alter table student1
 add column phone_number bigint,
 add email varchar(200) after marks_3,
 add addr_line varchar(300) after addr_line,
 add pincode int after city;
 
 describe student1;
 
 alter table student1
 modify email varchar(100) not null;
 
 alter table student
 modify sname  varchar(150) not null,
 modify school varchar(150) not null,
 modify email varchar(150) not null,
 modify addr_line  varchar(150) not null,
 modify city varchar(150) not null;
 
 alter table student1
 rename column id to stu_id,
 rename column sname to stu_name,
 rename column school to stu_school,
 rename column email to stu_email,
 rename column addr_line to stu_addr,
 rename column city to stu_city,
 rename column marks_1 to stu_marks1,
 rename column marks_2 to stu_marks2,
 rename column marks_3 to stu_marks;
 
 describe student1;
 
 alter table student1
 drop column stu_email;
 
 alter table student1
 drop column phone_no;
 
 describe student1;
 
 -- CRUD operations
 /*C- create
 R- retrieve
 U - update
 D - Delete */
 
 create table stud_dt1(
 id int not null primary key,
 sname varchar(100),
 school varchar(100),
 marks_1 int,
 marks_2 int,
 marks_3 int
 );
 
insert into stud_dt1 values (1, 'Odi', 'Marist', 77,32,67);
insert into stud_dt1 values (2, 'James', 'Rangers', 88,40,69);
insert into stud_dt1 values (3, 'Ike', 'Chrital', 44,70,29);
insert into stud_dt1 values (4, 'Chukwuemeka', 'Marist Juniorate', 72,48,61);

insert into stud_dt1 (id, sname, school, marks_1,marks_2,marks_3) values (5, 'Innocent', 'Nato', 55,76,61);
insert into stud_dt1 (id, sname, school, marks_1,marks_2,marks_3) values (6, 'Okoro', 'Gill', 51,36,91);
insert into stud_dt1 (id, sname, school, marks_1,marks_2,marks_3) values (7, 'Chuks', 'SNN', 34,43,71);

insert into stud_dt1 (id, sname, school, marks_1,marks_2,marks_3) values (8, 'Kal', 'Nall', 53,73,22);

show tables;

drop table cricker;

select * from  stud_dt1;

update stud_dt1 set marks_1 = marks_1+ 6 where id =3;

select * from stud_dt1 where marks_1 >75;

update stud_dt1 set school = 'Marist Academy' where id =1;
select * from stud_dt1 where marks_1>=50 and marks_2 >=70;

select * from stud_dt1 where sname like 'a%';

select * from stud_st1 where id !=2;

select id,sname,school from stud_dt1 where id !=2;
select count(id) as stud_count from stud_dt1;
select sum(marks_1) as stud_sum_1 from stud_dt1;
select avg(marks_1) as stud_ave_1 from stud_dt1;
select min(marks_1) as stud_min_1 from stud_dt1;

select count(id) as stud_count, sum(marks_1) as stud_sum, avg(marks_1) as stud_ave;
     
 create database employee_database;
 use employee_database;
 
 create table employee_tb1(
 id int not null auto_increment primary key,
 ename varchar(100) not null,
 company varchar(100),
 age int not null,
 salary int
 );
 
 describe employee_tb1;
alter  table employee_tb1
modify column salary int default 0;

alter table employee_tb1
add column fname varchar(100) after ename,
add column mname varchar(100) after ename,
add column addr_line varchar(300) after salary,
add column city varchar(100) after salary,
add column pincode int after city;

alter table employee_tb1
modify column ename varchar(250),
modify column fname varchar(250),
modify column mname varchar(250),
modify column company varchar(250),
modify column addr_line varchar(250),
modify column city varchar(250);

alter table employee_tb1
rename column id to emp_id,
rename column ename to emp_ename,
rename column fname to emp_fname,
rename column mname to emp_mname,
rename column company to emp_company,
rename column age to emp_age,
rename column salary to emp_salary,
rename column addr_line to emp_addr_line,
rename column city to emp_city,
rename column pincode to emp_pincode;

describe  employee_tb1;

select * from employee_tb1 where emp_salary > 40000;

select * from employee_tb1 where emp_salary > 40000 and emp_salary < 60000;
select * from employee_tb1 where emp_ename like 'B%';

select * from emp_tb1 where emp_city in ('Hyderabad', 'Chenai');
select * from emp_tb1 where emp_city not in ('Hyderabad', 'Chenai');
select max(emp_salary) as Highest_salary from emp_tb1;

select min(emp_salary) as Lowest_salary from emp_tb1;
select count(emp_id) as Employee_count from employee_tb1;

select * from employee_tb1 where emp_city != 'Bangalole' and emp_company != 'infosys';

SET SQL_SAFE_UPDATES = 0;
update employee_tb1 set emp_salary = emp_salary+4000 where emp_company = 'infosys';
update employee_tb1 set emp_salary = emp_salary + 5000 where emp_company = 'wipro';
update employee_tb1 set emp_salary = emp_salary + 3000 where emp_company not in ('infosys', 'wipro');
SET SQL_SAFE_UPDATES = 1;
select * from employee_tb1;

SET SQLSAFE_UPDATES =0;
update employee_tb1 set emp_salary = emp_salary + (emp_salary* 0.2) where age>30;
select * from employee_tb1;

alter table employee_tb1
add column desgnation varchar(200) default 'Trainee Engineer' after emp_company;

update employee_tb1 set desgnation = 'Senior Manager' where emp_age >=35;
update employee_tb1 set desgnation = 'Manager' where emp_age >=30  and emp_age <35;
update employee_tb1 set desgnation  ='Senior Developer' where emp_age >= 27 and emp_age <30;
update employee_tb1 set desgnation = 'Developer' where emp_age <27;

select * from employee_tb1;
select emp_company, count(emp_id) emp_count from emp_tb1
group by emp_company
order by emp_count asc;

select * from employee_tb1;

select ASCII('2');

select emp_ename,length(emp_ename) as employee_count from employee_tb1;
select emp_id, emp_ename from employee_tb1 where emp_name like '%h';

SET SQL_SAFE_UPDATES = 0;
update employee_tb1 set employee_salary= emp_salary + (emp_salary* 0.2) where emp_age >30;
select * from employee_tb1;

alter table employee_tb1
add column designation varchar(200) default 'Trainee Engineer' after emp_company;

update employee_tb1 set desgnation = 'Senior Manager ' where emp_age >=35;
update employee_tb1 set designation = 'Manager' where emp_age >= 30 and emp_age < 35;
update employee_tb1 set designation = 'Senior Developer' where emp_age < 27;

select * from employee_tb1;
select emp_company, count(emp_id) as emp_count from employee_tb1
group by emp_company
order by emp_count asc;

select * from employee_tb1;

select ASCII('Z');




 

