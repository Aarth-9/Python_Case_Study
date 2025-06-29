create database CARS;
use CARS;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE IncidentSuspects;
TRUNCATE TABLE IncidentVictims;
TRUNCATE TABLE CaseIncident;
TRUNCATE TABLE Cases;
TRUNCATE TABLE Incidents;

-- Reset AUTO_INCREMENT
ALTER TABLE Incidents AUTO_INCREMENT = 1;
ALTER TABLE Cases AUTO_INCREMENT = 1;
ALTER TABLE CaseIncident AUTO_INCREMENT = 1;

-- Enable FK checks
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Cases (
    CaseID INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(255)
);
select * from Cases;

insert into Cases (CaseID, Description) values
(1,"Stolen bike reported near fountain."),
(2,"Physical altercation near grocery store."),
(3,"Unauthorized entry at night."),
(4,"Stolen jewel in a house."),
(5,"Phishing scam over email."),
(6,"Armed robbery at ATM."),
(7,"Child abducted from school premises.");

CREATE TABLE CaseIncident (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CaseID INT,
    IncidentID INT,
    FOREIGN KEY (CaseID) REFERENCES Cases(CaseID) on delete cascade,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID) on delete cascade
);

select * from CaseIncident ;

insert into CaseIncident (CaseID, IncidentID) values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7);

create table Incidents(
IncidentID int auto_increment primary key ,
IncidentType varchar(50) not null,
IncidentDate date not null,
Location VARCHAR(100) not null,
Description text,
Status enum('Open', 'Closed', 'Under Investigation')
);

select * from Incidents ;

insert into Incidents values
(1, 'Theft', '2024-12-20', 'Central Park, Chennai', 'Stolen bike reported near fountain.', 'Open'),
(2, 'Assault', '2025-01-15', 'Main Street, Coimbatore', 'Physical altercation near grocery store.', 'Under Investigation'),
(3, 'Burglary', '2025-03-02', '5th Avenue, Hyderabad', 'Unauthorized entry at night.', 'Closed'),
(4, 'Theft', '2025-05-10', 'Downtown Kolkata', 'Stolen jewel in a house.', 'Open'),
(5, 'Fraud', '2025-06-01', 'Online (Delhi IP)', 'Phishing scam over email.', 'Closed'),
(6, 'Robbery', '2025-04-25', 'Airport Road, Bangalore', 'Armed robbery at ATM.', 'Open'),
(7, 'Kidnapping', '2025-02-11', 'MG Road, Mumbai', 'Child abducted from school premises.', 'Closed');

create table IncidentVictims (
    IncidentID int ,
    VictimID int,
    primary key (IncidentID, VictimID),
    foreign key (IncidentID) references Incidents(IncidentID) on delete cascade,
    foreign key (VictimID) references Victims(VictimID) on delete cascade
);

select * from IncidentVictims;

INSERT INTO IncidentVictims (IncidentID, VictimID) VALUES
(1, 1), (1, 2),
(2, 2), (2, 3),
(3, 1), (3, 3), (3, 4),
(4, 4),
(5, 5), (5, 6),
(6, 6), (6, 7),
(7, 7), (7, 3);

create table IncidentSuspects (
    IncidentID int,
    SuspectID int,
    primary key (IncidentID, SuspectID),
    foreign key (IncidentID) references Incidents(IncidentID) on delete cascade,
    foreign key (SuspectID) references Suspects(SuspectID) on delete cascade
);

select * from IncidentSuspects;

INSERT INTO IncidentSuspects (IncidentID, SuspectID) VALUES
(1, 1), (1, 2),
(2, 2), (2, 3),
(3, 3), (3, 4),
(4, 4), (4, 5),
(5, 5), (5, 6),
(6, 6), (6, 7),
(7, 7), (7, 1);

create table Victims(
VictimID int auto_increment primary key not null,
FirstName varchar(50) not null,
LastName varchar(50),
DateOfBirth date,
Gender char(1),
Address varchar(60),
ContactNumber varchar(20));

select * from Victims;

insert into Victims values
(1, 'Dinesh', null, '2001-03-03', 'M', 'Marina Beach, Chennai', "9876543201"),
(2, 'Andrea', null, '2001-03-03', 'G', 'Brookefields Mall, Coimbatore', "9123456798"),
(3, 'Lakshmi', 'Vadalamudi', '2001-03-03', 'G', 'Charminar, Hyderabad', "9988776611"),
(4, 'Justin', 'Bieber', '2001-03-03', 'M', 'Victoria Memorial, Kolkata', "9765432188"),
(5, 'Cristiano', 'Ronaldo', '2001-03-03', 'M', 'RK Beach, Vizag', "9090909012"),
(6, 'Leonardo', 'Da Vinci', '2001-03-03', 'M', 'MG Road, Bangalore', "9823456790"),
(7, 'Mahi', 'Dhoni', '2001-03-03', 'G', 'Gateway of India, Mumbai', "9345678999");

