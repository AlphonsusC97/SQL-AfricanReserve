create database africanreservedb;
use africanreservedb;

-- Create Tables
-- Create Table "Reserve"
create table Reserve(
ReserveID char(2),
ReserveName varchar(40),
ReserveLocation varchar(30),
ReserveSize int(3),
primary key(ReserveID));
-- Create Table "Vehicle"
create table Vehicle(
VehicleID char(2),
ReserveID char(2),
VehicleType varchar(20),
VehicleCapacity int(2),
VehicleRegoNum char(6),
primary key(VehicleID, ReserveID),
foreign key(ReserveID) references Reserve(ReserveID));
-- Create Table "Tour"
create table Tour(
TourID char(2),
TourName varchar(25),
TourCost decimal(5,2),
TourDuration int(1),
primary key(TourID));
-- Create Table "Staff"
create table Staff(
StaffID char(2),
StaffName varchar(30),
StaffPosition varchar(25),
StaffSalary decimal(8,2),
primary key(StaffID));
-- Create Table "Visitor Group"
create table VisitorGroup(
VisGroupID char(3),
VisGroupName varchar(25),
VisGroupCountry varchar(15),
VisGroupNumPeople int(2),
primary key(VisGroupID));
-- Create Table "Booking"
create table Booking(
BookingID char(3),
TourID char(2),
VehicleID char(2),
ReserveID char(2),
VisGroupID char(3),
StaffID char(2),
BookingDate date,
BookingTime time,
primary key(BookingID),
foreign key(TourID) references Tour(TourID),
foreign key(VehicleID, ReserveID) references Vehicle(VehicleID, ReserveID),
foreign key(StaffID) references Staff(StaffID),
foreign key(VisGroupID) references VisitorGroup(VisGroupID));
-- Create Table "Organisation"
create table Organisation(
OrganisationID char(3),
OrganisationName varchar(25),
OrganisationManager varchar(15),
OrgContactNumber varchar(15),
primary key(OrganisationID));
-- Create Table "Partnership"
create table Partnership(
ReserveID char(2),
OrganisationID char(3),
StartDate date,
EndDate date,
Amount decimal(10,2),
primary key(ReserveID, OrganisationID),
foreign key(ReserveID) references Reserve(ReserveID),
foreign key(OrganisationID) references Organisation(OrganisationID));
-- Create Table "TourPackage"
create table TourPackage(
PackageTourID char(2),
ComponentTourID char(2),
primary key(PackageTourID, ComponentTourID),
foreign key(PackageTourID) references Tour(TourID),
foreign key(ComponentTourID) references Tour(TourID));
-- Insert values
-- Insert values for "Reserve"
insert into Reserve values ('R1', 'Dwesa-Cwebe Nature Reserve', 'Eastern Cape Province', 545);

insert into Reserve values ('R2', 'Caledon Nature Reserve', 'Free State', 230);

insert into Reserve values ('R3', 'Hluhluwe--Umfolozi Game Reserve', 'KwaZulu-Natal', 960);

insert into Reserve values ('R4', 'Kruger National Park', 'Mpumalanga', 999);

insert into Reserve values ('R5', 'De Hoop Nature Reserve', 'Overberg', 340);

insert into Reserve values ('R6', 'Pilanesberg National Park', 'North West Province', 572);

insert into Reserve values ('R7', 'Blyde River Canyon Nature Reserve', 'Mpumalanga', 290);
-- Insert values for "Vehicle"
insert into Vehicle values ('V1', 'R1', 'Bus', 15, 'AVH287');

insert into Vehicle values ('V1', 'R2', 'Off-road 4WD', 8, 'FNG552');

insert into Vehicle values ('V1', 'R3', 'Off-road 4WD', 8, 'MQR858');

insert into Vehicle values ('V1', 'R4', 'Off-road 4WD', 8, 'LMV199');

insert into Vehicle values ('V1', 'R5', 'Van', 10, 'KEV022');

insert into Vehicle values ('V2', 'R1', 'Ute with cage', 6, 'JQB042');

insert into Vehicle values ('V2', 'R3', 'Van', 10, 'BGC222');

insert into Vehicle values ('V2', 'R4', 'Van', 10, 'HTO587');

insert into Vehicle values ('V2', 'R5', 'Ute with cage', 6, 'HMG835');

insert into Vehicle values ('V3', 'R3', 'Bus', 15, 'ZZB964');

insert into Vehicle values ('V3', 'R4', 'Bus', 15, 'UFB445');
-- Insert values for "Tour"
insert into Tour values ('T1', 'Premium Tour Package', 500.00, 6);

insert into Tour values ('T2', 'Standard Tour Package', 420.00, 5);

insert into Tour values ('T3', 'Whale Watching', 200.00, 3);

insert into Tour values ('T4', 'Hiking and Biking', 150.00, 1);

insert into Tour values ('T5', 'Safari', 250.00, 2);

insert into Tour values ('T6', 'Lake Cruise', 300.00, 2);

