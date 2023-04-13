-- BDAT 605: Database Principles 

/*
Write a SELECT statement that returns these columns from the Products table:
The ListPrice column
The DiscountPercent column
A column named DiscountAmount that uses the previous two columns to calculate the discount amount 
and uses the ROUND function to round the result to 2 decimal places
*/

USE MyGuitarShop;
GO

SELECT ListPrice, DiscountPercent, CAST(ROUND(ListPrice * DiscountPercent * 0.01, 2, 1) AS money) AS DiscountAmount
FROM Products;

