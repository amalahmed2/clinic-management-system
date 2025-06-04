CREATE DATABASE IF NOT EXISTS clinic_management;
USE clinic_management;


CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Clinic (
    Clinic_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE SET NULL
);

CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone_Number VARCHAR(20),
    Address VARCHAR(255),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) ON DELETE SET NULL
);

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone_Number VARCHAR(20),
    Address VARCHAR(255),
    Birth_Date DATE,
    Job VARCHAR(100)
);

CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    Date DATE NOT NULL,
    Start_Time TIME,
    End_Time TIME,
    Cost DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Scheduled', 'In Progress', 'Postponed')),
    Diagnosis TEXT,
    Patient_ID INT,
    Doctor_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE CASCADE,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID) ON DELETE SET NULL
);

INSERT INTO Department (Department_ID, Name) VALUES (1, 'Cardiology');
INSERT INTO Department (Department_ID, Name) VALUES (2, 'Oncology');
INSERT INTO Department (Department_ID, Name) VALUES (3, 'Neurology');
INSERT INTO Department (Department_ID, Name) VALUES (4, 'Dermatology');
INSERT INTO Department (Department_ID, Name) VALUES (5, 'Gastroenterology');

INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (101, 'Clinic 1', 'Street 1, City', 1);
INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (102, 'Clinic 2', 'Street 2, City', 2);
INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (103, 'Clinic 3', 'Street 3, City', 3);
INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (104, 'Clinic 4', 'Street 4, City', 4);
INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (105, 'Clinic 5', 'Street 5, City', 5);
INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (106, 'Clinic 6', 'Street 6, City', 1);
INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (107, 'Clinic 7', 'Street 7, City', 2);
INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (108, 'Clinic 8', 'Street 8, City', 3);
INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (109, 'Clinic 9', 'Street 9, City', 4);
INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (110, 'Clinic 10', 'Street 10, City', 5);


INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (201, 'Dr. Name1', '0100000001', 'Doctor Street 1, City', 1);
INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (202, 'Dr. Name2', '0100000002', 'Doctor Street 2, City', 1);
INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (203, 'Dr. Name3', '0100000003', 'Doctor Street 3, City', 2);
INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (204, 'Dr. Name4', '0100000004', 'Doctor Street 4, City', 2);
INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (205, 'Dr. Name5', '0100000005', 'Doctor Street 5, City', 3);
INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (206, 'Dr. Name6', '0100000006', 'Doctor Street 6, City', 3);
INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (207, 'Dr. Name7', '0100000007', 'Doctor Street 7, City', 4);
INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (208, 'Dr. Name8', '0100000008', 'Doctor Street 8, City', 4);
INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (209, 'Dr. Name9', '0100000009', 'Doctor Street 9, City', 5);
INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (210, 'Dr. Name10', '0100000010', 'Doctor Street 10, City', 5);


INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (12521, 'Patient 1', '0123456781', 'Patient Address 1', '1980-12-31', 'Engineer');
INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (12522, 'Patient 2', '0123456782', 'Patient Address 2', '1983-12-31', 'Teacher');
INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (12523, 'Patient 3', '0123456783', 'Patient Address 3', '1986-12-31', 'Doctor');
INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (12524, 'Patient 4', '0123456784', 'Patient Address 4', '1989-12-31', 'Nurse');
INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (12525, 'Patient 5', '0123456785', 'Patient Address 5', '1992-12-31', 'Artist');
INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (12526, 'Patient 6', '0123456786', 'Patient Address 6', '2002-04-10', 'Hostess');
INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (12527, 'Patient 7', '0123456787', 'Patient Address 7', '2002-12-22', 'Dentist');
INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (12528, 'Patient 8', '0123456788', 'Patient Address 8', '2001-12-31', 'Lawyer');
INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (12529, 'Patient 9', '0123456789', 'Patient Address 9', '2003-06-28', 'Biotechnologist');
INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (125210, 'Patient 10', '0123456710', 'Patient Address 10', '2007-12-31', 'Technician');


