-- 1. Provide a SQL script that initializes the database for the Pet Adoption Platform ”PetPals”
-- 2. Create tables for pets, shelters, donations, adoption events, and participants
-- 3. Define appropriate primary keys, foreign keys, and constraints
drop database Pet_Pals;
create database Pet_Pals;

use Pet_Pals;

create table Pets
(
Pet_ID int primary key,
Name varchar(15),
Age int,
Breed varchar(20),
Type varchar(20),
Available_For_Adoption enum('YES', 'NO'),
Owner_ID int
);

insert into Pets (Pet_ID, Name, Age, Breed, Type, Available_For_Adoption, Owner_ID) values
(2001, 'Buddy', 3, 'GoldenRetriever', 'Dog', 'YES', 101),
(2002, 'Whiskers', 2, 'Siamese', 'Cat', 'NO', 102),
(2003, 'Chirpy', 1, 'Parakeet', 'Bird', 'YES', 103),
(2004, 'Spike', 5, 'Bulldog', 'Dog', 'YES', 104),
(2005, 'Mittens', 4, 'Persian', 'Cat', 'NO', 105),
(2006, 'Nibbles', 1, 'Guinea Pig', 'Rodent', 'YES', 106),
(2007, 'Flash', 2, 'Husky', 'Dog', 'YES', 107),
(2008, 'Shadow', 7, 'Labrador', 'Dog', 'NO', 108),
(2009, 'Sassy', 3, 'Tabby', 'Cat', 'YES', 109),
(2010, 'Fluffy', 6, 'Angora', 'Rabbit', 'YES', 110);

select * from Pets;

create table Shelters
(
Shelter_ID int primary key,
Name varchar(40),
Location varchar(50)
);

insert into Shelters (Shelter_ID, Name, Location) values
(3001, 'Happy Tails Shelter', '123 Main St, Springfield'),
(3002, 'Furry Friends Haven', '456 Elm St, Riverside'),
(3003, 'Safe Paws Rescue', '789 Oak Ave, Centerville'),
(3004, 'Pets Haven', '321 Pine Rd, Greenfield'),
(3005, 'Hopeful Hearts Shelter', '111 Birch Blvd, Riverdale'),
(3006, 'Rescue Me', '222 Willow St, Plainview'),
(3007, 'Pawsitive Vibes', '333 Maple Ave, Springfield'),
(3008, 'Four Paws Shelter', '444 Cedar Dr, Rivertown'),
(3009, 'Animal Angels', '555 Pine Ln, Westview'),
(3010, 'Faithful Friends', '666 Oakwood Dr, Northfield');

select * from Shelters;

SHOW TABLES;

create table Donations
(
Donation_ID int primary key,
Donar_Name varchar(20),
Donation_Type Enum('CASH','ITEM'),
Donation_Amount decimal(10,2),
Donation_Item varchar(20),
Donation_Date date
);

insert into Donations (Donation_ID, Donar_Name, Donation_Type, Donation_Amount, Donation_Item, Donation_Date) values
(4001, 'John', 'CASH', 100.00, 'N/A', '2024-11-01'),
(4002, 'Jane', 'ITEM', 0.00, 'Dog Food', '2024-11-05'),
(4003, 'Emily', 'CASH', 200.00, 'N/A', '2024-11-07'),
(4004, 'Michael', 'ITEM', 0.00, 'Cat Toys', '2024-11-10'),
(4005, 'Sarah', 'CASH', 50.00, 'N/A', '2024-11-12'),
(4006, 'David', 'ITEM', 0.00, 'Dog Beds', '2024-11-13'),
(4007, 'Lucy Kim', 'CASH', 75.00, 'N/A', '2024-11-15'),
(4008, 'Robert Martinez', 'ITEM', 0.00, 'Cat Food', '2024-11-17'),
(4009, 'Laura Chen', 'CASH', 120.00, 'N/A', '2024-11-18'),
(4010, 'James Allen', 'ITEM', 0.00, 'Dog Toys', '2024-11-19');

select * from Donations;

create table Adoption_Events
(
Event_ID int primary key,
Event_Name varchar(50),
Event_Date date,
Location varchar(40)
);

insert into Adoption_Events (Event_ID, Event_Name, Event_Date, Location) values
(5001, 'Paws for Love Adoption Fair', '2024-12-01', 'Community Park'),
(5002, 'Happy Tails Adoption Day', '2024-12-1', 'Shelter Grounds'),
(5003, 'Forever Homes Event', '2024-12-20', 'City Mall Courtyard'),
(5004, 'Find A Friend', '2025-01-05', 'Green Park'),
(5005, 'Rescue & Rehome', '2025-01-10', 'Downtown Shelter'),
(5006, 'Pet Adoption Drive', '2025-01-12', 'Community Hall'),
(5007, 'Fur-ever Friends', '2025-01-20', 'Westside Plaza'),
(5008, 'Open Hearts Adoption', '2025-01-25', 'Public Library'),
(5009, 'Shelter Showcase', '2025-01-30', 'City Square'),
(5010, 'Adopt A Paw', '2025-02-05', 'Eastwood Community Center');

select * from Adoption_Events;

create table Participants
(
Participant_ID int primary key,
Participant_Name varchar(30),
Participant_Type varchar(30),
Event_ID int,
foreign key (Event_ID) references Adoption_Events(Event_ID)
);

