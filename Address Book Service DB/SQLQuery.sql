--UC1 create database Address Book Service DB
CREATE DATABASE AddressBookService;
USE AddressBookService;

--UC2 create Address Book table
CREATE TABLE AddressBook
(
ID				int identity(1, 1),
First_Name		varchar(50),
Last_Name		varchar(50),
Address			varchar(50),
City			varchar(50),
State			varchar(50),
Zip				int,
Phone_Number	varchar(14),
Email			varchar(50),
PRIMARY KEY(ID)
)

--UC3 insert data into table
INSERT INTO AddressBook(First_Name, Last_Name, Address, City, State, Zip, Phone_Number, Email)
VALUES('Bil', 'Gate', 'Win CA', 'LA', 'CA', '111000', '+1 3338884443', 'bil@gmail.com'),
('Jack', 'Bale', 'Win WN', 'Din', 'WN', '111055', '+1 3377884443', 'jack@gmail.com'),
('Terissa', 'kane', 'san MH', 'New York', 'MH', '151055', '+1 3377334443', 'terissa@gmail.com'),
('Charlie', 'walt', 'sengen IO', 'Wiscosin', 'IO', '441055', '+1 3377884443', 'charlie@gmail.com'),
('Rachel', 'Bale', 'Win WN', 'Din', 'WN', '111055', '+1 3377884443', 'wffw@gmail.com'),
('monica', 'geller', 'san MH', 'New York', 'MH', '151055', '+1 3377334443', 'gegerg@gmail.com'),
('chandler', 'stein', 'sengen IO', 'Wiscosin', 'IO', '441055', '+1 3377884443', 'fferfe@gmail.com');

SELECT * FROM AddressBook;

--UC4 edit existing contact
UPDATE AddressBook SET Phone_Number = '+1 8474444444' WHERE First_Name = 'Jack'
SELECT * FROM AddressBook;

--UC5 delete existing contact
DELETE FROM AddressBook WHERE Last_Name = 'walt';
SELECT * FROM AddressBook;

--UC6 retrieve contact belong to city or state
SELECT * FROM AddressBook WHERE CITY = 'New York';
SELECT * FROM AddressBook WHERE STATE = 'CA';
SELECT * FROM AddressBook WHERE CITY = 'LA' or STATE = 'MH';

--UC7 get size of address book by city or state
SELECT CITY, COUNT(CITY) AS CITY_COUNT FROM AddressBook GROUP BY CITY;
SELECT STATE, COUNT(STATE) AS STATE_COUNT FROM AddressBook GROUP BY STATE;

--UC8 retrieve sorted entries by name for given city
SELECT * FROM AddressBook WHERE CITY = 'New York' ORDER BY FIRST_NAME;

--UC9 ability identify each address book with name and type
ALTER table AddressBook ADD Name AS FIRST_NAME+' '+LAST_NAME;
ALTER table AddressBook ADD TYPE VARCHAR(20);

SELECT NAME, TYPE, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE_NUMBER, EMAIL FROM AddressBook;
UPDATE TOP(3) AddressBook SET TYPE = 'FRIENDS';
UPDATE AddressBook SET TYPE = 'FAMILY' WHERE FIRST_NAME = 'Rachel' or FIRST_NAME = 'MONICA';
UPDATE AddressBook SET TYPE = 'PROFESSION' WHERE FIRST_NAME = 'chandler';

--UC10 ability to get count of contacts by type
SELECT TYPE, COUNT(*) AS TYPE_COUNT FROM AddressBook GROUP BY TYPE;

--UC11 ability to add person to both family and friends
INSERT INTO AddressBook(FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE_NUMBER, EMAIL) SELECT FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE_NUMBER, EMAIL FROM AddressBook WHERE First_Name = 'Bil';
UPDATE AddressBook SET Type = 'FAMILY' WHERE Type IS NULL AND First_Name = 'Bil';

SELECT ID, NAME, TYPE, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE_NUMBER, EMAIL FROM AddressBook;
 
--UC12 Normalization
CREATE table Type(TypeID int identity(1, 1), Type varchar(20),
Constraint TypePrimaryKey PRIMARY KEY(TypeID)
);

INSERT INTO TYPE(Type) VALUES('Family'), ('Friends'), ('Profession');
select * from Type;

CREATE TABLE AddressBookType(ID int, TypeID int, 
Constraint AddressBookType_ID_ForeignKey FOREIGN KEY(ID) REFERENCES AddressBook(ID),
Constraint AddressBookType_Type_ForeignKey FOREIGN KEY(ID) REFERENCES Type(TypeID)
);

ALTER TABLE AddressBook DROP COLUMN Type

SELECT ID, NAME, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE_NUMBER, EMAIL FROM AddressBook;
delete from AddressBook;