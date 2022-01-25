--Special query1
--List the patients who stays in hospital and their departments where the patient has MR appointment today. Your output must be grouped by department
select patient.patient_id , MAX(department.dep_capacity) as average_capacity, PFirst_Name, PLast_Name, department.departmentname, Atype,appointment.adate
from patient
inner join appointment 
     on  appointment.patient_id = patient.patient_id
inner join department
     on department.patient_id = patient.patient_id     
where appointment.atype = 'MR' and appointment.adate='2021-04-20'
group by patient.patient_id ,department.departmentname, Atype,appointment.adate
order by patient.pfirst_name DESC ;
 

--SPECIAL QUERY2
--List the doctor information (name, ssn, department, title, job etc.) and their surgery count where the doctor works at general surgery department
    Select Doctor.DFirst_Name, Doctor.DLast_Name, Doctor.Doctor_ID, Doctor.DAddress, Doctor.D_Title, Doctor.D_Job , Attend.Surgery_Count
   From Doctor
   Join department on Doctor.department_id= department.department_id 
   Left Join ATTEND on  Doctor.Doctor_ID = ATTEND.Doctor_ID
   WHERE ATTEND.Doctor_ID is not null and department.departmentname='GeneralSurgery'
   order by dfirst_name;


--two table inner join
--Combines the rooms and roomtype tables and list the room_price in descending order
select rooms.rooms_id,rooms.Room_price,roomtype.room_type
FROM rooms 
inner join roomtype on roomtype.rooms_id=rooms.rooms_id
order by rooms.room_price DESC;


--three tables join
--Lists the surgery fee of all doctors who underwent the operation.
Select Surgery.Op_ID, Op_price,  Doctor.Doctor_ID, DFirst_Name,Dlast_Name,Attend.Surgery_Count,Surgery.sdepartment 
   From SURGERY
   Join ATTEND on SURGERY.Op_ID = ATTEND.Op_ID
   Left Outer Join Doctor on ATTEND.Doctor_ID = Doctor.Doctor_ID
   order by dfirst_name;
  
  
--right outer join  
--starting times of all shifts and the name and surname of the employees who has the shifts.
SELECT employee.efirstname as Employee_Name,employee.elastname as Employee_Surname , shift.sstart as Starting_Time
FROM employee
RIGHT JOIN shift ON employee.shift_id = shift.shift_id 
ORDER BY employee.efirstname;

-- FULL OUTER JOIN
--List All doctors and their surgery counts
SELECT distinct doctor.DFirst_Name , attend.Surgery_Count 
FROM doctor
FULL OUTER JOIN attend ON doctor.doctor_id = attend.doctor_id 
ORDER BY doctor.DFirst_Name ;


--one subquery that returns multiple rows
--it shows the nurses which have grater than 3900 salary
select NURSE.N_FirstName, NURSE.N_LastName, NURSE.NEmail from NURSE
where Nurse_ID in (select Nurse_ID from NURSE where '3900' < N_Salary);

select * from nurse;

--Scalar Subquery
--ASC
--List all departments along with the number of employees in each department 
 select Department_ID,department.departmentname,
       (select count(*) 
        from employee
        where department.department_id = employee.department_id)
      as num_employees
 from department
order by department_id ASC;

--FROM CLAUSE SUBQUERY
--Lists the all unique d_title's and take average to their salary between 12000 and 18000
select d_title , d_salary
from ( select d_title, avg (doctor.d_salary)
from doctor
group by d_title)
as dept_avg (d_title, d_salary)
where d_salary between 12000 and 18000;

--Names of doctors who live in Los Angeles and have job to examination or,  who live in San Francisco and have job to operation.
select DFirst_Name, DLast_Name    
from doctor 
where DAddress  = 'Los Angeles' and D_Job = 'Examination' or 
      DFirst_Name in (select DFirst_Name   
                      from doctor
                      where DAddress  = 'San Francisco' and D_Job = 'Operation' )
                     order by DFirst_Name;
                    
--EXISTS
--Lists the patient fee which is bigger than 199 with the patient_id
SELECT patient_id,fee
FROM prescription 
WHERE EXISTS (SELECT patient_id FROM patient WHERE patient.patient_id = prescription.patient_id and fee > '199');
                    
  

