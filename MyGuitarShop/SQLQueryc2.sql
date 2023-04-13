-- BDAT 605: Database Principles 

/*
Write one function based on the MyGuitarShop database.
*/

USE MyGuitarShop;
GO

CREATE OR ALTER FUNCTION fn_GetMostOrdered()
	RETURNS TABLE
RETURN 
	(SELECT TOP 5 O.ProductID, ProductName, COUNT(O.ProductID) AS NumOrders
	 FROM OrderItems O JOIN Products P
		ON O.ProductID = P.ProductID
	 GROUP BY O.ProductID, ProductName
	 ORDER BY NumOrders DESC
	);
GO

SELECT * FROM fn_GetMostOrdered()
