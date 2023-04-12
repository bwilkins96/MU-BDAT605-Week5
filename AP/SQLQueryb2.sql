-- BDAT 605: Database Principles 

/*
Create a view named Top10PaidInvoices that returns three columns for each vendor: 
VendorName, LastInvoice (the most recent invoice date), and SumOfInvoices (the sum of the InvoiceTotal column). 
Return only the 10 vendors with the largest SumOfInvoices and include only paid invoices.
*/

USE AP;
GO

CREATE VIEW Top10PaidInvoices AS
SELECT TOP 10 VendorName, MAX(InvoiceDate) AS LastInvoice, SUM(InvoiceTotal) AS SumOfInvoices
FROM Vendors JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceTotal - PaymentTotal - CreditTotal = 0
GROUP BY VendorName
ORDER BY SumOfInvoices DESC;
GO

SELECT * FROM Top10PaidInvoices;