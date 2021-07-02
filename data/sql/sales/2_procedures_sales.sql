SET SCHEMA Sales_Schema;
/

CREATE PROCEDURE Product_Insert (
IN v_ProductId INTEGER,
IN v_ProductName INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
INSERT INTO Product (
ProductId,
ProductName
) VALUES (
v_ProductId,
v_ProductName
);
END;
/

CREATE PROCEDURE Product_Update (
IN v_ProductId INTEGER,
IN v_ProductName INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
UPDATE
Product
SET
ProductName = v_ProductName
WHERE
ProductId = v_ProductId;
END;
/

CREATE PROCEDURE Product_Delete (
IN v_ProductId INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM
Product
WHERE
ProductId = v_ProductId;
END;
/

CREATE PROCEDURE Product_Merge (
IN v_ProductId INTEGER,
IN v_ProductName INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
MERGE INTO Product USING ( VALUES (
v_ProductId,
v_ProductName
) ) ON (
ProductId = v_ProductId
)
WHEN MATCHED THEN UPDATE SET
ProductName = v_ProductName
WHEN NOT MATCHED THEN INSERT VALUES
v_ProductId,
v_ProductName;
END;
/

CREATE PROCEDURE Product_Select (
IN v_ProductId INTEGER
)
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
ProductId,
ProductName
FROM
Product
WHERE
ProductId = v_ProductId;
OPEN result;
END;
/

CREATE PROCEDURE Product_Delete_All ()
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM Product;
END;
/

CREATE PROCEDURE Product_Select_All ()
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
ProductId,
ProductName 
FROM
Product;
OPEN result;
END;
/

CREATE FUNCTION Product_Count () RETURNS INTEGER
READS SQL DATA BEGIN ATOMIC
DECLARE v_count INTEGER;
SELECT COUNT(*) INTO v_count
FROM
Product;
RETURN v_count;
END;
/

CREATE PROCEDURE Customer_Insert (
IN v_CustomerId INTEGER,
IN v_CustomeName LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
INSERT INTO Customer (
CustomerId,
CustomeName
) VALUES (
v_CustomerId,
v_CustomeName
);
END;
/

CREATE PROCEDURE Customer_Update (
IN v_CustomerId INTEGER,
IN v_CustomeName LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
UPDATE
Customer
SET
CustomeName = v_CustomeName
WHERE
CustomerId = v_CustomerId;
END;
/

CREATE PROCEDURE Customer_Delete (
IN v_CustomerId INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM
Customer
WHERE
CustomerId = v_CustomerId;
END;
/

CREATE PROCEDURE Customer_Merge (
IN v_CustomerId INTEGER,
IN v_CustomeName LONGVARCHAR
)
MODIFIES SQL DATA BEGIN ATOMIC
MERGE INTO Customer USING ( VALUES (
v_CustomerId,
v_CustomeName
) ) ON (
CustomerId = v_CustomerId
)
WHEN MATCHED THEN UPDATE SET
CustomeName = v_CustomeName
WHEN NOT MATCHED THEN INSERT VALUES
v_CustomerId,
v_CustomeName;
END;
/

CREATE PROCEDURE Customer_Select (
IN v_CustomerId INTEGER
)
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
CustomerId,
CustomeName
FROM
Customer
WHERE
CustomerId = v_CustomerId;
OPEN result;
END;
/

CREATE PROCEDURE Customer_Delete_All ()
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM Customer;
END;
/

CREATE PROCEDURE Customer_Select_All ()
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
CustomerId,
CustomeName 
FROM
Customer;
OPEN result;
END;
/

CREATE FUNCTION Customer_Count () RETURNS INTEGER
READS SQL DATA BEGIN ATOMIC
DECLARE v_count INTEGER;
SELECT COUNT(*) INTO v_count
FROM
Customer;
RETURN v_count;
END;
/

CREATE PROCEDURE ProductSales_Insert (
IN v_CustomerId INTEGER,
IN v_ProductId INTEGER,
IN v_Quantity DOUBLE,
IN v_UnitPrice DOUBLE,
IN v_SalesDate DATE
)
MODIFIES SQL DATA BEGIN ATOMIC
INSERT INTO ProductSales (
CustomerId,
ProductId,
Quantity,
UnitPrice,
SalesDate
) VALUES (
v_CustomerId,
v_ProductId,
v_Quantity,
v_UnitPrice,
v_SalesDate
);
END;
/

CREATE PROCEDURE ProductSales_Update (
IN v_CustomerId INTEGER,
IN v_ProductId INTEGER,
IN v_Quantity DOUBLE,
IN v_UnitPrice DOUBLE,
IN v_SalesDate DATE
)
MODIFIES SQL DATA BEGIN ATOMIC
UPDATE
ProductSales
SET
Quantity = v_Quantity,
UnitPrice = v_UnitPrice,
SalesDate = v_SalesDate
WHERE
CustomerId = v_CustomerId
AND
ProductId = v_ProductId;
END;
/

CREATE PROCEDURE ProductSales_Delete (
IN v_CustomerId INTEGER,
IN v_ProductId INTEGER
)
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM
ProductSales
WHERE
CustomerId = v_CustomerId
AND
ProductId = v_ProductId;
END;
/

CREATE PROCEDURE ProductSales_Merge (
IN v_CustomerId INTEGER,
IN v_ProductId INTEGER,
IN v_Quantity DOUBLE,
IN v_UnitPrice DOUBLE,
IN v_SalesDate DATE
)
MODIFIES SQL DATA BEGIN ATOMIC
MERGE INTO ProductSales USING ( VALUES (
v_CustomerId,
v_ProductId,
v_Quantity,
v_UnitPrice,
v_SalesDate
) ) ON (
CustomerId = v_CustomerId
AND
ProductId = v_ProductId
)
WHEN MATCHED THEN UPDATE SET
Quantity = v_Quantity,
UnitPrice = v_UnitPrice,
SalesDate = v_SalesDate
WHEN NOT MATCHED THEN INSERT VALUES
v_CustomerId,
v_ProductId,
v_Quantity,
v_UnitPrice,
v_SalesDate;
END;
/

CREATE PROCEDURE ProductSales_Select (
IN v_CustomerId INTEGER,
IN v_ProductId INTEGER
)
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
CustomerId,
ProductId,
Quantity,
UnitPrice,
SalesDate
FROM
ProductSales
WHERE
CustomerId = v_CustomerId
AND
ProductId = v_ProductId;
OPEN result;
END;
/

CREATE PROCEDURE ProductSales_Delete_All ()
MODIFIES SQL DATA BEGIN ATOMIC
DELETE FROM ProductSales;
END;
/

CREATE PROCEDURE ProductSales_Select_All ()
MODIFIES SQL DATA DYNAMIC RESULT SETS 1 BEGIN ATOMIC
DECLARE result CURSOR
FOR
SELECT
CustomerId,
ProductId,
Quantity,
UnitPrice,
SalesDate 
FROM
ProductSales;
OPEN result;
END;
/

CREATE FUNCTION ProductSales_Count () RETURNS INTEGER
READS SQL DATA BEGIN ATOMIC
DECLARE v_count INTEGER;
SELECT COUNT(*) INTO v_count
FROM
ProductSales;
RETURN v_count;
END;
/

