-- BDAT 605: Database Principles 

/*
Create a stored procedure named spDateRange that accepts two parameters, @DateMin and @DateMax, with data type varchar and default value null. 
If called with no parameters or with null values, raise an error that describes the problem. 
If called with non-null values, validate the parameters. Test that the literal strings are valid dates and test that @DateMin is earlier than @DateMax. 
If the parameters are valid, return a result set that includes the InvoiceNumber, InvoiceDate, InvoiceTotal, and Balance for each invoice 
for which the InvoiceDate is within the date range, sorted with earliest invoice first.
*/

USE AP;
GO

CREATE OR ALTER PROCEDURE spDateRange
	@DateMin varchar(50) = null,
	@DateMax varchar(50) = null
AS

IF @DateMin IS NULL OR @DateMax IS NULL
	THROW 50001, 'The DateMin and DateMax parameters are required', 1;
IF NOT (ISDATE(@DateMin) = 1 AND ISDATE(@DateMax) = 1)
	THROW 50001, 'DateMin and DateMax must be valid dates (mm/dd/yy)', 1;
IF CAST(@DateMin AS datetime) > CAST(@DateMax AS datetime)
	THROW 50001, 'DateMin must be earlier than DateMax', 1;

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceTotal - PaymentTotal - CreditTotal AS Balance
FROM Invoices
WHERE InvoiceDate BETWEEN @DateMin AND @DateMax
ORDER BY InvoiceDate;