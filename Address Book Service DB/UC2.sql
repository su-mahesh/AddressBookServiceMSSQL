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