create database  Car_Rental_System;

use Car_Rental_System;

create table Vehicle (
Vehicle_ID varchar(50) primary key ,
Make varchar(50),
Model  varchar(20) ,
Daily_Rate int not null, 
Status enum ('AVAILABLE','NOTAVAILABLE') not null,
Passenger_Capacity int,
Engine_Capacity varchar(10)
);

insert into Vehicle (Vehicle_ID, Make, Model, Daily_Rate, Status, Passenger_Capacity, Engine_Capacity) values
('VH001A', 'Mahindra', 'Thar 2022', 85.00, 'AVAILABLE', 4, 2.2),
('VH002B', 'Mahindra', 'Bolero 2021', 60.00, 'NOTAVAILABLE', 7, 1.5),
('VH003C', 'Toyota', 'Camry 2023', 90.00, 'AVAILABLE', 5, 2.5),
('VH004D', 'Hyundai', 'Tucson 2022', 75.00, 'AVAILABLE', 5, 2.0),
('VH005E', 'Ford', 'Mustang 2020', 120.00, 'NOTAVAILABLE', 4, 5.0),
('VH006F', 'Chevrolet', 'Spark 2019', 50.00, 'AVAILABLE', 4, 1.0),
('VH007G', 'Nissan', 'Altima 2021', 85.00, 'NOTAVAILABLE', 5, 2.5),
('VH008H', 'Honda', 'Civic 2022', 70.00, 'AVAILABLE', 5, 1.8),
('VH009I', 'BMW', 'X5 2023', 140.00, 'AVAILABLE', 5, 3.0),
('VH010J', 'Jeep', 'Wrangler 2021', 110.00, 'NOTAVAILABLE', 4, 3.6),
('VH011K', 'Audi', 'Q7 2022', 150.00, 'AVAILABLE', 7, 3.0),
('VH012L', 'Volkswagen', 'Passat 2021', 80.00, 'AVAILABLE', 5, 2.0),
('VH013M', 'Kia', 'Sorento 2022', 78.00, 'NOTAVAILABLE', 7, 2.4),
('VH014N', 'Mazda', 'CX-5 2023', 72.00, 'AVAILABLE', 5, 2.5),
('VH015O', 'Renault', 'Duster 2021', 65.00, 'AVAILABLE', 5, 1.5),
('VH016P', 'Ford', 'Explorer 2020', 100.00, 'NOTAVAILABLE', 7, 3.0),
('VH017Q', 'Toyota', 'Highlander 2023', 105.00, 'AVAILABLE', 7, 3.5),
('VH018R', 'Chevrolet', 'Tahoe 2022', 130.00, 'AVAILABLE', 7, 5.3),
('VH019S', 'Honda', 'CR-V 2021', 75.00, 'AVAILABLE', 5, 1.5),
('VH020T', 'Hyundai', 'Santa Fe 2020', 82.00, 'NOTAVAILABLE', 5, 2.4);

select * from Vehicle;

create table Customer(
Customer_ID varchar(10) primary Key,
First_Name varchar(50),
Last_Name varchar(50),
Email varchar(50),
User_ID varchar(20),
Password varchar(50),
Aadhar_Number bigint,
Phone_Number bigint
);

insert into Customer (Customer_ID, First_Name, Last_Name, Email, User_ID, Password, Aadhar_Number, Phone_Number) values
('CU001TN', 'Arun', 'Kumar', 'arun.kumar@example.com', 'arun_kumar', 'Arun@123', 123456789012, 9876543210),
('CU002TN', 'Priya', 'Subramani', 'priya.subramani@example.com', 'priya_subramani', 'Priya@456', 234567890123, 9876543211),
('CU003TN', 'Vijay', 'Raghavan', 'vijay.raghavan@example.com', 'vijay_raghavan', 'Vijay@789', 345678901234, 9876543212),
('CU004TN', 'Lakshmi', 'Iyer', 'lakshmi.iyer@example.com', 'lakshmi_iyer', 'Lakshmi@101', 456789012345, 9876543213),
('CU005TN', 'Suresh', 'Muthuraj', 'suresh.muthuraj@example.com', 'suresh_muthuraj', 'Suresh@102', 567890123456, 9876543214),
('CU006TN', 'Kavitha', 'Ravi', 'kavitha.ravi@example.com', 'kavitha_ravi', 'Kavitha@103', 678901234567, 9876543215),
('CU007TN', 'Rajesh', 'Narayanan', 'rajesh.narayanan@example.com', 'rajesh_narayanan', 'Rajesh@104', 789012345678, 9876543216),
('CU008TN', 'Deepa', 'Krishnan', 'deepa.krishnan@example.com', 'deepa_krishnan', 'Deepa@105', 890123456789, 9876543217),
('CU009TN', 'Anand', 'Mohan', 'anand.mohan@example.com', 'anand_mohan', 'Anand@106', 901234567890, 9876543218),
('CU010TN', 'Meena', 'Venkatesan', 'meena.venkatesan@example.com', 'meena_venkatesan', 'Meena@107', 112345678901, 9876543219),
('CU011TN', 'Ganesh', 'Pillai', 'ganesh.pillai@example.com', 'ganesh_pillai', 'Ganesh@108', 223456789012, 9876543220),
('CU012TN', 'Revathi', 'Ramesh', 'revathi.ramesh@example.com', 'revathi_ramesh', 'Revathi@109', 334567890123, 9876543221),
('CU013TN', 'Saravanan', 'Murthy', 'saravanan.murthy@example.com', 'saravanan_murthy', 'Saravanan@110', 445678901234, 9876543222),
('CU014TN', 'Divya', 'Balu', 'divya.balu@example.com', 'divya_balu', 'Divya@111', 556789012345, 9876543223),
('CU015TN', 'Manoj', 'Kannan', 'manoj.kannan@example.com', 'manoj_kannan', 'Manoj@112', 667890123456, 9876543224),
('CU016TN', 'Aishwarya', 'Sundar', 'aishwarya.sundar@example.com', 'aishwarya_sundar', 'Aishwarya@113', 778901234567, 9876543225),
('CU017TN', 'Prakash', 'Rajan', 'prakash.rajan@example.com', 'prakash_rajan', 'Prakash@114', 889012345678, 9876543226),
('CU018TN', 'Ranjani', 'Gopal', 'ranjani.gopal@example.com', 'ranjani_gopal', 'Ranjani@115', 990123456789, 9876543227),
('CU019TN', 'Balaji', 'Vasudevan', 'balaji.vasudevan@example.com', 'balaji_vasudevan', 'Balaji@116', 101234567890, 9876543228),
('CU020TN', 'Shankar', 'Perumal', 'shankar.perumal@example.com', 'shankar_perumal', 'Shankar@117', 212345678901, 9876543229);

