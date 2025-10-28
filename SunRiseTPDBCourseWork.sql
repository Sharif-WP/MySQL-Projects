-- 1. Create Sunrise TransportDB
CREATE DATABASE SunriseTransportDB;

show databases;

-- 2. Use the database
USE SunriseTransportDB;
show tables;

-- Create tables
CREATE TABLE drivers (
    driver_id INT,
    name VARCHAR(50),
    license_no INT
);

CREATE TABLE buses (
    bus_id INT,
    route VARCHAR(100),
    capacity INT
);

CREATE TABLE trips (
    trip_id INT,
    driver_id INT,
    bus_id INT,
    trip_date DATE
);

-- 3. Insert 3 records in each table
INSERT INTO drivers VALUES 
(1, 'Ssebuguzi Sharif', 12345),
(2, 'Jane Smith', 23456),
(3, 'Peter Johnson', 34567);

INSERT INTO buses VALUES 
(1, 'Route A', 50),
(2, 'Route B', 40),
(3, 'Route C', 60);

INSERT INTO trips VALUES 
(1, 1, 1, '2025-01-10'),
(2, 2, 2, '2025-01-11'),
(3, 3, 3, '2025-01-12');

-- 4. Rename capacity to scaling_capacity
ALTER TABLE buses CHANGE capacity scaling_capacity INT;

-- 5. Add status column to buses
ALTER TABLE buses ADD status VARCHAR(20);

-- 6. Modify license_no to varchar(15)
ALTER TABLE drivers MODIFY license_no VARCHAR(15);

-- 7. Update one driver's name and one trip's date
SET SQL_SAFE_UPDATES = 0;
UPDATE drivers SET name = 'Ssebuguzi Sharif' WHERE driver_id = 1;
UPDATE trips SET trip_date = '2025-02-01' WHERE trip_id = 2;

-- 8. Delete one trip record
DELETE FROM trips WHERE trip_id = 3;

-- 9. Add primary keys
ALTER TABLE drivers ADD PRIMARY KEY (driver_id);
ALTER TABLE buses ADD PRIMARY KEY (bus_id);
ALTER TABLE trips ADD PRIMARY KEY (trip_id);

-- Describe tables
DESCRIBE drivers;
DESCRIBE buses;
DESCRIBE trips;

-- select 
SELECT * FROM drivers;
SELECT * FROM buses;
SELECT * FROM trips;	

--
Alter table drivers Add Primary key (driver_id);
Alter table trips Add primary key (trip_id);

-- insert
INSERT INTO buses(bus_id, route,scaling_capacity, status)
VALUES(4, 'Route D', 55, 'Active');

-- 10.Drop SunriseTransportDB
-- DROP DATABASE SunriseTransportDB;


