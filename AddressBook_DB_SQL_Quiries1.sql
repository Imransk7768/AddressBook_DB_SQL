--------------------------------------------------------------------------------------
--UC1_Creating AddressBook DataBase

CREATE DATABASE AddressBook_DB;
USE AddressBook_DB;

--------------------------------------------------------------------------------------
--UC2_Creating AddressBook table in AddressBook_DB

CREATE TABLE AddressBook
(
Id int not null primary key IDENTITY(101,1),
FirstName varchar(50),
LastName varchar(50),
Address varchar(50),
Email nvarchar(60),
Mobile nvarchar(10),
City Varchar(30),
State varchar(30),
ZipCode int
);

SELECT * FROM AddressBook;
-------------------------------------------------------------------------------------
--UC3_Inserting Data in AddressBook

INSERT INTO AddressBook(FirstName,LastName,Address,Email,Mobile,City,State,ZipCode)
VALUES
('Rehan','Shaik','SRNagar','rehanshaik123@gmail.com',9012345678,'Hyderabad','Telangana',523318),
('Tony','Stark','Ameerpet','tonystark007@gmail.com',9012345666,'Hyderabad','Telangana',523319),
('Steve','Rogers','GandhiNagar','steverogers777@gmail.com',9012345777,'Mumbai','Maharastra',523218),
('Wanda','Vision','Kukatpally','wandamaximoff9@gmail.com',9012340009,'Hyderabad','Telangana',523318),
('Bruce','Benner','Jncolony','brucebenner1009@gmail.com',9012341009,'calcutta','Bengal',524329),
('Bruce','Wyne','GothamCity','brucewyne889@gmail.com',9012341889,'maxico','Mexico',234123);

-----------------------------------------------------------------------------------
--UC4_Retieve Data of AddressBook Using Address and City

SELECT * FROM AddressBook WHERE Address='Ameerpet';
SELECT * FROM AddressBook WHERE City='Hyderabad';
SELECT * FROM AddressBook;

-----------------------------------------------------------------------------------
--UC5_Update Data in AddressBook Table

UPDATE AddressBook SET LastName='Maximoff',Address='Erraggadda',City='Hyderabad',
State='Telangana' WHERE FirstName='Wanda';

-----------------------------------------------------------------------------------
--UC6_Delete Data in AddressBook Table

DELETE FROM AddressBook WHERE LastName='Wyne';

------------------------------------------------------------------------------------
--UC7_Retrieve Data By Count Size of City & State Using Where Clause 

SELECT Count(State) FROM AddressBook WHERE State='Telangana';
SELECT Count(City) FROM AddressBook WHERE City='Calcutta';
SELECT Count(*) FROM AddressBook WHERE City='Calcutta';

------------------------------------------------------------------------------------
--UC8_Retrieve Data By of City in Ascending & Decending Orders


SELECT FirstName,LastName,City,ZipCode FROM AddressBook ORDER BY City DESC;

SELECT FirstName,LastName,City,ZipCode FROM AddressBook ORDER BY City ASC;

------------------------------------------------------------------------------------
--UC9_Adding Columns & Update Data into it.

ALTER TABLE AddressBook ADD FullName varchar(100),Type Varchar(100);

SELECT * FROM AddressBook

UPDATE AddressBook SET FullName='Rehan Shaik', Type='Friend' WHERE FirstName='Rehan';

------------------------------------------------------------------------------------
--UC10_Retrieve Count By Type

SELECT FirstName FROM AddressBook WHERE Type='Friend';
SELECT count (*) FROM AddressBook WHERE Type='Friend';

------------------------------------------------------------------------------------
--UC11_Add new Tables and Persons & Joining Tables Using Foreign Key


ALTER TABLE AddressBook DROP COLUMN Type;

CREATE TABLE AddressBookType
(
TypeId int PRIMARY KEY IDENTITY (101,1),
Type varchar(100),
);

INSERT INTO AddressBookType 
VALUES
('Family'),
('Friends'),
('Profession'),
('Others');  

CREATE TABLE AddressBookMapping 
(
MappingId int PRIMARY KEY IDENTITY (101,1),
TypeId int,
Id int 
);

ALTER TABLE AddressBookMapping ADD FOREIGN KEY(TypeId) REFERENCES AddressBook(Id);

ALTER TABLE AddressBookMapping ADD FOREIGN KEY(Id) REFERENCES AddressBookType(Type);

INSERT INTO AddressBookMapping(Id,TypeId)
VALUES
(1,1),
(1,2),
(1,3),
(1,2);

SELECT * FROM AddressBook INNER JOIN 
AddressBookMapping ON AddressBook.Id=AddressBookMapping.Id
INNER JOIN AddressBook ON AddressBook.Id=AddressBookMapping.TypeId;

