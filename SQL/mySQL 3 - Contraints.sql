USE mySQLdatabase;

/* In many cases, we want to put constraints on our data. For example, we may want a field to only take on a 
specific range of values. Another example, would be that we don't want two different fields to have the same value within
the same row. Consider the example below where we are collecting data about cars,  */

CREATE TABLE IF NOT EXISTS Cars (
	Car_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Make VARCHAR(32) NOT NULL,
    Model VARCHAR(32) NOT NULL,
    MYear INTEGER DEFAULT 2024,
    VIN CHAR(16) UNIQUE
    CONSTRAINT MYear CHECK (MYEAR >= 1900 AND MYEAR <= 2024)
);

SELECT * FROM CARS;

/* We have already seen that we can control the character length through CHAR(length) and VARCHAR(length). The constraint UNIQUE applied
to a field specifies that no more than a single row can have the same value. In other words, the field is unique.  Moreover, the DEFAULT (values)
tells mySQL what value the field should default to when not specified by an inserted row. */