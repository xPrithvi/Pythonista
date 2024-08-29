USE mySQLdatabase;

/* In many cases, we want to put constraints on our data. For example, we may want a field to only take on a 
specific range of values. Another example, would be that we don't want two different fields to have the same value within
the same row. Consider the example below where we are collecting data about cars,  */

CREATE TABLE IF NOT EXISTS Cars (
	Car_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    Make VARCHAR(32) NOT NULL,
    Model VARCHAR(32) NOT NULL,
    MYear INTEGER DEFAULT 2024,
    VIN CHAR(17) UNIQUE,
    CONSTRAINT year_constraint CHECK (MYEAR >= 1900 AND MYEAR <= 2024)
);

SELECT * FROM Cars;

/* We have already seen that we can control the character length through CHAR(length) and VARCHAR(length). The constraint UNIQUE applied
to a field specifies that no more than a single row can have the same value. In other words, the field is unique.  Moreover, the DEFAULT (values)
tells mySQL what value the field should default to when not specified by an inserted row. */

INSERT INTO Cars (Make, Model, MYear, VIN) VALUES 
("Toyota", "Corolla", 2022, "JTDBU4EE9B9123456"),
("Ford", "Mustang", 2021, "1FA6P8TH4M5112345"),
("Honda", "Civic", 2020, "2HGFC2F69LH123456"),
("BMW", "X5", 2019, "5UXCR6C57KLL12345"),
("Chevrolet", "Camaro", 2018, "1G1FB1RS4J0123456"),
("Audi", "A4", 2022, "WAUENAF4XMA123456"),
("Toyota", "RAV4", 2022, "1B4HS28Y4WF146813"),
("Toyota", "Yaris", 2018, "1GC1KXEG0CF180949"),
("Ford", "Foucs", 2020, "5HC1KIEG0CF178159");