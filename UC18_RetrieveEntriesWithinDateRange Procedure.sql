-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE Er_RetrieveAddressBookWithinDateRange
	-- Add the parameters for the stored procedure here
	@FromDate Date,
	@ToDate	Date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select AddressBook.ID, Name, First_Name, Last_Name, PhoneNumber, Address, City, State, Zip, Email, Added_Date, ContactType
	from AddressBook
	left join Email on AddressBook.ID = Email.ID
	left join PhoneNumber on AddressBook.ID = PhoneNumber.ID 
	left join AddressBookType on AddressBook.ID = AddressBookType.ID
	left join ContactType on AddressBookType.TypeID = ContactType.TypeID 
	where Added_Date between @FromDate and @ToDate;

END
GO
