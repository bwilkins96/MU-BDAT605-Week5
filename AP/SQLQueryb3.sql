-- BDAT 605: Database Principles 

/*
Create an adaptable view named VendorAddress that returns the VendorID, both address columns, and the city, state, and zip code columns for each vendor. 
Then, write a SELECT query to examine the result set where VendorID=4. 
Next, write an UPDATE statement that changes the address so that the suite number (Ste 260) is stored in VendorAddress2 rather than in VendorAddress1. 
To verify the change, rerun your SELECT query.
*/

USE AP;
GO

CREATE VIEW VendorAddress
AS
SELECT VendorID, VendorAddress1, VendorAddress2, VendorCity, VendorState, VendorZipCode
FROM Vendors;
GO

SELECT * FROM VendorAddress
WHERE VendorID = 4;

UPDATE VendorAddress
SET VendorAddress2 = 'Ste 260'
WHERE VendorID = 4;
GO

SELECT * FROM VendorAddress
WHERE VendorID = 4;