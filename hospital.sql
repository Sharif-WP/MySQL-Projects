-- hospital.sql
CREATE DATABASE hospital_db;

USE hospital_db;

-- table: patients
CREATE TABLE Patients (
patient_id  INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
lastname VARCHAR(100),
gender ENUM ('male', 'female','other'),
date_of_birth DATE,
phone VARCHAR (15),
address VARCHAR(255),
date_registered TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- table: Doctors
CREATE TABLE Doctors (
doctor_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
specialization VARCHAR(100),
phone VARCHAR(15),
email VARCHAR(100)
);

-- table appointments
CREATE TABLE appointments (
appointment_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
doctor_id INT,
appointment_date DATETIME,
notes TEXT,
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- table Medications
CREATE TABLE Medications(
medication_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
drug_name VARCHAR(100),
dosage VARCHAR(50),
start_date DATE,
end_date DATE,
FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