insert into Tour values ('T7', 'Shark Diving', 250.00, 2);
-- Insert values for "Staff"
insert into Staff values ('S1', 'Blake Lively', 'Reserve Manager', 120000.00);

insert into Staff values ('S2', 'Heath Ledger', 'Tour Guide', 70000.00);

insert into Staff values ('S3', 'Sheldon Cooper', 'Tour Guide', 70000.00);

insert into Staff values ('S4', 'Jessica Chastain', 'Senior Tour Guide', 80000.00);

insert into Staff values ('S5', 'Joaquin Phoenix', 'Junior Tour Guide', 90000.00);
-- Insert values for "VisitorGroup"
insert into VisitorGroup values ('VG1', 'Hugh Jackman', 'Australia', 1);

insert into VisitorGroup values ('VG2', 'Zoe Bell', 'New Zealand', 7);

insert into VisitorGroup values ('VG3', 'Nicole Kidman', 'Australia', 5);

insert into VisitorGroup values ('VG4', 'Jackie Chan', 'Hong Kong', 8);

insert into VisitorGroup values ('VG5', 'Kim SooHyun', 'Korea', 14);

insert into VisitorGroup values ('VG6', 'Parkmin Young', 'Korea', 10);

insert into VisitorGroup values ('VG7', 'Maggie Cheung', 'Hong Kong', 3);

insert into VisitorGroup values ('VG8', 'JunJi Hyun', 'Korea', 6);

-- Insert values for "Booking"
insert into Booking values ('B01', 'T4', 'V1', 'R2', 'VG2', 'S3', '2024-03-29', '10:28:00');

insert into Booking values ('B02', 'T4', 'V2', 'R1', 'VG3', 'S3', '2024-07-14', '07:23:00');

insert into Booking values ('B03', 'T5', 'V2', 'R5', 'VG1', 'S4', '2023-11-04', '07:40:00');

insert into Booking values ('B04', 'T1', 'V2', 'R4', 'VG4', 'S5', '2024-06-23', '06:42:00');

insert into Booking values ('B05', 'T1', 'V3', 'R3', 'VG5', 'S2', '2024-11-25', '07:13:00');

insert into Booking values ('B06', 'T7', 'V2', 'R5', 'VG1', 'S3', '2024-07-08', '10:55:00');

insert into Booking values ('B07', 'T5', 'V1', 'R1', 'VG8', 'S3', '2024-09-04', '06:06:00');

insert into Booking values ('B08', 'T3', 'V1', 'R2', 'VG7', 'S4', '2023-10-14', '06:37:00');

insert into Booking values ('B09', 'T2', 'V3', 'R3', 'VG6', 'S5', '2024-01-01', '09:07:00');

insert into Booking values ('B10', 'T3', 'V1', 'R1', 'VG8', 'S2', '2024-01-18', '08:35:00');
-- Insert values for "Organisation"
insert into Organisation values ('O1', 'Roll and Rock Corp', 'Elvis Presley', '(60) 2775 8425');

insert into Organisation values ('O2', 'BlueEyesCorp', 'Frank Sinatra', '(70) 9175 8036');

insert into Organisation values ('O3', 'Queen and Co', 'Freddie Mercury', '(71) 9126 8504');

insert into Organisation values ('O4', 'Liz Voices', 'Whitney Houston', '(10) 9647 8708');

insert into Organisation values ('O5', 'Bad Guys', 'Billie Eilish', '(78) 6686 3940');

insert into Organisation values ('O6', 'Songbird Supreme', 'Mariah Carey', '(02) 9481 1111');
-- Insert values for "Partnership"
insert into Partnership values ('R1', 'O3', '2021-08-31', '2025-05-30', 508485.00);

insert into Partnership values ('R2', 'O2', '2023-07-20', '2025-08-24', 1632025.00);

insert into Partnership values ('R2', 'O6', '2020-09-22', '2026-04-08', 1420420.00);

insert into Partnership values ('R3', 'O1', '2021-09-01', '2026-03-27', 809930.00);

insert into Partnership values ('R4', 'O4', '2022-04-30', '2024-12-23', 2339079.00);

insert into Partnership values ('R5', 'O5', '2020-12-03', '2025-09-29', 1463627.00);
-- Insert values for "TourPackage"
insert into TourPackage values ('T1', 'T4');

insert into TourPackage values ('T2', 'T4');

insert into TourPackage values ('T1', 'T5');

insert into TourPackage values ('T2', 'T6');

insert into TourPackage values ('T1', 'T7');
-- LEVEL ONE
-- TASK 1
-- This query selects tour information and formats the cost and duration
-- Techniques: SELECT, column aliasing, string concatenation (concat), ORDER BY
select
		TourID, 
		TourName, 
		concat('$', TourCost) as TourCost, 
		concat(TourDuration, 'hours') as TourDuration
from Tour
order by
	TourCost desc;

