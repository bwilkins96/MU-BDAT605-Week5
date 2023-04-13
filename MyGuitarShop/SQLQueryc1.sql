-- BDAT 605: Database Principles 

/*
Write one Stored Procedure based on the MyGuitarShop database.
*/

USE MyGuitarShop;
GO

CREATE OR ALTER PROCEDURE sp_GetCustomerOrders
	@FistName varchar(50) = '%',
	@LastName varchar(50) = '%'
AS
	SELECT C.CustomerID, FirstName, LastName, 
		   O.OrderID, OrderDate, ShipDate
	FROM Customers C JOIN Orders O
		ON C.CustomerID = O.CustomerID
	WHERE FirstName LIKE '%'+@FistName+'%' AND LastName LIKE '%'+@LastName+'%' 
	ORDER BY CustomerID, OrderDate DESC, ShipDate DESC;
GO

EXEC sp_GetCustomerOrders;
EXEC sp_GetCustomerOrders 'Allan', 'Sherwood'
EXEC sp_GetCustomerOrders @LastName = 'Goldstein'