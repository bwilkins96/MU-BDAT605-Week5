-- BDAT 605: Database Principles 

/*
Write a SELECT statement that returns these columns from the Orders table:
The CardNumber column
The length of the CardNumber column
The last four digits of the CardNumber column

When you get that working right, add the column that follows to the result set.
This is more difficult because the column requires the use of functions within functions.
A column that displays the last four digits of the CardNumber column in this format: 
XXXX-XXXX-XXXX-1234. In other words, use Xs for the first 12 digits of the card number 
and actual numbers for the last four digits of the number.
*/

USE MyGuitarShop;
GO

SELECT CardNumber, LEN(CardNumber) AS CardLen, RIGHT(CardNumber, 4) AS CardLast4,
	   'XXXX-XXXX-XXXX-' + RIGHT(CardNumber, 4) AS FormattedLast4
FROM Orders;