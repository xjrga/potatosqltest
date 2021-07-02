CREATE TABLE AddressUsage
(
PersonId INTEGER,
AddressId INTEGER,
AddressUsageType INTEGER,
AddressUsageStartDate DATE,
CONSTRAINT AddressUsage_primaryKey PRIMARY KEY (PersonId, AddressId, AddressUsageType)
);