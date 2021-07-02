SET SCHEMA Sales_Dimensional_Schema;
/

CREATE PROCEDURE DailySalesFact_Insert (
IN v_DateKey INTEGER,
IN v_ProductKey INTEGER,
IN v_StoreKey INTEGER,
IN v_QuantitySold DOUBLE,
IN v_DollarSalesAmount DOUBLE
)
MODIFIES SQL DATA BEGIN ATOMIC
INSERT INTO DailySalesFact (
DateKey,
ProductKey,
StoreKey,
QuantitySold,
DollarSalesAmount
) VALUES (
v_DateKey,
v_ProductKey,
v_StoreKey,
v_QuantitySold,
v_DollarSalesAmount
);
END;
/

CREATE PROCEDURE DailySalesFact_Update (
IN v_DateKey INTEGER,
IN v_ProductKey INTEGER,
IN v_StoreKey INTEGER,
IN v_QuantitySold DOUBLE,
IN v_DollarSalesAmount DOUBLE
)
MODIFIES SQL DATA BEGIN ATOMIC
UPDATE
DailySalesFact
SET
QuantitySold = v_QuantitySold,
DollarSalesAmount = v_DollarSalesAmount
WHERE
DateKey = v_DateKey
AND
ProductKey = v_ProductKey
AND
StoreKey = v_StoreKey;
END;
/

