-- BDAT 605: Database Principles 

/*
Write a SELECT statement that selects all of the columns for the catalog view that returns information about foreign keys.  
How many foreign keys are defined in the AP database?
*/

USE AP;
GO

SELECT *
FROM sys.foreign_keys;