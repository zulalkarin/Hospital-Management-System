CREATE TABLE Doctor (
    Doctor_ID int not NULL,
    DLast_Name varchar(255),
    DFirst_Name varchar(255),
    DAddress varchar(255),
    D_Salary int,
    D_Job   varchar(255),
    DPhone_Number  char(11),
    Doctor_mail  varchar(255),
    DSex      varchar(15),
    Room_Number int,
    D_Title    varchar(255),
    D_Age   int not null, 
   primary KEY(Doctor_ID)
);
CREATE TABLE SHIFT(
Shift_ID int not null,
SEnd time,
SDate date,
SStart time,
primary KEY(Shift_ID)
);
CREATE TABLE DEPARTMENT(
Department_ID int not null,
DepartmentName varchar(255),
Dep_Capacity int,
primary KEY(Department_ID)
);

CREATE TABLE Employee (
Employee_ID int not null,
Department_ID int not null,
Shift_ID int not null,
EType  varchar(25),
ESalary int,
EEmail varchar(255),
ELastName varchar(255),
EFirstName varchar(255),
ESex varchar(255),
EAge int not null,
primary KEY(Employee_ID),
foreign KEY(Department_ID)references Department(Department_ID),
foreign KEY(Shift_ID)references SHIFT(Shift_ID)
);

CREATE TABLE ROOMS(
Rooms_ID int not null,
Rperiod date,
Room_price int,
primary KEY(Rooms_ID)
);

CREATE TABLE PATIENT(
Patient_ID int not null,
Rooms_ID int not null,
PSex varchar(255),
PFirst_Name varchar(255),
PLast_Name varchar(255),
PAddress varchar(255),
P_Birth_date date,
Discharged varchar(255),
Admitted varchar(255),
PAge int not null,
primary KEY(Patient_ID),
foreign KEY(Rooms_ID)references ROOMS(Rooms_ID)
);
CREATE TABLE P_PHONENUMBER(
Patient_ID int not null,
P_Phone_Number char(11),
primary KEY(Patient_ID),
foreign KEY(Patient_ID)references PATIENT(Patient_ID)
);
CREATE TABLE MEDICINE(
Medicine_ID int not null,
Price int,
Quantity varchar(255),
primary KEY(Medicine_ID)
);
CREATE TABLE NURSE(
Nurse_ID int not null,
NPhone_Number char(11),
N_Salary int not null,
NHistory varchar(255),
NEmail varchar(255),
NAddress varchar(255),
N_Degree varchar(255),
NSex varchar(255),
N_LastName varchar(255),
N_FirstName varchar(255),
primary KEY(Nurse_ID)
);
CREATE TABLE LABORATORY(
LAB_ID int not null,
LType varchar(255),
primary KEY(LAB_ID)
);
CREATE TABLE ROOMTYPE(
Rooms_ID int not null,
Room_type varchar(255),
primary KEY(Rooms_ID),
foreign KEY(Rooms_ID)references ROOMS(Rooms_ID)
);
CREATE TABLE PRESCRIPTION(
Prescription_ID int not null,
Patient_ID int not null,
Doctor_ID int not null,
P_Time time,
Fee int,
P_Date date,
primary KEY(Prescription_ID),
foreign KEY(Patient_ID)references PATIENT(Patient_ID),
foreign KEY(Doctor_ID)references DOCTOR(Doctor_ID)
);

CREATE TABLE DESK_CLERK(
Clerk_ID int not null,
Clerk_Num char(11),
CFirst_Name varchar(255),
CLast_Name varchar(255),
primary KEY(Clerk_ID)
);

CREATE TABLE SURGERY(
Op_ID int not null,
SDepartment varchar(255),
Op_price int,
STime time,
primary KEY(Op_ID)
);

CREATE TABLE APPOINTMENT(
Patient_ID int not null,
ATime time,
ADate date,
Atype varchar(255),
primary KEY(Patient_ID),
foreign KEY(Patient_ID)references PATIENT(Patient_ID)
);

CREATE TABLE ATTEND(
Doctor_ID int not null,
Op_ID int not null,
Surgery_Count int,
primary KEY(Doctor_ID,Op_ID),
foreign KEY(Doctor_ID)references DOCTOR(Doctor_ID),
foreign KEY(Op_ID)references SURGERY(Op_ID)
);




--TABLE1
INSERT INTO EQUIPMENT VALUES(137,'Defibrillators','Thoracic surgery');
INSERT INTO EQUIPMENT VALUES(138,'Anesthesia Machines','Anesthesia');
INSERT INTO EQUIPMENT VALUES(139,'Patient Monitors','Patient care');
INSERT INTO EQUIPMENT VALUES(140,'Sterilizers','Surgery Care');
INSERT INTO EQUIPMENT VALUES(141,'EKG Machines','EKG');
INSERT INTO EQUIPMENT VALUES(142,'ECG Machines','ECG');
INSERT INTO EQUIPMENT VALUES(143,'EEG Machines','EEG');
INSERT INTO EQUIPMENT VALUES(144,'Surgical Tables','Surgery Care');
INSERT INTO EQUIPMENT VALUES(145,'Surgical Lights','Surgery Care');
INSERT INTO EQUIPMENT VALUES(146,'Scan Machines','X-Ray');
INSERT INTO EQUIPMENT VALUES(147,'Ultrasaound Machine','Ultrasound');
INSERT INTO EQUIPMENT VALUES(148,'Scan Machine','Scan');
INSERT INTO EQUIPMENT VALUES(149,'MRI Machine','MRI');
INSERT INTO EQUIPMENT VALUES(150,'Tomogrpahy Machine','Tomography');
INSERT INTO EQUIPMENT VALUES(151,'Dexa Scan Machine','Dexa Scan Room');
INSERT INTO EQUIPMENT VALUES(152,'Blanket and Fluid Warmers','Surgery Care');