INSERT INTO Appointment (Appointment_ID, Date, Start_Time, End_Time, Cost, Status, Diagnosis, Patient_ID, Doctor_ID) 
VALUES (401, '2025-06-10', '09:00:00', '09:30:00', 250.0, 'Scheduled', 'Flu', 12521, 201);
INSERT INTO Appointment (Appointment_ID, Date, Start_Time, End_Time, Cost, Status, Diagnosis, Patient_ID, Doctor_ID) 
VALUES (402, '2025-05-17', '09:00:00', '09:30:00', 180.0, 'In Progress', 'Fatty Liver', 12522, 202);
INSERT INTO Appointment (Appointment_ID, Date, Start_Time, End_Time, Cost, Status, Diagnosis, Patient_ID, Doctor_ID) 
VALUES (403, '2025-06-24', '09:00:00', '09:30:00', 300.0, 'Postponed', 'Migraine', 12523, 203);
INSERT INTO Appointment (Appointment_ID, Date, Start_Time, End_Time, Cost, Status, Diagnosis, Patient_ID, Doctor_ID) 
VALUES (404, '2025-05-31', '09:00:00', '09:30:00', 150.0, 'Scheduled', 'Eczema', 12524, 204);
INSERT INTO Appointment (Appointment_ID, Date, Start_Time, End_Time, Cost, Status, Diagnosis, Patient_ID, Doctor_ID) 
VALUES (405, '2025-05-07', '09:00:00', '09:30:00', 200.0, 'Scheduled', 'Ulcer', 12525, 205);
INSERT INTO Appointment (Appointment_ID, Date, Start_Time, End_Time, Cost, Status, Diagnosis, Patient_ID, Doctor_ID) 
VALUES (406, '2025-05-14', '09:00:00', '09:30:00', 175.0, 'In Progress', 'Allergy', 12526, 206);
INSERT INTO Appointment (Appointment_ID, Date, Start_Time, End_Time, Cost, Status, Diagnosis, Patient_ID, Doctor_ID) 
VALUES (407, '2025-06-21', '09:00:00', '09:30:00', 190.0, 'Postponed', 'Back Pain', 12527, 207);
INSERT INTO Appointment (Appointment_ID, Date, Start_Time, End_Time, Cost, Status, Diagnosis, Patient_ID, Doctor_ID) 
VALUES (408, '2025-05-28', '09:00:00', '09:30:00', 230.0, 'Scheduled', 'Cold', 12528, 208);
INSERT INTO Appointment (Appointment_ID, Date, Start_Time, End_Time, Cost, Status, Diagnosis, Patient_ID, Doctor_ID) 
VALUES (409, '2025-06-06', '09:00:00', '09:30:00', 210.0, 'Scheduled', 'Hypertension', 12529, 209);
INSERT INTO Appointment (Appointment_ID, Date, Start_Time, End_Time, Cost, Status, Diagnosis, Patient_ID, Doctor_ID) 
VALUES (410, '2025-05-13', '09:00:00', '09:30:00', 260.0, 'In Progress', 'Arthritis', 125210, 210);

SELECT P.Name, A.Date, A.Diagnosis
FROM Appointment A
JOIN Patient P ON A.Patient_ID = P.Patient_ID
WHERE A.Diagnosis = 'Fatty Liver'
  AND A.Date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

SELECT C.Name AS Clinic_Name, C.Address
FROM Clinic C
JOIN Department D ON C.Department_ID = D.Department_ID
WHERE D.Name = 'Cardiology';

SELECT P.Name, SUM(A.Cost) AS Total_Paid
FROM Appointment A
JOIN Patient P ON A.Patient_ID = P.Patient_ID
WHERE P.Patient_ID = 12527
  AND A.Date >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
GROUP BY P.Name;





...................
DELIMITER //

CREATE TRIGGER validate_appointment_status
BEFORE INSERT ON Appointment
FOR EACH ROW
BEGIN
  IF NEW.Status NOT IN ('Scheduled', 'In Progress', 'Postponed') THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Invalid appointment status.';
  END IF;
END;
//
