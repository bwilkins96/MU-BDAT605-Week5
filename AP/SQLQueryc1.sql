-- BDAT 605: Database Principles 

/*
Create a stored procedure named spBalanceRange that accepts three optional parameters. 
The procedure should return a result set consisting of VendorName, InvoiceNumber, 
and Balance for each invoice with a balance due, sorted with largest balance due first. 

The parameter @VendorVar is a mask that's used with a LIKE operator to filter by vendor name, as shown in figure 15-5. 
@BalanceMin and @BalanceMax are parameters used to specify the requested range of balances due. 
If called with no parameters or with a maximum value of 0, the procedure should return all invoices with a balance due.
*/

USE AP;
GO

CREATE OR ALTER PROCEDURE spBalanceRange
	@VendorVar varchar(50) = '%',
	@BalanceMin money = 0,
	@BalanceMax money = 0
AS

IF @BalanceMax = 0
	BEGIN
		SELECT VendorName, InvoiceNumber, InvoiceTotal - PaymentTotal - CreditTotal AS Balance
		FROM Vendors JOIN Invoices
			ON Vendors.VendorID = Invoices.VendorID
		WHERE VendorName LIKE @VendorVar
			AND (InvoiceTotal - PaymentTotal - CreditTotal) > 0
			AND (InvoiceTotal - PaymentTotal - CreditTotal) >= @BalanceMin
		ORDER BY Balance DESC;
	END;
ELSE
	BEGIN
		SELECT VendorName, InvoiceNumber, InvoiceTotal - PaymentTotal - CreditTotal AS Balance
		FROM Vendors JOIN Invoices
			ON Vendors.VendorID = Invoices.VendorID
		WHERE VendorName LIKE @VendorVar
			AND (InvoiceTotal - PaymentTotal - CreditTotal) > 0
			AND (InvoiceTotal - PaymentTotal - CreditTotal) BETWEEN @BalanceMin AND @BalanceMax
		ORDER BY Balance DESC;
	END;
GO

EXEC spBalanceRange;