select * from Customer;

create table Lease(
lease_ID varchar(15) primary key,
Vehicle_ID char(7) not null, 
Customer_ID char(8) not null, 
Start_Date date not null,
End_Date date not null,
Type varchar(15) not null,
foreign key (Vehicle_ID) references Vehicle(vehicle_ID),
foreign key (Customer_ID) references Customer(Customer_ID)
);

insert into Lease (Lease_ID, Vehicle_ID, Customer_ID, Start_Date, End_Date, Type) values
('LE001', 'VH001A', 'CU001TN', '2024-11-01', '2024-11-10', 'Dailylease'),
('LE002', 'VH003C', 'CU002TN', '2024-11-05', '2024-11-15', 'Dailylease'),
('LE003', 'VH005E', 'CU003TN', '2024-11-01', '2024-12-01', 'Monthlylease'),
('LE004', 'VH008H', 'CU004TN', '2024-11-08', '2024-11-18', 'Dailylease'),
('LE005', 'VH011K', 'CU005TN', '2024-11-01', '2024-12-01', 'Monthlylease'),
('LE006', 'VH006F', 'CU006TN', '2024-11-10', '2024-11-20', 'Dailylease'),
('LE007', 'VH018R', 'CU007TN', '2024-11-15', '2024-12-15', 'Monthlylease'),
('LE008', 'VH014N', 'CU008TN', '2024-11-11', '2024-11-21', 'Dailylease'),
('LE009', 'VH019S', 'CU009TN', '2024-11-18', '2024-12-18', 'Monthlylease'),
('LE010', 'VH013M', 'CU010TN', '2024-11-05', '2024-11-15', 'Dailylease'),
('LE011', 'VH004D', 'CU011TN', '2024-11-02', '2024-11-12', 'Dailylease'),
('LE012', 'VH017Q', 'CU012TN', '2024-11-09', '2024-11-19', 'Dailylease'),
('LE013', 'VH015O', 'CU013TN', '2024-11-04', '2024-11-14', 'Dailylease'),
('LE014', 'VH010J', 'CU014TN', '2024-11-12', '2024-12-12', 'Monthlylease'),
('LE015', 'VH002B', 'CU015TN', '2024-11-03', '2024-11-13', 'Dailylease'),
('LE016', 'VH012L', 'CU016TN', '2024-11-07', '2024-11-17', 'Dailylease'),
('LE017', 'VH007G', 'CU017TN', '2024-11-20', '2024-12-20', 'Monthlylease'),
('LE018', 'VH016P', 'CU018TN', '2024-11-06', '2024-11-16', 'Dailylease'),
('LE019', 'VH020T', 'CU019TN', '2024-11-13', '2024-12-13', 'Monthlylease'),
('LE020', 'VH009I', 'CU020TN', '2024-11-14', '2024-11-24', 'Dailylease');

select * from Lease;

create table Payment (
Payment_ID varchar(25) primary key,
Lease_ID varchar(20) not null,
Payment_Date date not null,
Amount decimal(10, 2) not null,
foreign key (Lease_ID) references Lease(Lease_ID)
);

insert into Payment (Payment_ID, Lease_ID, Payment_Date, Amount) values
('PAY001', 'LE001', '2024-01-15', 425.00),
('PAY002', 'LE002', '2024-02-28', 2520.00),
('PAY003', 'LE003', '2024-03-10', 600.00),
('PAY004', 'LE004', '2024-04-30', 2250.00),
('PAY005', 'LE005', '2024-05-20', 700.00),
('PAY006', 'LE006', '2024-06-30', 4500.00),
('PAY007', 'LE007', '2024-07-15', 375.00),
('PAY008', 'LE008', '2024-08-31', 2015.00),
('PAY009', 'LE009', '2024-09-10', 525.00),
('PAY010', 'LE010', '2024-10-31', 2325.00),
('PAY011', 'LE011', '2024-11-07', 420.00),
('PAY012', 'LE012', '2024-11-30', 1125.00),
('PAY013', 'LE013', '2024-12-07', 300.00),
('PAY014', 'LE014', '2025-01-31', 2170.00),
('PAY015', 'LE015', '2025-02-10', 1100.00),
('PAY016', 'LE016', '2025-03-31', 2480.00),
('PAY017', 'LE017', '2025-04-07', 504.00),
('PAY018', 'LE018', '2025-05-31', 3100.00),
('PAY019', 'LE019', '2025-06-07', 910.00),
('PAY020', 'LE020', '2025-07-31', 2625.00);

select * from Payment;