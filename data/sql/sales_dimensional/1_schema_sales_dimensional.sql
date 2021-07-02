DROP SCHEMA Sales_Dimensional_Schema IF EXISTS CASCADE;

CREATE SCHEMA Sales_Dimensional_Schema;

SET SCHEMA Sales_Dimensional_Schema;

CREATE TABLE DailySalesFact
(
DateKey INTEGER,
ProductKey INTEGER,
StoreKey INTEGER,
QuantitySold DOUBLE,
DollarSalesAmount DOUBLE,
CONSTRAINT DailySalesFact_primaryKey PRIMARY KEY (DateKey, ProductKey, StoreKey)
);

CREATE TABLE ProductDimension
(
ProductKey INTEGER,
ProductDescription LONGVARCHAR,
CategoryDescription LONGVARCHAR,
CONSTRAINT ProductDimension_primaryKey PRIMARY KEY (ProductKey)
);

CREATE TABLE StoreDimension
(
StoreKey INTEGER,
StoreNumber INTEGER,
StoreZip INTEGER,
CONSTRAINT StoreDimension_primaryKey PRIMARY KEY (StoreKey)
);

CREATE TABLE DateDimension
(
DateKey INTEGER,
TheDate DATE,
TheMonth INTEGER,
TheYear INTEGER,
CONSTRAINT DateDimension_primaryKey PRIMARY KEY (DateKey)
);

ALTER TABLE DailySalesFact ADD CONSTRAINT R0_ProductDimension_DailySalesFact FOREIGN KEY ( ProductKey ) REFERENCES ProductDimension ( ProductKey ) ON DELETE CASCADE;

ALTER TABLE DailySalesFact ADD CONSTRAINT R1_StoreDimension_DailySalesFact FOREIGN KEY ( StoreKey ) REFERENCES StoreDimension ( StoreKey ) ON DELETE CASCADE;

ALTER TABLE DailySalesFact ADD CONSTRAINT R2_DateDimension_DailySalesFact FOREIGN KEY ( DateKey ) REFERENCES DateDimension ( DateKey ) ON DELETE CASCADE;

