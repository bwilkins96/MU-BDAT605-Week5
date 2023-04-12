-- BDAT 605: Database Principles 

/*
Write a CREATE VIEW statement that defines a view named InvoiceBasic that returns three columns: 
VendorName, InvoiceNumber, and InvoiceTotal. Then, write a SELECT statement that returns all of the columns 
in the view, sorted by VendorName, where the first letter of the vendor name is N, O, or P.
*/

USE AP;
GO

CREATE VIEW InvoiceBasic
AS
SELECT VendorName, InvoiceNumber, Invoicetotal
FROM Invoices JOIN Vendors
	ON Invoices.VendorID = Vendors.VendorID;
GO

SELECT * 
FROM InvoiceBasic
WHERE VendorName LIKE '[N-P]%'
ORDER BY VendorName;