select * from EQUIPMENT;

--UPDATE the equipment_id=151 from the EQUIPMENT table
UPDATE equipment
SET e_name='Dexa Scan Machine', e_type='DexaScan'
WHERE equipment_id=151;

--DELETE the equipment_id=152 from the EQUIPMENT table
DELETE FROM equipment
WHERE equipment_id=152;

--TABLE2
INSERT INTO Rooms VALUES(214,'2021-06-8',5000);
INSERT INTO Rooms VALUES(215,'2021-07-10',1000);
INSERT INTO Rooms VALUES(216,'2021-08-12',2000);
INSERT INTO Rooms VALUES(217,'2021-09-15',2000);
INSERT INTO Rooms VALUES(218,'2021-10-22',2500);
INSERT INTO Rooms VALUES(219,'2021-04-30',1500);
INSERT INTO Rooms VALUES(220,'2021-11-7',1800);
INSERT INTO Rooms VALUES(221,'2021-12-12',2100);
INSERT INTO Rooms VALUES(222,'2021-01-8',3300);
INSERT INTO Rooms VALUES(223,'2021-06-9',2500);
INSERT INTO Rooms VALUES(224,'2021-03-2',1200);
INSERT INTO Rooms VALUES(225,'2021-04-5',2300);
INSERT INTO Rooms VALUES(226,'2021-04-15',2800);
INSERT INTO Rooms VALUES(227,'2021-04-11',3400);
INSERT INTO Rooms VALUES(228,'2021-04-12',3500);
INSERT INTO Rooms VALUES(229,'2021-04-13',2900);
INSERT INTO Rooms VALUES(230,'2021-04-14',3200);

select * from rooms;

--UPDATE the rooms_id=225 from the Rooms table
UPDATE rooms
SET rperiod='2021-04-5', room_price='7700'
WHERE rooms_id=225;

--DELETE the rooms_id=226 from the Rooms table
DELETE FROM rooms
WHERE rooms_id=226;

--TABLE3
INSERT INTO ROOMTYPE VALUES(214,'X-Ray');
INSERT INTO ROOMTYPE VALUES(215,'EEG');
INSERT INTO ROOMTYPE VALUES(216,'EKG');
INSERT INTO ROOMTYPE VALUES(217,'MRI');
INSERT INTO ROOMTYPE VALUES(218,'ECG');
INSERT INTO ROOMTYPE VALUES(219,'IVP');
INSERT INTO ROOMTYPE VALUES(220,'CT-Scan');
INSERT INTO ROOMTYPE VALUES(221,'KUB');
INSERT INTO ROOMTYPE VALUES(222,'Mammogram');
INSERT INTO ROOMTYPE VALUES(223,'Ultrasound');
INSERT INTO ROOMTYPE VALUES(224,'Upper-GI');
INSERT INTO ROOMTYPE VALUES(225,'DexaScan');
INSERT INTO ROOMTYPE VALUES(226,'Scan');
INSERT INTO ROOMTYPE VALUES(227,'Intensive Care Room');
INSERT INTO ROOMTYPE VALUES(228,'Emergency Room');
INSERT INTO ROOMTYPE VALUES(229,'Opearting Room');
INSERT INTO ROOMTYPE VALUES(230,'Blood Collection Unit');

select * from roomtype;

--UPDATE the rooms_id=225 from the roomtype table
UPDATE roomtype
SET room_type='Dexa Scan'
WHERE rooms_id=225;

--DELETE the rooms_id=226 from the roomtype table
DELETE FROM roomtype
where  rooms_id=226 ;

--TABLE4
INSERT INTO Medicine VALUES(2365,30.20,'Aspirin');
INSERT INTO Medicine VALUES(2366,40.50,'Morphine');
INSERT INTO Medicine VALUES(2367,12,'Insulin');
INSERT INTO Medicine VALUES(2368,21,'Penicillin');
INSERT INTO Medicine VALUES(2369,29,'Antibiotics');
INSERT INTO Medicine VALUES(2370,34,'Anthihistaminal');
INSERT INTO Medicine VALUES(2371,42,'Antiacids');
INSERT INTO Medicine VALUES(2372,53,'Acetominophen');
INSERT INTO Medicine VALUES(2373,45.5,'Decongestant');
INSERT INTO Medicine VALUES(2374,34.4,'Metformin');
INSERT INTO Medicine VALUES(2375,52.5,'Amlodipin');
INSERT INTO Medicine VALUES(2376,64.7,'Salbutamol');

select * from medicine;

--UPDATE the medicine_id=2372 from the Medicine table
UPDATE medicine
SET price='60.40', quantity='Acetominophen'
WHERE medicine_id=2372;

--Delete the medicine_id=2376 from the Medicine table
DELETE from medicine
WHERE medicine_id=2376;

