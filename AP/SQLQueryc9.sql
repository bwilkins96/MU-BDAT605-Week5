-- BDAT 605: Database Principles 

/*
Write a trigger that prohibits duplicate values except for nulls in the NoDupName column of the following table:
  CREATE TABLE TestUniqueNulls
  (RowID                 int    IDENTITY     NOT NULL,
  NoDupName        varchar(20)           NULL);
  
(Note that you can't do this by using a unique constraint because the constraint wouldn't allow duplicate null values.) 
If an INSERT or UPDATE statement creates a duplicate value, roll back the statement and return an error message. 
Write a series of INSERT statements that tests that duplicate null values are allowed but duplicates of other values are not.
*/

USE AP;
GO

CREATE TABLE TestUniqueNulls
	(RowID                 int    IDENTITY     NOT NULL,
	 NoDupName        varchar(20)           NULL);
GO

CREATE TRIGGER TestUniqueNulls_NoDuplicates
	ON TestUniqueNulls AFTER INSERT, UPDATE
AS
	BEGIN
		IF (SELECT COUNT(*)
			FROM TestUniqueNulls JOIN INSERTED
			ON TestUniqueNulls.NoDupName = inserted.NoDupName) > 1
		BEGIN
			ROLLBACK TRAN;
			THROW 50001, 'Duplicate Value', 1
		END;
	END;
GO

INSERT INTO TestUniqueNulls VALUES (NULL);
INSERT INTO TestUniqueNulls VALUES (NULL);

INSERT INTO TestUniqueNulls VALUES ('John Doe');
INSERT INTO TestUniqueNulls VALUES ('John Doe');