-- BDAT 605: Database Principles 

/*
Use the function you created in exercise 6 in a SELECT statement that returns five columns: 
VendorName and the four columns returned by the function.
*/

USE AP;
GO

SELECT VendorName, FunctionTable.*
FROM Vendors JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
	JOIN dbo.fnDateRange('12/10/11', '12/20/11') AS FunctionTable
	ON FunctionTable.InvoiceNumber = Invoices.InvoiceNumber;
	