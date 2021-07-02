DROP SCHEMA Rolodex IF EXISTS CASCADE;

CREATE SCHEMA Rolodex;

SET SCHEMA Rolodex;

CREATE TABLE Person
(
PersonId IDENTITY,
PersonName LONGVARCHAR,
CONSTRAINT Person_primaryKey PRIMARY KEY (PersonId)
);

CREATE TABLE Address
(
AddressId IDENTITY,
AddressDetail LONGVARCHAR,
CONSTRAINT Address_primaryKey PRIMARY KEY (AddressId)
);

CREATE TABLE AddressUsage
(
PersonId INTEGER,
AddressId INTEGER,
AddressUsageType INTEGER,
AddressUsageStartDate DATE,
CONSTRAINT AddressUsage_primaryKey PRIMARY KEY (PersonId, AddressId, AddressUsageType)
);

ALTER TABLE AddressUsage ADD CONSTRAINT R0_Person_AddressUsage FOREIGN KEY ( PersonId ) REFERENCES Person ( PersonId ) ON DELETE CASCADE;

ALTER TABLE AddressUsage ADD CONSTRAINT R1_Address_AddressUsage FOREIGN KEY ( AddressId ) REFERENCES Address ( AddressId ) ON DELETE CASCADE;