--NOT EXISTS
--Lists the empty rooms which patient does not exist
SELECT Rooms_ID,room_price FROM ROOMS AS r WHERE NOT EXISTS
(SELECT * FROM PATIENT AS p WHERE r.Rooms_ID = p.Rooms_ID); 
 
--LIKE
--String Operations
--List the drugs that start with A in order to be able to edit the hospital records.
SELECT * FROM Medicine
WHERE quantity LIKE 'A%';

  
 --not in
--Get the average price of the rooms where the roomType is not X-Ray.
SELECT  MAX(Room_price)  
FROM rooms 
inner join roomtype
      on rooms.rooms_id = roomtype.rooms_id 
WHERE rooms.rooms_id NOT IN 
    (SELECT rooms_id 
     FROM roomtype
     WHERE Room_type = 'X-Ray');
    
--IS NULL
--It shows the patient_id which is null with their departmentname with the dep_capacity
SELECT department.dep_capacity,department.departmentname
FROM department 
WHERE department.patient_id IS NULL;

--Count the patients which is not null
SELECT COUNT(patient_id)
FROM patient
where patient_id is not null;
    
    
--is not null
--Lists employees over 30 years of age and with salaries between 3000 and 5000.
select distinct employee.employee_id,employee.efirstname,employee.elastname,employee.eage,employee.esalary 
from employee
where employee.employee_id is not null and employee.esalary between 3000 and 5000 and employee.eage>'30';
  
  
--MIN
--Lists the N_Salary which have salary smaller than 3.500 after that with the MIN query it chooses the smallest one inside the salaries smaller than 3500
SELECT  MIN(N_Salary) as minSalary
FROM nurse
where n_salary<'3500'
order by  MIN(N_Salary);
  

--inner join with department
--some
--Find the ID's and names of female employees with salary greater than that of some female employee in the Cardiology department 
select employee_id , EFirstName, elastname 
from employee 
where employee.esex = 'Female' and ESalary > some (select ESalary
                    from employee
                    inner join department 
                                 on employee.department_id = department.department_id
                    where department.departmentname  = 'Neurology' and employee.esex = 'Female')
 order by  employee_id;
 

--Counts the patients whose age is bigger than 24
SELECT COUNT(*)
FROM patient
where page > '24';


--ALL
--Find the departmant of the operation if all the records in the SURGERY has price either equal to 3500.
SELECT SDepartment as SurgeryDepartmant 
FROM SURGERY
WHERE Op_price  = ALL (SELECT Op_price
                       FROM SURGERY
                       WHERE op_price = '3500' );
  

--String Operations
--Remove the _ mark to prevent confusion in the system
select DESK_CLERK .Clerk_Num, UPPER(REPLACE(Clerk_Num,'_',' ')) as NewDeskClerk from DESK_CLERK;



 --In order not to confuse the phone numbers, it lists it with +90 in front of it.
select P_Phone_Number, (REPLACE(P_Phone_Number,'0','+90 ')) as TelNo from P_PHONENUMBER;


--Lists the Biochemistry ltype in the laboratory
select lab_id,ltype
from laboratory
where ltype='Biochemistry';
  

--Lists the nurse first name with the upper letters it aims to solve the prevent the confusion in the data
Select N_FirstName, N_LastName, 
UPPER(N_FirstName) 
from NURSE;

--female nurses whose names are at least 5 in length
select N_FirstName  as NurseName 
from nurse 
where N_FirstName like '_____%' and NSex = 'Woman';


--UNION
--with the union operator it combines all the values rooms_ID in rooms and patient
SELECT Rooms_ID FROM ROOMS 
UNION
SELECT Rooms_ID FROM PATIENT;
--INTERSECT
--with the intersect operator it takes the common rooms_ID in rooms and patient
SELECT Rooms_ID FROM ROOMS 
Intersect
SELECT Rooms_ID FROM PATIENT;
--EXCEPT
--with the except operator it takes the outside of the numbers in rooms_ID in rooms and patient
SELECT Rooms_ID FROM ROOMS 
Except
SELECT Rooms_ID FROM PATIENT;

--ANY
--The equipment table lists the types whose equipment type is surgery care.
SELECT e_type,e_name
FROM EQUIPMENT
WHERE equipment_id = ANY
  (SELECT equipment_id
  FROM EQUIPMENT
  WHERE e_type = 'Surgery Care');
  

--Determines shift_ids with 7 shift hours
select shift_id,sdate,send
from shift 
where send='19:30:30';











