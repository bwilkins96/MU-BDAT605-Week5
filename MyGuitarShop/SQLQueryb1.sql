-- BDAT 605: Database Principles 

/*
Create a view named CustomerAddresses that shows the shipping and billing addresses 
for each customer in the MyGuitarShop database. 
This view should return these columns from the Customers table: 
CustomerID, EmailAddress, LastName and FirstName.

This view should return these columns from the Addresses table: 
BillLine1, BillLine2, BillCity, BillState, BillZip, 
ShipLine1, ShipLine2, ShipCity, ShipState, and ShipZip.

Use the BillingAddressID and ShippingAddressID columns in the Customers table to determine 
which addresses are billing addresses and which are shipping addresses.

HINT: You can use two JOIN clauses to join the Addresses table to Customers table twice (once for each type of address).
*/

USE MyGuitarShop;
GO

CREATE OR ALTER VIEW CustomerAddresses
AS
SELECT C.CustomerID, EmailAddress, LastName, FirstName,
	   A.Line1 AS BillLine1, A.Line2 AS BillLine2, A.City AS BillCity, A.State AS BillState, A.ZipCode AS BillZip,
	   A2.Line1 AS ShipLine1, A2.Line2 AS ShipLine2, A2.City AS ShipCity, A2.State AS ShipState, A2.ZipCode AS ShipZip
FROM Customers C JOIN Addresses A
	ON C.BillingAddressID = A.AddressID
JOIN Addresses A2
	ON C.ShippingAddressID = A2.AddressID;
GO

SELECT * FROM CustomerAddresses;