--TABLE5
insert into employee VALUES(40, 1, 123, 'Secretary', 6000, 'rg40@gmail.com', 'Green', 'Rachel', 'Female', 35);
insert into employee VALUES(41, 5, 456, 'Cleaning staff', 5000, 'mg41@gmail.com', 'Geller', 'Monica', 'Female', 40);
insert into employee VALUES(42, 17, 789, 'Cleaning staff', 5500, 'rb42@gmail.com', 'Burke', 'Richard', 'Male', 52);
insert into employee VALUES(43, 3, 642, 'technical service', 7000, 'pb43@gmail.com', 'Buffay', 'Phoebe', 'Female', 35);
insert into employee VALUES(44, 12, 594, 'technical service', 7000, 'cb44@gmail.com', 'Bing', 'Chandler', 'Male', 39);
insert into employee VALUES(45, 21, 232, 'finance officer', 7500, 'jt45@gmail.com', 'Tribbiani', 'Joey', 'Male', 35);
insert into employee VALUES(46, 22, 314, 'IT officer', 6000, 'jh46@gmail.com', 'Hosenstein', 'Janice', 'Female', 37);
insert into employee VALUES(47, 23, 556, 'Aux health personnel', 7000, 'st47@gmail.com', 'Tuttle', 'Sarah', 'Female', 35);
insert into employee VALUES(48, 11, 784, 'Secretary', 6500, 'pb48@gmail.com', 'Becker', 'Pete', 'Male', 27);
insert into employee VALUES(49, 16, 242, 'Cleaning staff', 5000, 'cw49@gmail.com', 'Wheeler', 'Charlie', 'Female', 45);
insert into employee VALUES(50, 8, 156, 'Cleaning staff', 6000, 'ps50@gmail.com', 'Stevens', 'Paul', 'Male', 47);
insert into employee VALUES(51, 8, 389, 'Secretary', 7000, 'hs51@gmail.com', 'Stevens', 'Heckles', 'Male', 55);
insert into employee VALUES(52, 2, 123, 'Secretary', 7200, 'mw52@gmail.com', 'Warburton', 'Melissa', 'Female', 23);
insert into employee VALUES(53, 15, 456, 'technical service', 8000, 'cl53@gmail.com', 'Lynch', 'Chandler', 'Female', 25);
insert into employee VALUES(54, 18, 789, 'technical service', 6500, 'rb54@gmail.com', 'Bing', 'Ryan', 'Male', 39);
insert into employee VALUES(55, 23, 642, 'Cleaning staff', 4000, 'ms55@gmail.com', 'Sheen', 'Michael', 'Male', 46);
insert into employee VALUES(56, 4, 594, 'Aux health personnel', 7300, 'jt56@gmail.com', 'Tufle', 'Jhon', 'Male', 35);
insert into employee VALUES(57, 4, 784, 'Secretary', 5000, 'rw57@gmail.com', 'Waltham', 'Reese', 'Female', 30);
insert into employee VALUES(58, 5, 242, 'Aux health personnel', 5000, 'uk58@gmail.com', 'Kudrow', 'Ursula', 'Female', 28);
insert into employee VALUES(59, 13, 156, 'Aux health personnel', 7000, 'st59@gmail.com', 'Tuttle', 'Sarah', 'Female', 35);
insert into employee VALUES(60, 19, 389, 'Aux health personnel', 7200, 'ag60@gmail.com', 'Geller', 'Mike', 'Male', 25);
insert into employee VALUES(61, 22, 123, 'Accountant',6000, 'grey23@gmail.com', 'Grey', 'Hunter', 'Male', 35);
insert into employee VALUES(62, 20, 456, 'Receptionist', 7000, 'ajjo@gmail.com', 'Angeline', 'Joole', 'Female', 40);
insert into employee VALUES(63, 25, 789, 'Physiotherapist', 10000, 'as34@gmail.com', 'Angy', 'Leaf', 'Male', 35);
insert into employee VALUES(64, 26, 789, 'Audiologist', 5000, 'cm45@gmail.com', 'James', 'Charles', 'Male', 38);
insert into employee VALUES(65, 5, 123, 'Midwife', 7000, 'dt12@gmail.com', 'David', 'Thomas', 'Male', 38);
insert into employee VALUES(66, 23, 456, 'Dialysis Staff', 8500, 'ag23@gmail.com', 'Angeline', 'Good', 'Female',23 );
insert into employee VALUES(67, 29, 642, 'Dental Prosthesis Tech', 9600, 'rr56@gmail.com', 'Ruth', 'Rook', 'Female',28 );
insert into employee VALUES(68, 15, 156, 'Anesthetist', 10000, 'cb56@gmail.com', 'Christopher', 'Book', 'Male', 32);
insert into employee VALUES(69, 28, 594, 'Pharmacy Staff', 3400, 'pd89@gmail.com', 'Paul', 'Donald', 'Male', 38);
insert into employee VALUES(70, 11, 784, 'Dietician', 7600, 'kb34@gmail.com', 'Karen', 'Betty', 'Female', 42);
insert into employee VALUES(71, 27, 156, 'Emergency Care Tech', 5400, 'hc12@gmail.com', 'Helen', 'Coolen', 'Female', 23);

select * from employee;

--Update the employee_id=45 from the employee table
update employee
SET department_id=21, shift_id=232, etype='finance officer', esalary=4800, eemail='jt45@gmail.com', elastname='Tribbiani', efirstname='Joey', esex='Male', eage='35'
WHERE employee_id=45;

--Delete the employee_id=61 from the employee table
DELETE FROM employee
WHERE employee_id=61;

--Delete the employee_id=62 from the employee table
DELETE FROM employee
WHERE employee_id=62;

