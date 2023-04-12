-- BDAT 605: Database Principles 

/*
Create a trigger for the Invoices table that automatically inserts the vendor name and address for a paid invoice into a table named ShippingLabels. 
The trigger should fire any time the PaymentTotal column of the Invoices table is updated. The structure of the ShippingLabels table is as follows:

CREATE TABLE ShippingLabels
 (VendorName            varchar(50),
  VendorAddress1       varchar(50),
  VendorAddress2       varchar(50),
  VendorCity                varchar(50),
  VendorState              char(2),
  VendorZipCode        varchar(20));

Use this UPDATE statement to test the trigger:
  UPDATE Invoices
  SET PaymentTotal = 67.92, PaymentDate = '2012-04-23'
  WHERE InvoiceID = 100;
*/

USE AP;
GO

CREATE TABLE ShippingLabels
 (VendorName            varchar(50),
  VendorAddress1       varchar(50),
  VendorAddress2       varchar(50),
  VendorCity                varchar(50),
  VendorState              char(2),
  VendorZipCode        varchar(20));
GO

CREATE TRIGGER Invoices_UPDATE_Shipping
	ON Invoices AFTER INSERT, UPDATE
AS
	INSERT ShippingLabels 
	SELECT VendorName, VendorAddress1, VendorAddress2,
           VendorCity, VendorState, VendorZipCode
	FROM Vendors JOIN Inserted
		ON Vendors.VendorID = (SELECT VendorID FROM Inserted)
	WHERE Inserted.InvoiceTotal - Inserted.PaymentTotal - Inserted.CreditTotal = 0;
GO

SELECT * FROM ShippingLabels;

UPDATE Invoices
SET PaymentTotal = 67.92, PaymentDate = '2012-04-23'
WHERE InvoiceID = 100;
GO

SELECT * FROM ShippingLabels;