DROP SCHEMA Sales_Schema IF EXISTS CASCADE;

CREATE SCHEMA Sales_Schema;

SET SCHEMA Sales_Schema;

CREATE TABLE Product
(
ProductId INTEGER,
ProductName INTEGER,
CONSTRAINT Product_primaryKey PRIMARY KEY (ProductId)
);

CREATE TABLE Customer
(
CustomerId INTEGER,
CustomeName LONGVARCHAR,
CONSTRAINT Customer_primaryKey PRIMARY KEY (CustomerId)
);

CREATE TABLE ProductSales
(
CustomerId INTEGER,
ProductId INTEGER,
Quantity DOUBLE,
UnitPrice DOUBLE,
SalesDate DATE,
CONSTRAINT ProductSales_primaryKey PRIMARY KEY (CustomerId, ProductId)
);

ALTER TABLE ProductSales ADD CONSTRAINT R0_Product_ProductSales FOREIGN KEY ( ProductId ) REFERENCES Product ( ProductId ) ON DELETE CASCADE;

ALTER TABLE ProductSales ADD CONSTRAINT R1_Customer_ProductSales FOREIGN KEY ( CustomerId ) REFERENCES Customer ( CustomerId ) ON DELETE CASCADE;

