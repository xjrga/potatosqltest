SET SCHEMA Rolodex;
/

CREATE PROCEDURE Person_Insert (
OUT newid INTEGER,
IN v_PersonName LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
INSERT INTO Person (
PersonId,
PersonName
) VALUES (
DEFAULT,
v_PersonName
);
SET newid = IDENTITY();
END;
/

CREATE PROCEDURE Person_Update (
IN v_PersonId INTEGER,
IN v_PersonName LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
UPDATE
Person
SET
PersonName = v_PersonName
WHERE
PersonId = v_PersonId;
END;
/

CREATE PROCEDURE Person_Delete (
IN v_PersonId INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM
Person
WHERE
PersonId = v_PersonId;
END;
/

CREATE PROCEDURE Person_Merge (
IN v_PersonId INTEGER,
IN v_PersonName LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
MERGE INTO Person USING ( VALUES (
v_PersonId,
v_PersonName
) ) ON (
PersonId = v_PersonId
)
WHEN MATCHED THEN UPDATE SET
PersonName = v_PersonName
WHEN NOT MATCHED THEN INSERT VALUES
v_PersonId,
v_PersonName;
END;
/

CREATE PROCEDURE Person_Select (
IN v_PersonId INTEGER
)
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
PersonId,
PersonName
FROM
Person
WHERE
PersonId = v_PersonId;
OPEN result;
END;
/

CREATE PROCEDURE Person_Delete_All ()
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM Person;
END;
/

CREATE PROCEDURE Person_Select_All ()
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
PersonId,
PersonName 
FROM
Person;
OPEN result;
END;
/

CREATE FUNCTION Person_Count () RETURNS INTEGER
READS SQL DATA BEGIN ATOMIC
DECLARE v_count INTEGER;
SELECT COUNT(*) INTO v_count
FROM
Person;
RETURN v_count;
END;
/

CREATE PROCEDURE Address_Insert (
OUT newid INTEGER,
IN v_AddressDetail LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
INSERT INTO Address (
AddressId,
AddressDetail
) VALUES (
DEFAULT,
v_AddressDetail
);
SET newid = IDENTITY();
END;
/

CREATE PROCEDURE Address_Update (
IN v_AddressId INTEGER,
IN v_AddressDetail LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
UPDATE
Address
SET
AddressDetail = v_AddressDetail
WHERE
AddressId = v_AddressId;
END;
/

CREATE PROCEDURE Address_Delete (
IN v_AddressId INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM
Address
WHERE
AddressId = v_AddressId;
END;
/

CREATE PROCEDURE Address_Merge (
IN v_AddressId INTEGER,
IN v_AddressDetail LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
MERGE INTO Address USING ( VALUES (
v_AddressId,
v_AddressDetail
) ) ON (
AddressId = v_AddressId
)
WHEN MATCHED THEN UPDATE SET
AddressDetail = v_AddressDetail
WHEN NOT MATCHED THEN INSERT VALUES
v_AddressId,
v_AddressDetail;
END;
/

CREATE PROCEDURE Address_Select (
IN v_AddressId INTEGER
)
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
AddressId,
AddressDetail
FROM
Address
WHERE
AddressId = v_AddressId;
OPEN result;
END;
/

CREATE PROCEDURE Address_Delete_All ()
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM Address;
END;
/

CREATE PROCEDURE Address_Select_All ()
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
AddressId,
AddressDetail 
FROM
Address;
OPEN result;
END;
/

CREATE FUNCTION Address_Count () RETURNS INTEGER
READS SQL DATA BEGIN ATOMIC
DECLARE v_count INTEGER;
SELECT COUNT(*) INTO v_count
FROM
Address;
RETURN v_count;
END;
/

CREATE PROCEDURE AddressUsage_Insert (
IN v_PersonId INTEGER,
IN v_AddressId INTEGER,
IN v_AddressUsageType INTEGER,
IN v_AddressUsageStartDate DATE
)
MODIFIES SQL DATA BEGIN ATOMIC
INSERT INTO AddressUsage (
PersonId,
AddressId,
AddressUsageType,
AddressUsageStartDate
) VALUES (
v_PersonId,
v_AddressId,
v_AddressUsageType,
v_AddressUsageStartDate
);
END;
/

CREATE PROCEDURE AddressUsage_Update (
IN v_PersonId INTEGER,
IN v_AddressId INTEGER,
IN v_AddressUsageType INTEGER,
IN v_AddressUsageStartDate DATE
)
MODIFIES SQL DATA BEGIN ATOMIC
UPDATE
AddressUsage
SET
AddressUsageStartDate = v_AddressUsageStartDate
WHERE
PersonId = v_PersonId
AND
AddressId = v_AddressId
AND
AddressUsageType = v_AddressUsageType;
END;
/

CREATE PROCEDURE AddressUsage_Delete (
IN v_PersonId INTEGER,
IN v_AddressId INTEGER,
IN v_AddressUsageType INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM
AddressUsage
WHERE
PersonId = v_PersonId
AND
AddressId = v_AddressId
AND
AddressUsageType = v_AddressUsageType;
END;
/

CREATE PROCEDURE AddressUsage_Merge (
IN v_PersonId INTEGER,
IN v_AddressId INTEGER,
IN v_AddressUsageType INTEGER,
IN v_AddressUsageStartDate DATE
)
MODIFIES SQL DATA BEGIN ATOMIC
MERGE INTO AddressUsage USING ( VALUES (
v_PersonId,
v_AddressId,
v_AddressUsageType,
v_AddressUsageStartDate
) ) ON (
PersonId = v_PersonId
AND
AddressId = v_AddressId
AND
AddressUsageType = v_AddressUsageType
)
WHEN MATCHED THEN UPDATE SET
AddressUsageStartDate = v_AddressUsageStartDate
WHEN NOT MATCHED THEN INSERT VALUES
v_PersonId,
v_AddressId,
v_AddressUsageType,
v_AddressUsageStartDate;
END;
/

CREATE PROCEDURE AddressUsage_Select (
IN v_PersonId INTEGER,
IN v_AddressId INTEGER,
IN v_AddressUsageType INTEGER
)
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
PersonId,
AddressId,
AddressUsageType,
AddressUsageStartDate
FROM
AddressUsage
WHERE
PersonId = v_PersonId
AND
AddressId = v_AddressId
AND
AddressUsageType = v_AddressUsageType;
OPEN result;
END;
/

CREATE PROCEDURE AddressUsage_Delete_All ()
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM AddressUsage;
END;
/

CREATE PROCEDURE AddressUsage_Select_All ()
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
PersonId,
AddressId,
AddressUsageType,
AddressUsageStartDate 
FROM
AddressUsage;
OPEN result;
END;
/

CREATE FUNCTION AddressUsage_Count () RETURNS INTEGER
READS SQL DATA BEGIN ATOMIC
DECLARE v_count INTEGER;
SELECT COUNT(*) INTO v_count
FROM
AddressUsage;
RETURN v_count;
END;
/