insert into Participants (Participant_ID, Participant_Name, Participant_Type, Event_ID) values
(9001, 'Happy Tails Shelter', 'Shelter', 5002),
(9002, 'Jane Smith', 'Adopter', 5009),
(9003, 'Furry Friends Haven', 'Shelter', 5001),
(9004, 'Emily Brown', 'Adopter', 5002),
(9005, 'Safe Paws Rescue', 'Shelter', 5004),
(9006, 'Michael Johnson', 'Adopter', 5003),
(9007, 'Pawsitive Vibes', 'Shelter', 5008),
(9008, 'John Doe', 'Adopter', 5003),
(9009, 'Pets Haven', 'Shelter', 5008),
(9010, 'Sarah Lee', 'Adopter', 5002);

select * from Participants;

-- TASKS :  

-- 4. Ensure the script handles potential errors, such as if the database or tables already exist
      drop database Pet_Pals;
      
/* 5. Write an SQL query that retrieves a list of available pets (those marked as available for adoption)
from the "Pets" table. Include the pet's name, age, breed, and type in the result set. Ensure that
the query filters out pets that are not available for adoption */

select Name, Age, Breed, type 
from Pets 
where Available_For_Adoption = b'1';

/* 6. Write an SQL query that retrieves the names of participants (shelters and adopters) registered
for a specific adoption event. Use a parameter to specify the event ID. Ensure that the query
joins the necessary tables to retrieve the participant names and types */

select p.Participant_Name, p.Participant_Type
from Participants p
join Adoption_Events e on p.Event_ID = e.Event_ID
where e.Event_ID = @Event_ID;

/* 7. Create a stored procedure in SQL that allows a shelter to update its information (name and
location) in the "Shelters" table. Use parameters to pass the shelter ID and the new information.
Ensure that the procedure performs the update and handles potential errors, such as an invalid
shelter ID. */

select date_format(Donation_Date, '%y-%m') as monthyear,
       sum(Donation_Amount) as Total_Donation_Amount
from Donations
group by Monthyear;

/* 8. Write an SQL query that calculates and retrieves the total donation amount for each shelter (by
shelter name) from the "Donations" table. The result should include the shelter name and the
total donation amount. Ensure that the query handles cases where a shelter has received no
donations */

select s.name AS Shelter_Name, coalesce(SUM(d.Donation_Amount), 0) as Total_Donation
from Shelters s
left join Donations d on s.Shelter_ID = d.Donation_ID
group by s.Name;

/* 9. Write an SQL query that retrieves the names of pets from the "Pets" table that do not have an
owner (i.e., where "OwnerID" is null). Include the pet's name, age, breed, and type in the result
set */

select Name, Age, Breed, Type
from Pets
where Owner_ID is null;

/* 10. Write an SQL query that retrieves the total donation amount for each month and year (e.g.,
January 2023) from the "Donations" table. The result should include the month-year and the
corresponding total donation amount */

select format(Donation_Date, 'MMMM yyyy') as Month_Year, 
       sum(Donation_Amount) as Total_Donation_Amount
from Donations
group by format(Donation_Date, 'MMMM yyyy')
order by min(Donation_Date);

/* 11. Retrieve a list of distinct breeds for all pets that are either aged between 1 and 3 years or older
than 5 years */ 

select distinct Breed
from Pets
where (Age between 1 and 3) or Age > 5;

/* 12. Retrieve a list of pets and their respective shelters where the pets are currently available for
adoption */

select Name, Age, Breed, Type
from Pets
where Available_For_Adoption = '1' and Owner_ID is null;

/* 13. Find the total number of participants in events organized by shelters located in specific city.
Example: City=Chennai*/

select COUNT(*) as Total_Participants 
from Participants p
join Adoption_Events e on p.Event_ID = e.Event_ID
join Shelters s on e.Location = s.Location
where s.Location = 'Chennai';

/* 14. Retrieve a list of unique breeds for pets with ages between 1 and 5 years.*/

select distinct Breed
from Pets
where Age between 1 and 5;

/* 15. Find the pets that have not been adopted by selecting their information from the 'Pet' table*/

select Pet_ID, Name, Age, Breed, Type
from Pets
where Owner_ID is null;

/* 16. Retrieve the names of all adopted pets along with the adopter's name from the 'Adoption' and
'User' tables.*/

select p.Name as Pet_Name, u.name as Adopter_Name
from Pets p
join Adoption on p.Pet_iID = Adoption.Pet_ID
join Users u on Adoption.User_ID = u.User_ID
where p.Adopted = '1';

/* 17. Retrieve a list of all shelters along with the count of pets currently available for adoption in each
shelter*/

select s.name AS shelter_name, e.event_name 
FROM shelters s
CROSS JOIN adoption_events e;

/* 18. Find pairs of pets from the same shelter that have the same breed.*/

select p1.Name as Pet1_name, p2.Name as pet2_name, p1.Breed, s.Name as Shelter_Name
from Pets p1
join Pets p2 on p1.Shelter_ID = p2.Shelter_ID and p1.Breed = p2.Breed and p1.Pet_ID < p2.Pet_ID
join Shelters s on p1.Shelter_ID = s.Shelter_ID;

/* 19. List all possible combinations of shelters and adoption events.*/

select s.Name as Shelter_Name, e.Event_Name as Event_Name
from Shelters s
cross join Adoption_Events e;

/* 20. Determine the shelter that has the highest number of adopted pets.*/

select s.Name as Shelter_Name, count(p.Pet_ID) as Number_Of_Adopted_Pets
from Shelters s
join Pets p on s.Shelter_ID = p.Shelter_ID
where p.Owner_ID is not null
group by s.Shelter_ID
order by Number_Of_Adopted_Pets desc
limit 1;