/* Returns the databases on the system in a table form. */
SHOW DATABASES;

/* This creates a database.*/
CREATE DATABASE mySQLdatabase;

/* This is the best way to create a database. */
CREATE DATABASE IF NOT EXISTS mySQLdatabase;

/* This deletes a database. */
DROP DATABASE mySQLdatabase;

/* This is how we return the tables of a database. However, we must firstly specify the database
that we are refering to using the "USE" command. */

USE mySQLdatabase; 
SHOW TABLES;

/* We create a table below. We cannot create a table without at least creating at least a single field.
Additionally, we must also specifiy the data type of the fields in the table. */

CREATE TABLE IF NOT EXISTS TableName (
	Field1 TEXT,
    Field2 INT,
    Field3 FLOAT,
    Field4 BOOLEAN
);

/* We can simply delete a table as follows, */
DROP TABLE TableName;

/* The better way, */
DROP TABLE IF EXISTS TableName;

/* Say for example, we want a table which contains customer details. We would need a unique indentifier for each customer. We use 
"PRIMARY KEY" to define the field for the ID which means that it cannot be left empty. The CHAR data type stands for "characters" and we can 
determine its length by using CHAR(length). VARCHAR(length) is short for "variable character" and so we define the maximum length. ENUM means 
"enumeration" can it allows the entries of the field to only taken on specified strings.*/

CREATE TABLE IF NOT EXISTS Customers (
	FirstName VARCHAR(32),
    LastName VARCHAR(32),
    Age INT,
    Sex ENUM("Male", "Female"),
    Customer_ID CHAR(16) PRIMARY KEY
);

/* Our table is  empty. We use INSERT INTO to add data to it. */
INSERT INTO Customers (FirstName, LastName, Age, Sex, Customer_ID) VALUES 
("Jeff", "Jefferson", 37, "Male", "XCRTSDGSO12MO12K"),
("George", "Grimes", 56, "Male", "LKRT5PG5A12MO17M"),
("Kate", "Kipper", 25, "Female", "XSDTSGSEOR2MODF2");

/* We using SELECT* to display all data entries of a table. */
SELECT * FROM Customers;

/* For specific fields */
SELECT FirstName, LastName FROM Customers;

/* We can be even more specific using WHERE, */
SELECT FirstName, LastName FROM Customers WHERE Age < 30;

/* Furthermore, we use AND, OR, XOR, etc. (logical combinations) to detail more conditions. */
SELECT FirstName, LastName FROM Customers WHERE Age < 30 AND Sex = "Female";

/* Deleting rows from the table requires DELETE and a WHERE condition. This allows us to delete rows by their customer ID or any other 
condition involving their fields.*/
DELETE FROM Customers WHERE Customer_ID = "XCRTSDGSO12MO12K";