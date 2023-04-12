-- BDAT 605: Database Principles 

/*
Create a scalar-valued function named fnUnpaidInvoiceID that returns the InvoiceID of the earliest invoice with an unpaid balance. 

Test the function in the following SELECT statement:
SELECT VendorName, InvoiceNumber, InvoiceDueDate,
              InvoiceTotal - CreditTotal - PaymentTotal AS Balance
FROM Vendors JOIN Invoices
      ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceID = dbo.fnUnpaidInvoiceID();
*/

CREATE OR ALTER FUNCTION fnUnpaidInvoiceID()
	RETURNS int
BEGIN
	RETURN 
		(SELECT TOP 1 InvoiceID
		 FROM Invoices
		 WHERE InvoiceTotal - PaymentTotal - CreditTotal >0
		 ORDER BY InvoiceDate);
END;
GO

SELECT VendorName, InvoiceNumber, InvoiceDueDate,
              InvoiceTotal - CreditTotal - PaymentTotal AS Balance
FROM Vendors JOIN Invoices
      ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceID = dbo.fnUnpaidInvoiceID();