--TABLE6
INSERT INTO Shift VALUES(123,'19:30:00','2021-04-5','9:30:30');
INSERT INTO Shift VALUES(456,'16:45:30','2021-04-6','8:30:30');
INSERT INTO Shift VALUES(789,'19:30:30','2021-04-7','9:00:00');
INSERT INTO Shift VALUES(642,'18:35:46','2021-04-8','7:30:30');
INSERT INTO Shift VALUES(594,'19:45:30','2021-04-9','9:30:00');
INSERT INTO Shift VALUES(232,'20:30:45','2021-04-10','10:30:00');
INSERT INTO Shift VALUES(314,'20:30:30','2021-04-11','8:45:45');
INSERT INTO Shift VALUES(556,'17:30:30','2021-04-12','8:59:59');
INSERT INTO Shift VALUES(784,'18:30:00','2021-04-13','8:45:45');
INSERT INTO Shift VALUES(242,'19:45:45','2021-04-14','10:30:30');
INSERT INTO Shift VALUES(156,'20:45:45','2021-04-15','7:00:00');
INSERT INTO Shift VALUES(389,'19:30:00','2021-04-16','7:30:30');
INSERT INTO Shift VALUES(444,'18:30:00','2021-04-15','8:45:45');
INSERT INTO Shift VALUES(447,'15:30:00','2021-04-13','5:30:00');
INSERT INTO Shift VALUES(558,'19:30:30','2021-04-17','13:45:30');
INSERT INTO Shift VALUES(985,'16:30:30','2021-04-11','8:59:59');
INSERT INTO Shift VALUES(449,'17:30:30','2021-04-11','9:59:59');

select * from shift;

--Update the shift_id=389 from the shift table
UPDATE shift
SET send='19:30:00', sdate='2021-04-16', sstart='7:30:30'
WHERE shift_id=389;

--Delete the shift_id=444 from the shift table
DELETE FROM shift
WHERE shift_id=444;


--TABLE7
insert into Doctor VALUES(1,'Organa', 'Leia', 'Los Angeles', 15500, 'Examination', '05282425', 'lo1@gmail.com', 'Female', 1, 'DR.', 24,1);
insert into Doctor VALUES(2,'Vader', 'Darth', 'Las Vegas', 16600, 'Operation', '05245675', 'dv2@gmail.com', 'Male', 15, 'Prof. DR.', 57,2);
insert into Doctor VALUES(3,'Skywalker', 'Luke', 'Las Vegas', 13000, 'Examination', '05782345', 'ls3@gmail.com', 'Male', 3, 'Assoc. Prof. DR.', 35,3);
insert into Doctor VALUES(4,'Kenobi', 'Obi-Wan', 'San Francisco', 18200, 'Examination', '05762458', 'ovk4@gmail.com', 'Male', 4, 'Assoc. Prof. DR.', 50,4);
insert into Doctor VALUES(5,'Solo', 'Han', 'San Francisco', 10200, 'Operation', '05856275', 'hs5@gmail.com', 'Male', 15, 'Prof. DR.', 50,5);
insert into Doctor VALUES(6,'Solo', 'Chewbacca', 'San Francisco', 15500, 'Operation', '05156489', 'cs6@gmail.com', 'Male', 6, 'DR.', 36,6);
insert into Doctor VALUES(7,'D2', 'R2', 'Mexico', 12000, 'Examination', '05632456', 'rd7@gmail.com', 'Female', 7, 'Exp. DR.', 29,7);
insert into Doctor VALUES(8,'Scherbatsky', 'Robin', 'San Francisco', 14000, 'Opeartion', '055631465', 'rs8@gmail.com', 'Female', 8, 'DR.', 32,8);
insert into Doctor VALUES(9,'Aldrin', 'Lily', 'Mexico', 14000, 'Examination', '05321896', 'la9@gmail.com', 'Female', 9, 'Assoc. Prof. DR.', 33,9);
insert into Doctor VALUES(10,'Eriksen', 'Marshall', 'Mexico', 18200, 'Operation', '05798421', 'me10@gmail.com', 'Male', 15, 'DR.', 35,10);
insert into Doctor VALUES(11,'McConnell', 'Tracy', 'Los Angeles', 13000, 'Examination', '05386748', 'tc11@gmail.com', 'Female', 11, 'DR.', 40,11);
insert into Doctor VALUES(12,'Stinson', 'Barney', 'San Francisco', 13000, 'Operation', '05452368', 'bs12@gmail.com', 'Male', 15, 'Prof. DR.', 42,12);
insert into Doctor VALUES(13,'katherine', 'Gavin', 'New Jersey', 15000, 'Operation', '05454668', 'gk13@gmail.com', 'Male', 13, 'Prof. DR.', 48,13);
insert into Doctor VALUES(14,'Lucifer', 'Morningstar', 'New Jersey', 17000, 'Operation', '05454668', 'gk13@gmail.com', 'Male', 13, 'Prof. DR.', 48,14);
insert into Doctor VALUES(15,'Dan', 'Espinoza', 'Mexico', 18000, 'Operation', '05493611', 'de19@gmail.com', 'Male', 15, 'Prof. DR.', 49,15);
insert into Doctor VALUES(16,'Chloe', 'Decker', 'San Francisco', 19000, 'Operation', '05833013', 'cd34@gmail.com', 'Female', 15, 'Prof. DR.', 50,16);
insert into Doctor VALUES(17,'Linda', 'Martin', 'New Jersey', 20000, 'Operation', '05611935', 'lm45@gmail.com', 'Female', 15, 'Assoc. Prof. DR.', 42,17);
insert into Doctor VALUES(18,'Elle', 'Lopez', 'Los Angeles', 22000, 'Operation', '05743477', 'el89@gmail.com', 'Female', 15, 'Prof. DR.', 32,18);
insert into Doctor VALUES(19,'Trixy', 'Espinoza', 'San Francisco', 25000, 'Operation', '05962345', 'te23@gmail.com', 'Female', 15, 'DR.', 35,20);

select * from doctor;

--Update the doctor_id=5 from the Doctor table
UPDATE doctor
SET dlast_name='Solo', dfirst_name='Han', daddress='Miami', d_salary=10200, d_job='Operation', dphone_number=5856275, doctor_mail='hs5@gmail.com', dsex='Male', room_number='5', d_title='Prof. DR.', d_age=50
WHERE doctor_id=5;

--Delete the doctor_id=13 from the Doctor table
DELETE FROM doctor
WHERE doctor_id=13;

