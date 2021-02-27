SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE OR ALTER TRIGGER AddressBookTriggerOnInsert
on AddressBook after insert 
as
BEGIN
	SET NOCOUNT ON;
	INSERT INTO PhoneNumber(ID) select I.ID from Inserted I;
	INSERT INTO Email(ID) select I.ID from Inserted I;
	INSERT INTO AddressBookType(ID) select I.ID from Inserted I;
END
GO