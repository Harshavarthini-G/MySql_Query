-- create schema and use it
create schema Training_Institute;
use Training_Institute;

-- courses table
create table Courses (
    Course_Code varchar(5) primary key, -- Primary Key
    Course_Name varchar(50),
    Duration_Days numeric(3),
    Course_Fee numeric(6),
    Prerequisite varchar(100)
);

insert into Courses (Course_Code, Course_Name, Duration_Days, Course_Fee, Prerequisite)
values
('CS101', 'Python Programming', 90, 15000, 'Basic Computer Knowledge'),
('CS102', 'Java Development', 120, 20000, 'Basic Programming Knowledge'),
('CS103', 'Full Stack Web Development', 180, 25000, 'HTML & CSS'),
('CS104', 'Data Science Fundamentals', 150, 30000, 'Python Programming Skills');

select * from Courses;

-- faculty table
create table Faculty (
    Faculty_ID varchar(5) primary key, -- Primary Key
    Faculty_Name varchar(50),
    Qualification varchar(30),
    Experience varchar(100)
);

insert into Faculty (Faculty_ID, Faculty_Name, Qualification, Experience)
values
('F001', 'John Smith', 'M.Tech Computer Science', '5 years in Software Development'),
('F002', 'Jane Doe', 'Ph.D. Artificial Intelligence', '10 years in Research'),
('F003', 'Alice Brown', 'M.Sc. IT', '3 years in Web Development Teaching');

select * from Faculty;

-- course_faculty_mapping table
create table Course_Faculty_Mapping (
    Faculty_ID varchar(5),
    Course_Code varchar(5),
    Grade char(1),
    constraint FK_CFM_Faculty foreign key (Faculty_ID) references Faculty(Faculty_ID), -- Foreign Key
    constraint FK_CFM_Course foreign key (Course_Code) references Courses(Course_Code) -- Foreign Key
);

insert into Course_Faculty_Mapping (Faculty_ID, Course_Code, Grade)
values
('F001', 'CS101', 'A'),
('F002', 'CS102', 'B'),
('F003', 'CS103', 'A'),
('F001', 'CS104', 'A');

-- batches table
create table Batches (
    Batch_ID varchar(5) primary key, -- Primary Key
    Course_Code varchar(5),
    Faculty_ID varchar(5),
    Start_Date date,
    End_Date date,
    Timing_Slot numeric(1),
    constraint FK_Batches_Course foreign key (Course_Code) references Courses(Course_Code), -- Foreign Key
    constraint FK_Batches_Faculty foreign key (Faculty_ID) references Faculty(Faculty_ID) -- Foreign Key
);

insert into Batches (Batch_ID, Course_Code, Faculty_ID, Start_Date, End_Date, Timing_Slot)
values
('B101', 'CS101', 'F001', '2024-01-10', '2024-04-10', 1),
('B102', 'CS102', 'F002', '2024-02-15', '2024-05-15', 2),
('B103', 'CS103', 'F003', '2024-03-20', '2024-08-20', 3);

-- students table
create table Students (
    Student_ID numeric(5) primary key, -- Primary Key
    Batch_ID varchar(5),
    Student_Name varchar(50),
    Gender char(1),
    Date_Joined date,
    Phone_Number varchar(10),
    Email varchar(50),
    constraint FK_Students_Batch foreign key (Batch_ID) references Batches(Batch_ID) -- Foreign Key
);

insert into Students (Student_ID, Batch_ID, Student_Name, Gender, Date_Joined, Phone_Number, Email)
values
(1001, 'B101', 'Arun Kumar', 'M', '2024-01-15', '9876543210', 'arun.kumar@example.com'),
(1002, 'B102', 'Priya Sharma', 'F', '2024-02-20', '9876543211', 'priya.sharma@example.com'),
(1003, 'B103', 'Rahul Mehta', 'M', '2024-03-25', '9876543212', 'rahul.mehta@example.com');

-- payments table
create table Payments (
    Student_ID numeric(5),
    Payment_Date date,
    Payment_Amount numeric(6),
    constraint FK_Payments_Student foreign key (Student_ID) references Students(Student_ID) -- Foreign Key
);


insert into Payments (Student_ID, Payment_Date, Payment_Amount)
values
(1001, '2024-01-20', 15000),
(1002, '2024-02-25', 20000),
(1003, '2024-03-30', 25000);