--Add department_ID to doctor table
ALTER TABLE doctor ADD COLUMN Department_ID int NOT null;

--View
--Lists the doctor whose age is smaller than 36
create view D_Ageler as 
select DFirst_Name, DLast_Name,d_age 
from doctor
where doctor.d_age <'36';
--update view
UPDATE D_Ageler
 SET d_age=35
 WHERE dfirst_name = 'Lily';
--delete view
delete from D_Ageler where d_age='42';

select * from D_Ageler ;

--View
--List the doctors who has greater than 10000 salary
create view Dr_salary as 
select doctor.dfirst_name, doctor.DLast_Name,d_salary 
from doctor
where  doctor.D_Salary >'10000';
--update view
UPDATE Dr_salary
 SET d_salary=17000
 WHERE dfirst_name = 'Barney';
--delete view
delete from Dr_salary where d_salary=15000;

select * from Dr_salary;

--TABLE8
INSERT INTO PATIENT VALUES(1147483654,214,'Women','Aylin', 'Aksoy', 'Bilkent/Ankara', '2000-04-12', 'Yes','Yes',21);
INSERT INTO PATIENT VALUES(1390999834,215,'Man','Deniz', 'Yılmaz', 'Batıkent/Ankara', '1998-03-31', 'Yes','No',23);
INSERT INTO PATIENT VALUES(1746352898,216, 'Women','Sedef', 'Erol', 'Ümitköy/Ankara', '1995-05-05', 'No','Yes', 26);
INSERT INTO PATIENT VALUES(1637297832,217,'Man','Kerem', 'Aydınlı', 'Keçiören/Ankara','1889-06-19','No','No',32);
INSERT INTO PATIENT VALUES(1526745959,218, 'Man','Oktay', 'Sever', 'Bahçeli/Ankara', '1996-08-17', 'Yes','No',  25);
INSERT INTO PATIENT VALUES(1093754672,219,'Women','Nilüfer', 'Akışka', 'Mamak/Ankara','2001-07-28','No','No', 20);
INSERT INTO PATIENT VALUES(1840965234,220, 'Man','Alican', 'Polat', 'Etlik/Ankara', '1997-10-14', 'Yes','Yes', 24);
INSERT INTO PATIENT VALUES(1849722525,221, 'Women','Tülin', 'Akkaya', 'Akyurt/Ankara','1998-08-30','Yes','No', 23);
INSERT INTO PATIENT VALUES(1904983663,222, 'Man','Ömer', 'Atik', 'Sincan/Ankara', '1999-02-15','No','No',22);
INSERT INTO PATIENT VALUES(1093987474,223, 'Man','Kemal', 'Erbaş', 'Altındağ/Ankara','1985-01-24','Yes','Yes',36);
INSERT INTO PATIENT VALUES(1255385372,224, 'Women','Zeynep', 'Kaya', 'Yaşamkent/Ankara','1985-01-22','No','Yes',37);
INSERT INTO PATIENT VALUES(1925648958,214, 'Man','Taner', 'Berker', 'Ümitköy/Ankara','1999-03-28','Yes','Yes',27);
INSERT INTO PATIENT VALUES(1015792837,215, 'Women','Öykü', 'Çalışkan', 'Çankaya/Ankara','1985-08-25','Yes','Yes',24);
INSERT INTO PATIENT VALUES(1993526837,216, 'Man','Mehmet', 'Açık', 'Etimesgut/Ankara','1985-09-28','Yes','Yes',27);
INSERT INTO PATIENT VALUES(1129453322,217, 'Women','Merve', 'Yalçın', 'Keçiören/Ankara','1985-11-21','Yes','Yes',40);
INSERT INTO PATIENT VALUES(1862113456,218, 'Man','Murat', 'Boz', 'Yaşamkent/Ankara','1985-10-12','Yes','Yes',39);

select * from patient;

--Update the patient_id=1840965234 from the Patient table
UPDATE public.patient
SET psex='Man', pfirst_name='Alican', plast_name='Polat', paddress='Etlik/Ankara', p_birth_date='1997-10-14', discharged='No', admitted='Yes', page='24', rooms_id=220
WHERE patient_id=1840965234;

--Delete the patient_id=1093983452 from the Patient table
DELETE FROM patient
WHERE patient_id=1093983452;

--TABLE9
INSERT INTO APPOINTMENT VALUES(1147483654, '9:30:00', '2021-04-20', 'MR');
INSERT INTO APPOINTMENT VALUES(1390999834, '9:45:00', '2021-04-20', 'Annual diabetes checks');
INSERT INTO APPOINTMENT VALUES(1746352898, '10:30:30','2021-04-22', 'SkinCheck');
INSERT INTO APPOINTMENT VALUES(1637297832, '11:30:00','2021-04-18', 'Emergency Appointments');
INSERT INTO APPOINTMENT VALUES(1526745959, '11:45:00','2021-04-27', 'RoutineAppointments');
INSERT INTO APPOINTMENT VALUES(1093754672, '12:35:00','2021-04-11', 'MR');
INSERT INTO APPOINTMENT VALUES(1840965234, '13:20:00','2021-04-18', 'Minor Illness');
INSERT INTO APPOINTMENT VALUES(1849722525, '13:30:00','2021-04-19', 'Checkup');
INSERT INTO APPOINTMENT VALUES(1904983663, '14:30:00','2021-04-20', 'MR');
INSERT INTO APPOINTMENT VALUES(1093987474, '15:30:00','2021-04-25', 'Endoscopy');
INSERT INTO APPOINTMENT VALUES(1925648958, '16:45:00','2021-04-20', 'MR');
INSERT INTO APPOINTMENT VALUES(1015792837, '17:25:45','2021-04-27', 'MR');
INSERT INTO APPOINTMENT VALUES(1255385372, '18:35:45','2021-04-28', 'Checkup');
INSERT INTO APPOINTMENT VALUES(1993526837, '19:25:35','2021-04-20', 'MR');
INSERT INTO APPOINTMENT VALUES(1129453322, '20:25:45','2021-04-30', 'MR');
INSERT INTO APPOINTMENT VALUES(1862113456, '21:30:00','2021-04-20', 'MR');



