create database Hospital_Management_System;

use Hospital_Management_System;

create table Doctor_Master
(
Doctor_ID varchar(15) not null primary key,
Doctor_Name varchar(15) not null,
Department varchar(15) not null
);

insert into Doctor_Master (Doctor_ID, Doctor_Name, Department) values
('D0001', 'Ram', 'ENT'),
('D0002', 'Rajan', 'ENT'),
('D0003', 'Smita', 'Eye'),
('D0004', 'Bhavan', 'Surgery'),
('D0005', 'Sheela', 'Surgery'),
('D0006', 'Nethra', 'Surgery');

select * from Doctor_Master;

create table Room_Master
(
Room_No varchar(15) primary key not null,
Room_Type varchar(15) not null,
Status varchar(15) not null
);

insert into Room_Master (Room_No, Room_Type, Status) values
('R0001', 'AC', 'Occupied'),
('R0002', 'Suite', 'Vacant'),
('R0003', 'Non-AC', 'Vacant'),
('R0004', 'Non-AC', 'Occupied'),
('R0005', 'AC', 'Vacant'),
('R0006', 'AC', 'Occupied');

select * from Room_Master;

create table Patient_Master
(
Pid varchar(15) primary key not null,
Name varchar(15) not null,
Age int not null,
Weight numeric(10,2) not null,
Gender varchar(10) not null,
Address varchar(50) not null,
Phone_Number varchar(10) not null,
Disease varchar(50) not null,
Doctor_ID varchar(5), 
foreign key (Doctor_ID) references Doctor_Master (Doctor_ID)
);

alter table Patient_Master rename column Pid to Patient_ID;

insert into Patient_Master (Pid, Name, Age, Weight, Gender, Address, Phone_Number, Disease, Doctor_ID) values
('P0001', 'Gita', 35, 65, 'F', 'Chennai', '9867145678', 'Eye Infection', 'D0003'),
('P0002', 'Ashish', 40, 70, 'M', 'Delhi', '9845675678', 'Asthma', 'D0003'),
('P0003', 'Radha', 25, 60, 'F', 'Chennai', '9867166678', 'Pain in heart', 'D0005'),
('P0004', 'Chandra', 28, 55, 'F', 'Bangalore', '9978675567', 'Asthma', 'D0001'),
('P0005', 'Goyal', 42, 65, 'M', 'Delhi', '8967533223', 'Pain in Stomach', 'D0004');

select * from Patient_Master;

create table Room_Allocation
(
Room_No varchar(15),
foreign key(Room_No) references Room_Master(Room_No),
Pid varchar(15),
foreign key(Pid) references Patient_Master(Pid),
Admission_Date date not null,
Release_Date date
);

insert into Room_Allocation(Room_No, Pid, Admission_Date, Release_Date) values
('R0001', 'P0001', '2016-10-15', '2016-10-16'),
('R0002', 'P0002', '2016-11-15', '2016-11-26'),
('R0002', 'P0003', '2016-12-01', '2016-12-30'),
('R0004', 'P0001', '2017-01-01', '2017-01-30');

alter table Room_Allocation rename column Pid to Patient_ID;

-- update Room_Allocation
-- set Release_Date = '2017-01-30'
-- where Room_No = 'R0004' and Pid = 'P0001' and Admission_Date = '2017-01-01';

-- insert into Room_Allocation (Room_No, Pid, Admission_Date, Release_Date) 
-- values ('R0004', 'P0001', '2017-01-01', '2017-01-30');

drop table Room_Allocation;

select * from Room_Allocation;

-- 1. Display the patients who were admitted in the month of january

select Patient_Master.Patient_ID, Patient_Master.Name from Patient_Master
join Room_Allocation on Room_Allocation.Patient_ID = Patient_Master.Patient_ID
where extract(month from Admission_Date) = 1;

-- 2. Display the female patient who is not suffering from ashma

select Patient_ID, Name from Patient_Master
where Gender = 'F' and Disease not like '%Asthma%';

-- 3. Count the number of male and female patients

select Gender, count(*) from Patient_Master
group by Gender;

-- 4. Display the patient_id,patient_name, doctor_id, doctor_name, room_no, room_type and admission_date(alias name)

select Patient_Master.Patient_ID, Patient_Master.Name, Doctor_Master.Doctor_ID, Doctor_Master.Doctor_Name,
Room_Master.Room_No, Room_Master.Room_Type, Room_Allocation.Admission_Date
from Patient_Master 
join Room_Allocation on Room_Allocation.Patient_ID = Patient_Master.Patient_ID
join Room_Master on Room_Master.Room_No = Room_Allocation.Room_No
join Doctor_Master on Doctor_Master.Doctor_ID = Patient_Master.Doctor_ID;

-- 5. Display the room_no which was never allocated to any patient

select Room_Master.Room_No
from Room_Master
left join Room_Allocation on Room_Allocation.Room_No = Room_Master.Room_No
where Room_Allocation.Room_No is null;

-- 6. Display the room_no, room_type which are allocated more than once

select Room_No, count(*) from Room_Allocation
group by Room_No having count(*) > 1;
