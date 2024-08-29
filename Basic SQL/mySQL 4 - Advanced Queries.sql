/* Let us continue using the cars database. In this section, we will consider more advanced mySQL 
queries on the database. */

USE mySQLdatabase;
SELECT * FROM Cars;

/* The keyword "DISTINCT" elimates dupulicate entries in the choosen field. */
SELECT DISTINCT Make FROM Cars;

/* The keyword "IN" allows us to query rows that have values which are in a given list for a
particular field. */
SELECT * FROM Cars WHERE MYear IN (2022, 2021);

/* The "LIKE" operator can be used for strings and it is quite intuitive. The percentage % 
means that any proceeding characters are irrelevent to our search.*/
SELECT * FROM Cars WHERE Make LIKE "To%";

/* We can apply aggregate functions such as COUNT, SUM, MIN, AVG, MAX, etc. to our fields. It is also useful to 
use alias for our new fields using "AS". Some Examples, */

SELECT MIN(MYear) AS "Earliest MYear." FROM Cars;

SELECT MAX(MYear) AS "Latest MYear." FROM Cars; 

SELECT COUNT(*) AS "Number of cars." FROM Cars;

SELECT COUNT(*) AS "Number of Toyota cars." FROM Cars WHERE Make = "Toyota";

SELECT MIN(MYear) AS "The MYear of The oldest Ford." FROM Cars WHERE Make = "Ford";

SELECT ROUND(AVG(MYear), 0) AS "Average MYEAR" FROM Cars;

/* "GROUP BY" is also extremely useful when we want to see our aggregated field grouped by another/other field(s).
Notice that we have selected the fields so it apparent which group is which.*/

SELECT Make, ROUND(AVG(MYear), 0) AS "Average MYEAR" FROM Cars GROUP BY Make;

SELECT Make, Model, COUNT(*) AS "Number of cars." FROM Cars GROUP BY Make, Model;

/* "ORDER BY" lets us order the returned list or table by a choosen field. For example, we order the database in alphabetical order by Make, */
SELECT * FROM Cars ORDER BY Make;

/* The default setting is for an ascending order. However, we can also have a descending order, */
SELECT * FROM Cars ORDER BY Make DESC;

/* For numerical fields, */
SELECT * FROM Cars ORDER BY MYear DESC;

/* We can also combine this with GROUP BY statements as seen below. Note that we can also define an ordering hierarchy which is useful for when rows may have the 
same entries for fields we are ordering by. */
SELECT Make, Model, COUNT(*) AS "Number of cars." FROM Cars GROUP BY Make, Model ORDER BY Make, Model;

/* Limiting the number of rows returned to use via LIMIT [int] is useful. */
SELECT Make, Model, COUNT(*) AS "Number of cars." FROM Cars GROUP BY Make, Model ORDER BY Make, Model LIMIT 3;
