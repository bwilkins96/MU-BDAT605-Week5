-- BDAT 605: Database Principles 

/*
Write a summary query WITH CUBE that returns LineItemSum (which is the sum of InvoiceLineItemAmount) 
grouped by Account (an alias for AccountDescription) and State (an alias for VendorState). 
Use the CASE and GROUPING function to substitute the literal value "*ALL*" for the summary rows with null values.
*/

SELECT 
	CASE 
		WHEN GROUPING(AccountDescription) = 1 THEN '*ALL*'
		ELSE AccountDescription
	END AS Account,
	CASE
		WHEN Grouping(VendorState) = 1 THEN '*ALL*'
		ELSE VendorState
	END AS State,
	SUM(InvoiceLineItemAmount) AS LineItemSum

FROM GLAccounts JOIN InvoiceLineItems 
	ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
JOIN Invoices
	ON InvoiceLineItems.InvoiceID =  Invoices.InvoiceID
JOIN Vendors
	ON Invoices.VendorID = Vendors.VendorID

GROUP BY AccountDescription, VendorState WITH CUBE
ORDER BY LineItemSum DESC, State;