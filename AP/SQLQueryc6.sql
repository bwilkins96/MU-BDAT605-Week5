-- BDAT 605: Database Principles 

/*
Create a table-valued function named fnDateRange, similar to the stored procedure of exercise 3. 
The function requires two parameters of data type smalldatetime. Don't validate the parameters.

Return a result set that includes the InvoiceNumber, InvoiceDate, InvoiceTotal, and Balance 
for each invoice for which the InvoiceDate is within the date range. 

Invoke the function from within a SELECT statement to return those invoices with InvoiceDate between December 10 and December 20, 2011.
*/

USE AP;
GO

CREATE OR ALTER FUNCTION fnDateRange
	(@MinDate smalldatetime, @MaxDate smalldatetime)
	RETURNS table
RETURN 
	(SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceTotal - PaymentTotal - CreditTotal AS Balance
	 FROM Invoices
	 WHERE InvoiceDate BETWEEN @MinDate AND @MaxDate);
GO

SELECT * FROM dbo.fnDateRange('12/10/11', '12/20/11');