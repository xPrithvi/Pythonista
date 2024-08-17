USE mySQLdatabase; 
SELECT * FROM Customers;

/* To modify existing data entries, we use the UPDATE and SET statements. We also use WHERE to specifiy which row from 
one of its fields. */

UPDATE Customers SET Age = 38 WHERE Customer_ID = "XCRTSDGSO12MO12K";

/* Updating multiple fields of the choosen row, */
UPDATE Customers SET LastName = "Kimble", Age = 26 WHERE Customer_ID = "XSDTSGSEOR2MODF2";

/* We can also alter the structure of the table. For example, we change the data type of a field or column.
In this case, we allow the field "Sex" to now have a third choice which is "Intersex". */

ALTER TABLE Customers MODIFY COLUMN Sex ENUM("Male", "Female", "Intersex");
INSERT INTO Customers (FirstName, LastName, Age, Sex, Customer_ID) VALUES ("Pooja", "Poonam", 24, "Intersex", "AKDTSGCEOR35ODFI");

/* We can also rename fields or columns. */
ALTER TABLE Customers RENAME COLUMN FirstName TO ForeName;
ALTER TABLE Customers RENAME COLUMN ForeName TO FirstName;

/* Adding fields or columns. */
ALTER TABLE Customers ADD COLUMN Membership VARCHAR(32);

/* Removing fields or columns. */
ALTER TABLE Customers DROP COLUMN Membership;

/* In the previous section, we have seen how to delete a table. But how do we empty a table without deleteting it?
We use the TRUNCATE statment as follows. */

TRUNCATE TABLE Customers;
