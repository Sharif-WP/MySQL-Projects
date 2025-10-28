 -- Creating a new database green thumbs
CREATE DATABASE green_thumbs;

-- using the green thumbs
USE green_thumbs;

CREATE TABLE Volunteers (
volunteer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) not Null,
email VARCHAR(255) Unique Not Null,
phone VARCHAR(15)
);

CREATE TABLE Gardens(
garden_id INT AUTO_INCREMENT PRIMARY KEY,
garden_name VARCHAR(255) not Null,
location VARCHAR(255), 
size FLOAT
);

CREATE TABLE Plants (
plant_id INT AUTO_INCREMENT PRIMARY KEY,
plant_name VARCHAR(255) Not Null,
sunlight_required ENUM('Full Sun', 'Partial Shade', 'Full Shade'),
garden_id int foreign key
);
 
CREATE TABLE Volunteer_Garden (
volunteer_garden_id INT AUTO_INCREMENT PRIMARY KEY,
volunteer_id INT foreign key,
garden_id INT foreign key,
role VARCHAR(100)
);