select * from appointment;

--UPDATE the patient_id=1390999834 from the APPOINTMENT table
UPDATE appointment
SET atime='9:45:00', adate='2021-04-20', atype='Annual diabetes checks'
WHERE patient_id=1390999834;

--DELETE the patient_id=1093981232 from the APPOINTMENT table
DELETE FROM appointment
WHERE patient_id=1093981232;

--View
--List the patient whose patient_id is 1093987474
create view appointVi as
select PFirst_Name,PLast_Name, ADate, Atype
from patient, appointment
where patient.patient_id ='1093987474' and appointment.patient_id ='1093987474'
insert into appointVi values('Alice','Damy','2021-08-03','MR')


 select * from appointVi;


--TABLE10
insert into p_phonenumber VALUES(1147483654, '05563546886');
insert into p_phonenumber VALUES(1390999834, '05465863757');
insert into p_phonenumber VALUES(1746352898, '05723586418');
insert into p_phonenumber VALUES(1637297832, '05768456816');
insert into p_phonenumber VALUES(1526745959, '05356481274');
insert into p_phonenumber VALUES(1093754672, '05425687373');
insert into p_phonenumber VALUES(1840965234, '05145238684');
insert into p_phonenumber VALUES(1849722525, '05725352896');
insert into p_phonenumber VALUES(1904983663, '05464236887');
insert into p_phonenumber VALUES(1093987474, '05335562448');
insert into p_phonenumber VALUES(1093987474, '05927466333');

select * from p_phonenumber;

--UPDATE the patient_id=1093754672 from the p_phonenumber table
UPDATE p_phonenumber
SET patient_id=1093754672, p_phone_number='05425687124'
WHERE patient_id=1093754672;

--Delete the patient_id=1093754672 from the p_phonenumber table
DELETE FROM p_phonenumber
WHERE patient_id=1093754672;


--TABLE11

INSERT INTO PRESCRIPTION VALUES(701,1147483654, 1, '9:40:00', 150, '2021-04-14');
INSERT INTO PRESCRIPTION VALUES(702,1390999834, 2, '9:30:00', 175, '2021-04-20');
INSERT INTO PRESCRIPTION VALUES(703,1746352898, 3, '10:30:00', 200,'2021-04-16');
INSERT INTO PRESCRIPTION VALUES(704,1637297832, 4, '12:45:00', 250,'2021-04-13');
INSERT INTO PRESCRIPTION VALUES(705,1526745959, 5, '14:30:00', 125,'2021-04-21');
INSERT INTO PRESCRIPTION VALUES(706,1093754672, 6, '11:30:00', 150,'2021-04-27');
INSERT INTO PRESCRIPTION VALUES(707,1840965234, 7, '14:30:00', 200,'2021-04-30');
INSERT INTO PRESCRIPTION VALUES(708,1849722525, 8, '16:30:00', 250,'2021-04-28');
INSERT INTO PRESCRIPTION VALUES(709,1904983663, 9, '11:30:00', 175,'2021-04-16');
INSERT INTO PRESCRIPTION VALUES(710,1093987474, 10,'10:30:00', 200,'2021-04-12');
INSERT INTO PRESCRIPTION VALUES(711,1093987474, 11,'12:30:00', 220,'2021-04-13');

select * from prescription;

--UPDATE the patient_id=1526745959 from the PRESCRIPTION table
UPDATE prescription
SET patient_id=1526745959, doctor_id=5, p_time='14:30:00', fee='131                                                                                                                                                                                                                                                           ', p_date='2021-04-27'
WHERE prescription_id=705;

--DELETE the prescription_id=711 from the PRESCRIPTION table
DELETE FROM prescription
WHERE prescription_id=711;

--TABLE12
insert into laboratory VALUES(100, 'Microbiology');
insert into laboratory VALUES(110, 'Biochemistry');
insert into laboratory VALUES(120, 'Microbiology');
insert into laboratory VALUES(130, 'Hematology');
insert into laboratory VALUES(140, 'Pathology');
insert into laboratory VALUES(150, 'Biochemistry');
insert into laboratory VALUES(160, 'Biochemistry');
insert into laboratory VALUES(170, 'Immunology');
insert into laboratory VALUES(180, 'Pathology');
insert into laboratory VALUES(190, 'Biochemistry');
insert into laboratory VALUES(200, 'Serology');
insert into laboratory VALUES(210, 'Biochemistry');
insert into laboratory VALUES(220, 'Immunology');
insert into laboratory VALUES(221, 'Microbiology');
insert into laboratory VALUES(222, 'SurgicalPathology');

select * from laboratory;

--Delete the lab_id=221 from the laboratory table
DELETE from laboratory
WHERE lab_id=221;

--update the lab_id=222 from the laboratory table
update laboratory
SET ltype='Surgical Pathology'
WHERE lab_id=222;