CREATE PROCEDURE DailySalesFact_Delete (
IN v_DateKey INTEGER,
IN v_ProductKey INTEGER,
IN v_StoreKey INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM
DailySalesFact
WHERE
DateKey = v_DateKey
AND
ProductKey = v_ProductKey
AND
StoreKey = v_StoreKey;
END;
/

CREATE PROCEDURE DailySalesFact_Merge (
IN v_DateKey INTEGER,
IN v_ProductKey INTEGER,
IN v_StoreKey INTEGER,
IN v_QuantitySold DOUBLE,
IN v_DollarSalesAmount DOUBLE
)
MODIFIES SQL DATA BEGIN ATOMIC
MERGE INTO DailySalesFact USING ( VALUES (
v_DateKey,
v_ProductKey,
v_StoreKey,
v_QuantitySold,
v_DollarSalesAmount
) ) ON (
DateKey = v_DateKey
AND
ProductKey = v_ProductKey
AND
StoreKey = v_StoreKey
)
WHEN MATCHED THEN UPDATE SET
QuantitySold = v_QuantitySold,
DollarSalesAmount = v_DollarSalesAmount
WHEN NOT MATCHED THEN INSERT VALUES
v_DateKey,
v_ProductKey,
v_StoreKey,
v_QuantitySold,
v_DollarSalesAmount;
END;
/

CREATE PROCEDURE DailySalesFact_Select (
IN v_DateKey INTEGER,
IN v_ProductKey INTEGER,
IN v_StoreKey INTEGER
)
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
DateKey,
ProductKey,
StoreKey,
QuantitySold,
DollarSalesAmount
FROM
DailySalesFact
WHERE
DateKey = v_DateKey
AND
ProductKey = v_ProductKey
AND
StoreKey = v_StoreKey;
OPEN result;
END;
/

CREATE PROCEDURE DailySalesFact_Delete_All ()
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM DailySalesFact;
END;
/

CREATE PROCEDURE DailySalesFact_Select_All ()
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
DateKey,
ProductKey,
StoreKey,
QuantitySold,
DollarSalesAmount 
FROM
DailySalesFact;
OPEN result;
END;
/

CREATE FUNCTION DailySalesFact_Count () RETURNS INTEGER
READS SQL DATA BEGIN ATOMIC
DECLARE v_count INTEGER;
SELECT COUNT(*) INTO v_count
FROM
DailySalesFact;
RETURN v_count;
END;
/

CREATE PROCEDURE ProductDimension_Insert (
IN v_ProductKey INTEGER,
IN v_ProductDescription LONGVARCHAR,
IN v_CategoryDescription LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
INSERT INTO ProductDimension (
ProductKey,
ProductDescription,
CategoryDescription
) VALUES (
v_ProductKey,
v_ProductDescription,
v_CategoryDescription
);
END;
/

CREATE PROCEDURE ProductDimension_Update (
IN v_ProductKey INTEGER,
IN v_ProductDescription LONGVARCHAR,
IN v_CategoryDescription LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
UPDATE
ProductDimension
SET
ProductDescription = v_ProductDescription,
CategoryDescription = v_CategoryDescription
WHERE
ProductKey = v_ProductKey;
END;
/

CREATE PROCEDURE ProductDimension_Delete (
IN v_ProductKey INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM
ProductDimension
WHERE
ProductKey = v_ProductKey;
END;
/

CREATE PROCEDURE ProductDimension_Merge (
IN v_ProductKey INTEGER,
IN v_ProductDescription LONGVARCHAR,
IN v_CategoryDescription LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
MERGE INTO ProductDimension USING ( VALUES (
v_ProductKey,
v_ProductDescription,
v_CategoryDescription
) ) ON (
ProductKey = v_ProductKey
)
WHEN MATCHED THEN UPDATE SET
ProductDescription = v_ProductDescription,
CategoryDescription = v_CategoryDescription
WHEN NOT MATCHED THEN INSERT VALUES
v_ProductKey,
v_ProductDescription,
v_CategoryDescription;
END;
/

CREATE PROCEDURE ProductDimension_Select (
IN v_ProductKey INTEGER
)
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
ProductKey,
ProductDescription,
CategoryDescription
FROM
ProductDimension
WHERE
ProductKey = v_ProductKey;
OPEN result;
END;
/

CREATE PROCEDURE ProductDimension_Delete_All ()
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM ProductDimension;
END;
/

CREATE PROCEDURE ProductDimension_Select_All ()
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
ProductKey,
ProductDescription,
CategoryDescription 
FROM
ProductDimension;
OPEN result;
END;
/

CREATE FUNCTION ProductDimension_Count () RETURNS INTEGER
READS SQL DATA BEGIN ATOMIC
DECLARE v_count INTEGER;
SELECT COUNT(*) INTO v_count
FROM
ProductDimension;
RETURN v_count;
END;
/

CREATE PROCEDURE StoreDimension_Insert (
IN v_StoreKey INTEGER,
IN v_StoreNumber INTEGER,
IN v_StoreZip INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
INSERT INTO StoreDimension (
StoreKey,
StoreNumber,
StoreZip
) VALUES (
v_StoreKey,
v_StoreNumber,
v_StoreZip
);
END;
/

CREATE PROCEDURE StoreDimension_Update (
IN v_StoreKey INTEGER,
IN v_StoreNumber INTEGER,
IN v_StoreZip INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
UPDATE
StoreDimension
SET
StoreNumber = v_StoreNumber,
StoreZip = v_StoreZip
WHERE
StoreKey = v_StoreKey;
END;
/

CREATE PROCEDURE StoreDimension_Delete (
IN v_StoreKey INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM
StoreDimension
WHERE
StoreKey = v_StoreKey;
END;
/

CREATE PROCEDURE StoreDimension_Merge (
IN v_StoreKey INTEGER,
IN v_StoreNumber INTEGER,
IN v_StoreZip INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
MERGE INTO StoreDimension USING ( VALUES (
v_StoreKey,
v_StoreNumber,
v_StoreZip
) ) ON (
StoreKey = v_StoreKey
)
WHEN MATCHED THEN UPDATE SET
StoreNumber = v_StoreNumber,
StoreZip = v_StoreZip
WHEN NOT MATCHED THEN INSERT VALUES
v_StoreKey,
v_StoreNumber,
v_StoreZip;
END;
/

CREATE PROCEDURE StoreDimension_Select (
IN v_StoreKey INTEGER
)
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
StoreKey,
StoreNumber,
StoreZip
FROM
StoreDimension
WHERE
StoreKey = v_StoreKey;
OPEN result;
END;
/

CREATE PROCEDURE StoreDimension_Delete_All ()
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM StoreDimension;
END;
/

CREATE PROCEDURE StoreDimension_Select_All ()
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
StoreKey,
StoreNumber,
StoreZip 
FROM
StoreDimension;
OPEN result;
END;
/

CREATE FUNCTION StoreDimension_Count () RETURNS INTEGER
READS SQL DATA BEGIN ATOMIC
DECLARE v_count INTEGER;
SELECT COUNT(*) INTO v_count
FROM
StoreDimension;
RETURN v_count;
END;
/

CREATE PROCEDURE DateDimension_Insert (
IN v_DateKey INTEGER,
IN v_TheDate DATE,
IN v_TheMonth INTEGER,
IN v_TheYear INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
INSERT INTO DateDimension (
DateKey,
TheDate,
TheMonth,
TheYear
) VALUES (
v_DateKey,
v_TheDate,
v_TheMonth,
v_TheYear
);
END;
/

CREATE PROCEDURE DateDimension_Update (
IN v_DateKey INTEGER,
IN v_TheDate DATE,
IN v_TheMonth INTEGER,
IN v_TheYear INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
UPDATE
DateDimension
SET
TheDate = v_TheDate,
TheMonth = v_TheMonth,
TheYear = v_TheYear
WHERE
DateKey = v_DateKey;
END;
/

CREATE PROCEDURE DateDimension_Delete (
IN v_DateKey INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM
DateDimension
WHERE
DateKey = v_DateKey;
END;
/

CREATE PROCEDURE DateDimension_Merge (
IN v_DateKey INTEGER,
IN v_TheDate DATE,
IN v_TheMonth INTEGER,
IN v_TheYear INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
MERGE INTO DateDimension USING ( VALUES (
v_DateKey,
v_TheDate,
v_TheMonth,
v_TheYear
) ) ON (
DateKey = v_DateKey
)
WHEN MATCHED THEN UPDATE SET
TheDate = v_TheDate,
TheMonth = v_TheMonth,
TheYear = v_TheYear
WHEN NOT MATCHED THEN INSERT VALUES
v_DateKey,
v_TheDate,
v_TheMonth,
v_TheYear;
END;
/

CREATE PROCEDURE DateDimension_Select (
IN v_DateKey INTEGER
)
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
DateKey,
TheDate,
TheMonth,
TheYear
FROM
DateDimension
WHERE
DateKey = v_DateKey;
OPEN result;
END;
/

CREATE PROCEDURE DateDimension_Delete_All ()
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM DateDimension;
END;
/

CREATE PROCEDURE DateDimension_Select_All ()
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
DateKey,
TheDate,
TheMonth,
TheYear 
FROM
DateDimension;
OPEN result;
END;
/

CREATE FUNCTION DateDimension_Count () RETURNS INTEGER
READS SQL DATA BEGIN ATOMIC
DECLARE v_count INTEGER;
SELECT COUNT(*) INTO v_count
FROM
DateDimension;
RETURN v_count;
END;
/

