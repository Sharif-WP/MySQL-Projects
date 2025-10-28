-- 1. Create the database
CREATE DATABASE IF NOT EXISTS SunriseTransportDB;

-- Use the database
USE SunriseTransportDB;

-- 2. Create tables with primary keys defined upfront
CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    name VARCHAR(50),
    license_no VARCHAR(20)
);

CREATE TABLE buses (
    bus_id INT PRIMARY KEY,
    route VARCHAR(50),
    capacity INT
);

CREATE TABLE trips (
    trip_id INT PRIMARY KEY,
    driver_id INT,
    bus_id INT,
    trip_date DATE,
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (bus_id) REFERENCES buses(bus_id)
);

-- 3. Insert 3 records into each table

-- drivers
INSERT INTO drivers (driver_id, name, license_no) VALUES
(1, 'John Doe', 'LIC12345'),
(2, 'Mary Jane', 'LIC54321'),
(3, 'Paul Smith', 'LIC67890');

-- buses
INSERT INTO buses (bus_id, route, capacity) VALUES
(1, 'Route A', 40),
(2, 'Route B', 35),
(3, 'Route C', 50);

-- trips
INSERT INTO trips (trip_id, driver_id, bus_id, trip_date) VALUES
(1, 1, 1, '2025-10-21'),
(2, 2, 2, '2025-10-22'),
(3, 3, 3, '2025-10-23');

-- 4. Rename column 'capacity' to 'scaling_capacity' in buses
ALTER TABLE buses CHANGE COLUMN capacity scaling_capacity INT;

-- 5. Add 'status' column to buses
ALTER TABLE buses ADD COLUMN status VARCHAR(20);

-- 6. Modify license_no to VARCHAR(15) in drivers
ALTER TABLE drivers MODIFY COLUMN license_no VARCHAR(15);

-- 7. Update one driver's name and one trip's date
UPDATE drivers SET name = 'Jonathan Doe' WHERE driver_id = 1;
UPDATE trips SET trip_date = '2025-10-25' WHERE trip_id = 2;

-- 8. Delete one trip record

-- 9. Drop the database (optional, commented out)
-- DROP DATABASE SunriseTransportDB;
