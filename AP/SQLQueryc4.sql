-- BDAT 605: Database Principles 

/*
Code a call to the stored procedure created in exercise 3 that returns invoices with an InvoiceDate between December 10 and December 20, 2011.
This call should also catch any errors that are raised by the procedure and print the error number and description.
*/

BEGIN TRY
	EXEC spDateRange '12/10/11', '12/20/11';
END TRY
BEGIN CATCH
	PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS varchar(50))
	PRINT 'Error Message: ' + CAST(ERROR_MESSAGE() AS varchar(100))
END CATCH;