-- TASK 2
-- This query calculates the end time of tours based on booking time and tour duration
-- Techniques: JOIN, date/time manipulation (date_add), column aliasing, ORDER BY
select
    BookingID,
    BookingTime as 'Tour Start Time',
        date_add(BookingTime, interval TourDuration hour)
		as 'Tour End Time'
from
    Booking
join
    Tour ON Booking.TourID = Tour.TourID
order by 
	Booking.TourID asc;

-- TASK 3
-- This query retrieves booking information for large reserves with specific vehicle capacity and future dates
-- Techniques: Multiple JOINs, WHERE clause with multiple conditions, date comparison
select
		BookingID,
        BookingDate,
        ReserveName
from Booking
join Reserve on Booking.ReserveID = Reserve.ReserveID
join Vehicle on Booking.VehicleID = Vehicle.VehicleID and Booking.ReserveID = Vehicle.ReserveID
where
	Reserve.ReserveSize > 300
    and Vehicle.VehicleCapacity >= 7
    and BookingDate > date_add(now(), interval 180 day);

-- TASK 4
-- This query finds distinct reserve names and sizes where vehicles have a 'b' in their registration number
-- Techniques: JOIN, subquery, LIKE with wildcard, ORDER BY
select distinct ReserveName, concat(ReserveSize, ' hectares') as ReserveSize
from Reserve
join Vehicle on Reserve.ReserveID = Vehicle.ReserveID
where VehicleRegoNum in
(select VehicleRegoNum from Vehicle where lower(Vehicle.VehicleRegoNum) like '%b%')
order by ReserveSize desc;

-- TASK 5
-- This query counts the number of bookings for each reserve before 10:00 AM
-- Techniques: JOIN, aggregate function (count), GROUP BY, time comparison
select Reserve.ReserveID, count(Booking.BookingID) as NumberOfBookings
from Reserve
join Booking on Reserve.ReserveID = Booking.ReserveID
where time(Booking.BookingTime) < '10:00:00'
group by Reserve.ReserveID
order by Reserve.ReserveID asc;

-- LEVEL TWO
-- TASK 6
-- This query retrieves staff information and their October bookings (if any)
-- Techniques: LEFT JOIN, IFNULL, multiple conditions in WHERE clause, ORDER BY
select
		StaffName,
        ifnull(BookingDate, 'No Booking') as BookingDate
from Staff
left join Booking on Booking.StaffID  = Staff.StaffID
where (month(Booking.BookingDate) = 10 or Booking.BookingDate is null)
and (StaffPosition in ('Reserve Manager', 'Senior Tour Guide') and StaffSalary >= 70000)
order by StaffName asc;

-- TASK 7
-- This query finds staff members who meet specific criteria related to bookings, tours, and salary
-- Techniques: Multiple JOINs, subquery, aggregate functions, HAVING clause
select distinct
		VisGroupCountry,
        StaffName
from Booking
join Staff on Staff.StaffID = Booking.StaffID
join VisitorGroup on VisitorGroup.VisGroupID = Booking.VisGroupID
join Tour on Tour.TourID = Booking.TourID
where TourDuration > 2
and StaffName in (select StaffName from Booking group by StaffName having count(*) > 2)
and StaffSalary <= (select avg(StaffSalary) from Staff);

-- TASK 8
-- This query retrieves package tours and their component tours for packages with more than 2 components
-- Techniques: Self-join, subquery with GROUP BY and HAVING
select
    P.TourName as PackageTourName,
    C.TourName as ComponentTourName
from TourPackage TP
join Tour P on TP.PackageTourID = P.TourID
join Tour C on TP.ComponentTourID = C.TourID
where PackageTourID in (select PackageTourID from TourPackage group by PackageTourID having count(*) > 2);

-- LEVEL THREE
-- TASK 9
-- This query calculates the cost savings for package tours compared to their component tours
-- Techniques: JOINs, aggregate functions, arithmetic operations
select
	P.TourID,
	P.TourName,
	concat('$', P.TourCost) as TourCost,
	concat('$', sum(C.TourCost)) as TotalComponentCost,
	concat('$', (sum(C.TourCost) - P.TourCost)) as Savings
from TourPackage TP
join Tour P on TP.PackageTourID = P.TourID
join Tour C on TP.ComponentTourID = C.TourID
group by P.TourID;

-- TASK 10
-- This query retrieves partnership information based on complex criteria
-- Techniques: Multiple JOINs, subqueries, string pattern matching (LIKE), date difference calculation
select
		ReserveName, 
        OrganisationName, 
        datediff(P.EndDate, P.StartDate)/365 as "Partnership Duration", 
        concat("$", P.Amount) as "Amount"
from Partnership P
join Reserve R on P.ReserveID = R.ReserveID
join Organisation O on O.OrganisationID = P.OrganisationID
where OrgContactNumber like '_____9%'
and P.Amount > (select avg(Amount) from Partnership)
and R.ReserveID not in (select distinct ReserveID from Booking where TourID in ('T1', 'T2'));