--TABLE13
insert into desk_clerk VALUES(5121367, 'Clerk_1', 'Walter', 'White');
insert into desk_clerk VALUES(7921647, 'Clerk_2', 'Jesse', 'Pinkman');
insert into desk_clerk VALUES(3254615, 'Clerk_3', 'Gustavo', 'Fring');
insert into desk_clerk VALUES(3245617, 'Clerk_4', 'Hank', 'Schrader');
insert into desk_clerk VALUES(7214655, 'Clerk_5', 'Jane', 'Margolis');
insert into desk_clerk VALUES(7789542, 'Clerk_6', 'Skyler', 'White');
insert into desk_clerk VALUES(3221511, 'Clerk_7', 'Huell', 'Babineaux');
insert into desk_clerk VALUES(6556627, 'Clerk_8', 'Mike', 'Ehrmantraut');
insert into desk_clerk VALUES(7994562, 'Clerk_9', 'Saul', 'Goodman');
insert into desk_clerk VALUES(1254788, 'Clerk_10', 'Marry', 'Schrader');
insert into desk_clerk VALUES(4123778, 'Clerk_11', 'John', 'Schwats');

select * from desk_clerk;

--Delete the clerk_id=4123778 from the desk_clerk table
DELETE FROM desk_clerk
WHERE clerk_id=4123778;

--UPDATE the clerk_num='Clerk_6 from the desk_clerk table
UPDATE desk_clerk
SET clerk_num='Clerk_6', cfirst_name='Skyler', clast_name='Black'
WHERE clerk_id=7789542;

--TABLE14
insert into attend VALUES(2, 32, 3);
insert into attend VALUES(5, 33, 2);
insert into attend VALUES(6, 34, 9);
insert into attend VALUES(8, 35, 5);
insert into attend VALUES(10,36, 2);
insert into attend VALUES(12, 37, 4);
insert into attend VALUES(14, 38, 3);
insert into attend VALUES(15, 39, 6);
insert into attend VALUES(16, 40, 6);
insert into attend VALUES(17, 41, 8);
insert into attend VALUES(18, 42, 4);
insert into attend VALUES(19, 43, 5);

select * from attend;

--Delete the doctor_id=12 AND op_id=37 from the attend table
DELETE FROM attend
WHERE doctor_id=12 AND op_id=37;

--Update the doctor_id=10 AND op_id=42 from the attend table
UPDATE attend
SET surgery_count='8'
WHERE doctor_id=10 AND op_id=42;
   
--TABLE15
INSERT INTO Surgery VALUES(32,'Plastic surgery',10000,'9:40:15','Aesthetic');
INSERT INTO Surgery VALUES(33,'Cardiac surgery',4500,'20:15:30','Heart Care');
INSERT INTO Surgery VALUES(34,'Brain surgery',4500,'17:30:30','Neurology');
INSERT INTO Surgery VALUES(35,'Eye Surgery',3500,'12:45:30','Eye Care');
INSERT INTO Surgery VALUES(36,'GeneralSurgery',5500,'8:30:30','General Care');
INSERT INTO Surgery VALUES(37,'Pediatric Surgery',3500,'18:30:45','Pediatric Care');
INSERT INTO Surgery VALUES(38,'Thoracic Surgery',4200,'11:45:30','Heart Care');
INSERT INTO Surgery VALUES(39,'Orthopedic Surgery',3300,'13:30:30','Orthopedic Care');
INSERT INTO Surgery VALUES(40,'Trauma Surgery',6700,'14:45:30','Brain Care');
INSERT INTO Surgery VALUES(41,'Vascular Surgery',5600,'10:25:30','Cardiac Care');
INSERT INTO Surgery VALUES(42,'Robotic Surgery',3800,'15:30:30','Robotic Care');
INSERT INTO Surgery VALUES(43,'Ophthalmological Surgery',3500,'8:45:20','Oncology Care');
INSERT INTO Surgery VALUES(44,'PlasticSurgery',3800,'9:30:30','Aesthetic');
select * from surgery;

--Update the 32th op_id from surgery table
UPDATE surgery
SET sdepartment='Plastic surgery', op_price='10000', stime='9:40:15'
WHERE op_id=32;

--Delete the 44th op_id from surgery table
DELETE FROM surgery
WHERE op_id=44;

--Alter
--Alter the surgery table and add surgeryName to it.
alter table surgery 
add surgeryName varchar(255);

--View
--Combining the attend and surgery table, it lists the operations with an operation fee greater than 3700.
create view forval_4 as
select surgery.op_id,op_price,sdepartment
from surgery 
inner join attend  on surgery .op_id = attend .op_id 
where op_price >'3700';


select *from forval_4;

--TABLE16
INSERT INTO DEPARTMENT VALUES(1,'Neurology',200);
INSERT INTO DEPARTMENT VALUES(2,'Orthopedics',190);
INSERT INTO DEPARTMENT VALUES(3,'Cardiology',195);
INSERT INTO DEPARTMENT VALUES(4,'Nephrology',222);
INSERT INTO DEPARTMENT VALUES(5,'Gynaecological Diseases',212);
INSERT INTO DEPARTMENT VALUES(6,'Gastroenterology',189);
INSERT INTO DEPARTMENT VALUES(7,'Urology',225);
INSERT INTO DEPARTMENT VALUES(8,'Pathology',222);
INSERT INTO DEPARTMENT VALUES(9,'Oncology',225);
INSERT INTO DEPARTMENT VALUES(10,'Psychiatry',225);
INSERT INTO DEPARTMENT VALUES(11,'Nutrition',190);
INSERT INTO DEPARTMENT VALUES(12,'Endocrinology',225);
INSERT INTO DEPARTMENT VALUES(13,'Cardiology',225);
INSERT INTO DEPARTMENT VALUES(14,'Nefrology',198);
INSERT INTO DEPARTMENT VALUES(15,'GeneralSurgery',225);
INSERT INTO DEPARTMENT VALUES(16,'Otorhinolaryngology',188);
INSERT INTO DEPARTMENT VALUES(17,'Cardiovascular surgery',225);
INSERT INTO DEPARTMENT VALUES(18,'Dermatology',175);
INSERT INTO DEPARTMENT VALUES(19,'Eye Diseases',225);
INSERT INTO DEPARTMENT VALUES(20,'Pediatric Surgery',225);
INSERT INTO DEPARTMENT VALUES(21,'Finance',225);
INSERT INTO DEPARTMENT VALUES(22,'Computing',225);
INSERT INTO DEPARTMENT VALUES(23,'Dialysis',225);
INSERT INTO DEPARTMENT VALUES(24,'Rehabilitation',225);
INSERT INTO DEPARTMENT VALUES(25,'Physiotherapist',225);
INSERT INTO DEPARTMENT VALUES(26,'Audiologist',225);
INSERT INTO DEPARTMENT VALUES(27,'Technical Service',225);
INSERT INTO DEPARTMENT VALUES(28,'Pharmacy',225);
INSERT INTO DEPARTMENT VALUES(29,'Dental Service',225);

