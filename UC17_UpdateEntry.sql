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
CREATE or Alter PROCEDURE Er_UpdateAddressBook 
	-- Add the parameters for the stored procedure here
	@Name		varchar(50),
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
BEGIN TRANSACTION;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @result bit = 0;
	DECLARE @ID INTEGER
    -- Insert statements for procedure here
	UPDATE AddressBook set First_Name = @FirstName, Last_Name = @LastName,
	Address = @Address, City = @City, State = @State, Zip = @Zip WHERE Name = @Name;
	SET @ID = (SELECT ID FROM AddressBook WHERE Name = @Name)
	UPDATE PhoneNumber SET PhoneNumber = @PhoneNumber
	where ID = @ID;
	
	UPDATE Email SET Email = @Email
	where ID = @ID;
	
COMMIT TRANSACTION;
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
