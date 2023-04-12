-- BDAT 605: Database Principles 

/*
Add a column to the query described in exercise 2 that uses the RANK() function 
to return a column named BalanceRank that ranks the balance due in descending order.
*/

USE AP;
GO

SELECT InvoiceNumber, InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue,
	RANK() OVER(ORDER BY InvoiceTotal - PaymentTotal - CreditTotal DESC) AS BalanceRank
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal <> 0 AND InvoiceDueDate < GETDATE() + 30;
