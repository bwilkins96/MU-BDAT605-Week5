-- BDAT 605: Database Principles 

/*
Write a SELECT statement that returns these columns from the Orders table:
The OrderDate column
A column that returns the four-digit year that’s stored in the OrderDate column
A column that returns only the day of the month that’s stored in the OrderDate column.
A column that returns the result from adding thirty days to the OrderDate column.
*/

USE MyGuitarShop;
GO

SELECT OrderDate, YEAR(OrderDate) AS OrderYear, 
	   DAY(OrderDate) AS OrderDay, OrderDate + 30 AS OrderDatePlus30
FROM Orders;