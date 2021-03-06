USE [AddressBookService]
GO
/****** Object:  StoredProcedure [dbo].[Er_AddContactToAddressBook]    Script Date: 27-Feb-21 7:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER   PROCEDURE [dbo].[Er_AddContactToAddressBook]
	-- Add the parameters for the stored procedure here
	@FirstName	varchar(50), 
	@LastName	varchar(50),
	@Address	varchar(50),
	@City		varchar(50),
	@State		varchar(50),
	@Zip		varchar(7),
	@PhoneNumber varchar(14),
	@Email		varchar(50)
AS
BEGIN
BEGIN TRY
BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @new_identity TABLE (ID INT)
	DECLARE @ID int
	DECLARE @result bit
    -- Insert statements for procedure here

	insert into AddressBook(First_Name, Last_Name, Address, City, State, Zip)
	Output Inserted.ID into @new_identity(ID)
	values (@FirstName, @LastName, @Address, @City, @State, @Zip);
	set @ID = (select ID from @new_identity);

	UPDATE Email set Email = @Email;

	UPDATE PhoneNumber set PhoneNumber = @PhoneNumber;

COMMIT TRANSACTION
set @result = 1;
return @result;
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() as ErrorNumber, ERROR_MESSAGE() as ErrorMessage;
IF(XACT_STATE()) = -1
	BEGIN
		PRINT
		'transaction is uncommitable' + ' rolling back transaction'
		ROLLBACK TRANSACTION;
		return @result;	
	END;
ELSE IF(XACT_STATE()) = 1
	BEGIN
		PRINT
		'transaction is commitable' + ' rolling back transaction'
		COMMIT TRANSACTION;
		set @result = 1;
		return @result;
	END;
ELSE
	BEGIN
	PRINT
		'transaction is failed'
	ROLLBACK TRANSACTION;
	END;
END CATCH
END