create table Suspects(
SuspectID int auto_increment primary key not null,
FirstName varchar(50) not null,
LastName varchar(50),
DateOfBirth date,
Gender char(1),
Address varchar(60),
ContactNumber varchar(20));

select * from Suspects;

insert into Suspects values
(1, 'Ravi', 'Kumar', '1990-03-15', 'M', '17 North Street, Chennai', "9876543210"),
(2, 'Anita', 'Sharma', '1985-11-23', 'F', '88 Residency Road, Kochi', "9123456789"),
(3, 'Imran', 'Shaikh', '1992-07-08', 'M', '101 Banjara Hills, Hyderabad', "9988776655"),
(4, 'Priya', 'Menon', '1988-01-12', 'F', '5 Station Road, Pune', "9765432109"),
(5, 'Suresh', 'Reddy', '1975-09-30', 'M', null, "9090909090"),
(6, 'Meena', NULL, '1995-06-21', 'F', '12 MG Road, Bangalore', "9823456781"),
(7, 'Vikram', 'Desai', '1983-12-05', 'M', '22 Tilak Nagar, Mumbai', "9345678923");

create table Law_Enforcement_Agencies(
AgencyID int auto_increment primary key not null,
AgencyName varchar(50) not null,
Jurisdiction varchar(50) not null,
Address varchar(60),
ContactNumber varchar(20));

select * from Law_Enforcement_Agencies;

insert into Law_Enforcement_Agencies values
(301, 'Central Bureau of Investigation', 'National', 'Plot No. 5-B, CGO Complex, New Delhi', '01124362755'),
(302, 'Mumbai Police Department', 'Mumbai', 'CST Road, Kalina, Mumbai', '02226550622'),
(303, 'Cyber Crime Cell', 'Hyderabad', 'Road No. 12, Banjara Hills, Hyderabad', '04023233355'),
(304, 'Chennai City Police', 'Chennai', 'Commissioner Office, Egmore, Chennai', '04428555065'),
(305, 'Anti-Narcotics Task Force', 'Pan-India', 'Sector 9, Dwarka, New Delhi', '01125073756');

create table Officers(
OfficerID int auto_increment primary key not null,
FirstName varchar(50) not null,
LastName varchar(50),
BadgeNumber int not null,
Ranks varchar(15),
Address varchar(60),
ContactNumber varchar(20),
AgencyID int,
foreign key (AgencyID) references Law_Enforcement_Agencies(AgencyID) on delete cascade
);

select * from Officers;

insert into Officers values
(401, 'Rajesh', 'Verma', 1001, 'Inspector', '4 MG Road, Delhi', '9811122233', 301),
(402, 'Sneha', 'Iyer', 1002, 'Sub-Inspector', '19 Nungambakkam, Chennai', '9845566778', 304),
(403, 'Arjun', 'Patel', 1003, 'Detective', '22 Marine Drive, Mumbai', '9876543211', 302),
(404, 'Meera', 'Naik', 1004, 'ACP', '10 Jubilee Hills, Hyderabad', '9966554433', 303),
(405, 'Aman', 'Rathore', 1005, 'Constable', 'Sector 15, Dwarka, Delhi', '9723456789', 305);


create table Evidence(
EvidenceID int auto_increment primary key not null,
Description text,
Location_Found varchar(50) not null,
IncidentID int,
foreign key (IncidentID) references Incidents(IncidentID) on delete cascade
);

select * from Evidence;

insert into Evidence values
(501, 'CCTV footage showing a suspect near the bike rack', 'Central Park, Chennai', 1),
(502, 'Bloody shirt found near the scene', 'Main Street, Coimbatore', 2),
(503, 'Broken window glass and crowbar', '5th Avenue, Hyderabad', 3),
(504, 'Spray paint cans left behind', 'Downtown Kolkata', 4),
(505, 'Email headers and IP logs', 'Online (Delhi IP)', 5);

create table Reports(
ReportID int auto_increment primary key not null,
IncidentID int,
ReportingOfficer int,
ReportDate date not null,
ReportDetails text,
Status varchar(50),
foreign key (IncidentID) references Incidents(IncidentID) on delete cascade,
foreign key (ReportingOfficer) references Officers(OfficerID) on delete cascade
);

select * from Reports;

insert into Reports values
(601, 1, 401, '2024-12-21', 'Initial report filed regarding a stolen bike near the fountain.', 'Open'),
(602, 2, 402, '2025-01-16', 'Victim statements and witness interviews collected.', 'Under Investigation'),
(603, 3, 401, '2025-03-03', 'Evidence of forced entry documented and logged.', 'Closed'),
(604, 4, 404, '2025-05-11', 'Photos of graffiti taken, suspects unidentified.', 'Open'),
(605, 5, 405, '2025-06-02', 'Cybercrime unit notified; email logs obtained.', 'Closed'),
(606, 6, 402, '2025-04-26', 'ATM surveillance footage reviewed; leads being followed.', 'Open'),
(607, 7, 403, '2025-02-12', 'Witness statements from school staff recorded.', 'Closed');
