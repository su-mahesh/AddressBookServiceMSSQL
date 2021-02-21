--UC1 create database Address Book Service DB
CREATE DATABASE AddressBookService;
use AddressBookService;

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
