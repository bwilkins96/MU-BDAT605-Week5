-- BDAT 605: Database Principles 

/*
Modify the search expression for InvoiceDueDate from the solution for exercise 2. 
Rather than 30 days from today, return invoices due before the last day of the current month.
*/

USE AP;
GO

SELECT InvoiceNumber, InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal <> 0 AND InvoiceDueDate < EOMONTH(GETDATE());
