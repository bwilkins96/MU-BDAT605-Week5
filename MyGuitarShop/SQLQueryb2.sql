-- BDAT 605: Database Principles 

/*
Write a SELECT statement that returns these columns from the CustomerAddresses view 
that you created in exercise 1: CustomerID, LastName, FirstName, BillLine1
*/

USE MyGuitarShop;
GO

SELECT CustomerID, LastName, FirstName, BillLine1
FROM CustomerAddresses;