-- BDAT 605: Database Principles 

/*
Write a SELECT statement that returns two columns based on the Vendors table. 

The first column, Contact, is the vendor contact name in this format: 
	first name followed by last initial (for example, "John S."). 
The second column, Phone, is the VendorPhone column without the area code. 

Only return rows for those vendors in the 559 area code. Sort the result set by first name, then last name.
*/

USE AP;
GO

SELECT VendorContactFName + ' ' + LEFT(VendorContactLName, 1) + '.' AS Contact,
	SUBSTRING(VendorPhone, 7, 8) AS Phone
FROM Vendors
WHERE SUBSTRING(VendorPhone, 2, 3) = '559'
ORDER BY VendorContactFName, VendorContactLName;