select * from department;

--Delete the 9th department_id from department table
DELETE FROM department
WHERE department_id=9;

--Delete the 24th department_id from department table
DELETE FROM department
WHERE department_id=24;

--Update the 20th departmentname and dep_capacity from department table
UPDATE public.department
SET departmentname='Pediatric Surgery', dep_capacity='240'
WHERE department_id=20;

--Alter
--Alter the department table with adding patient_id
alter table department 
add Patient_ID int;


--TABLE17
INSERT INTO NURSE VALUES(101, 11223344556, 4.500, 'Hacettepe Üniversitesi Mezunu', 'semagül@gmail.com', 'Etlik/Ankara', '25 years', 'Woman', 'Gül', 'Sema',52);
INSERT INTO NURSE VALUES(102, 22114455661, 5.000, 'Ufuk Üniversitesi Mezunu', 'fatmaoztekin@gmail.com', 'Altındağ/Ankara', '2 years', 'Woman', 'Öztekin', 'Fatma',23);
INSERT INTO NURSE VALUES(103, 16645874455, 3.500, 'Ankara Üniversitesi Mezunu', 'alminakacar@gmail.com', 'Akyurt/Ankara', '35 years', 'Woman', 'Kacar', 'Almina',54);
INSERT INTO NURSE VALUES(104, 11447755221, 2.500, 'Dicle Üniversitesi Mezunu', 'hilalbozdogan@gmail.com', 'Bahçeli/Ankara', '12 years', 'Woman', 'Bozdogan', 'Hilal',35);
INSERT INTO NURSE VALUES(105, 113366225541,3.250, 'Koç Üniversitesi Mezunu', 'elifgüzel@gmail.com', 'Batıkent/Ankara', '4 years', 'Woman', 'Güzel', 'Elif',29);
INSERT INTO NURSE VALUES(106, 154785522336,2.750, 'Konya Üniversitesi Mezunu', 'hamidekemer@gmail.com', 'Sincan/Ankara', '8 years', 'Woman', 'Kemer', 'Hamide',23);
INSERT INTO NURSE VALUES(107, 115544225476,3.250, 'Giresun Üniversitesi Mezunu', 'zerrinmas@gmail.com', 'Bilkent/Ankara', '45 years', 'Woman', 'Mas', 'Zerrin',23);
INSERT INTO NURSE VALUES(109, 15462578452, 3.125, 'Başkent Üniversitesi Mezunu', 'nursensari@gmail.com', 'Eryaman/Ankara', '5 years', 'Woman', 'Sari', 'Nursen',60);
INSERT INTO NURSE VALUES(110, 85412365412, 3.450, 'Yalova Sağlık Meslek Lisesi Mezunu', 'aysekuck@gmail.com', 'Mamak/Ankara', '36 years', 'Woman', 'Kucuk', 'Ayse',28);
INSERT INTO NURSE VALUES(111, 25413698741, 4.200, 'Mersin Üniversitesi Mezunu', 'cerentek@gmail.com', 'Etlik/Ankara', '11 years', 'Woman', 'Tek', 'Ceren',28);
INSERT INTO NURSE VALUES(112, 86516380745, 3.500, 'Kayseri Üniversitesi Mezunu', 'nazlimutlu@gmail.com', 'Ayaş/Ankara', '5 years', 'Woman', 'Mutlu', 'Nazlı',30);
INSERT INTO NURSE VALUES(113, 45112685412, 3.750, 'Akdeniz Üniversitesi Mezunu', 'handekiray@gmail.com', 'Tunalı/Ankara', '7 years', 'Woman', 'Kıray', 'Hande',30);
INSERT INTO NURSE VALUES(114, 45111234456, 3.900, 'Doğu-Beyazıt Üniversitesi Mezunu', 'akıntaha@gmail.com', 'Yaşamkent/Ankara', '8 years', 'Man', 'Taha', 'Akın',35);

select * from nurse;

--update nurse which nurse_id is 111
UPDATE nurse
SET nphone_number='25413698741', n_salary='6.600', nhistory='Mersin Üniversitesi Mezunu', nemail='cerentek@gmail.com', naddress='Etlik/Ankara', n_degree='11 years', nsex='Women', n_lastname='Tek', n_firstname='Ceren'
WHERE nurse_id=111;

--delete nurse which nurse_id is 114
DELETE FROM nurse
WHERE nurse_id=114;

--Alter
--add nurse table NAge with the alter
alter table nurse 
add NAge int;

--View
--List all the nurse_id and nurse names
create view info1 as
select nurse_id,n_firstname,n_lastname,nage 
from nurse;

insert into nurse values('115');
--view update
UPDATE info1
 SET NAge = '25'
 WHERE nurse_id = 112;
--delete view
delete from info1 where NAge='54';

select *from info1;
















