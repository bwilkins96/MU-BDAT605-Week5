-- BDAT 605: Database Principles 

/*
Code three calls to the procedure created in exercise 1:
passed by position with @VendorMar='M%' and no balance range
passed by name with @VendorMar omitted and a balance range from $200 to $1000
passed by position with a balance due that's less than $200 filtering for vendors whose names begin with C or F
*/

USE AP;
GO

EXEC spBalanceRange 'M%';

EXEC spBalanceRange @BalanceMin = 200, @BalanceMax = 1000;

EXEC spBalanceRange '[C,F]%', 0, 200;