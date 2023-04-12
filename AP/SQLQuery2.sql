-- BDAT 605: Database Principles 

/*
Write a SELECT statement that returns the InvoiceNumber and balance due 
for every invoice with a non-zero balance 
and an InvoiceDueDate that's less than 30 days from today.
*/

USE AP;
GO

SELECT InvoiceNumber, InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal <> 0 AND InvoiceDueDate < GETDATE() + 30;
