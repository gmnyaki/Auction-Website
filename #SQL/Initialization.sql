DROP DATABASE AUCTION_WEBSITE;
CREATE DATABASE AUCTION_WEBSITE;
GO
USE AUCTION_WEBSITE;
GO

-------------------------------------------------------------------
------------------- Create Entity Tables --------------------------

CREATE TABLE PERSON (
	ID			INT			  NOT NULL		IDENTITY(1,1), 
	NAME		VARCHAR(50)   NOT NULL,
	USERNAME	VARCHAR(10)	  NOT NULL		UNIQUE,
	PASSWORD	VARCHAR(25)	  NOT NULL,
	EMAIL		VARCHAR(25)	  NOT NULL		UNIQUE,
	TELEPHONE	VARCHAR(12)	  NOT NULL,

	PRIMARY KEY (ID)
)
GO

CREATE TABLE PERSON_ADDRESS (
	PERSON_ID		INT				NOT NULL,
	STREET			VARCHAR(50)		NOT NULL,
	CITY			VARCHAR(25)		NOT NULL,
	STATE			VARCHAR(25)		NOT NULL,
	ZIP				CHAR(6)			NOT NULL,
	
	PRIMARY KEY (PERSON_ID),
	FOREIGN KEY (PERSON_ID) REFERENCES PERSON (ID)
)
GO

CREATE TABLE PERSON_CREDITCARD (
	PERSON_ID			INT				NOT NULL,
	OWNER_NAME			VARCHAR(25)		NOT NULL,
	NUMBER				CHAR(16)		NOT NULL,
	EXPIRATION_DATE		CHAR(7)			NOT NULL,

	PRIMARY KEY (PERSON_ID),
	FOREIGN KEY (PERSON_ID) REFERENCES PERSON (ID)
)
GO

CREATE TABLE ITEM (
	ID				INT				NOT NULL	IDENTITY(1,1),
	NAME			VARCHAR(25)		NOT NULL,
	CONDITION		VARCHAR(11)		NOT NULL,
	INITIAL_PRICE	REAL			NOT NULL,
	DESCRIPTION		VARCHAR(100)	NULL,
	QUANTITY		INT				NOT NULL,
	OWNER			INT				NOT NULL,
	BID_START_TIME	DATETIME		NOT NULL,
	BID_END_TIME	DATETIME		NOT NULL,

	PRIMARY KEY (ID),
	FOREIGN KEY (OWNER) REFERENCES PERSON (ID)
)
GO

CREATE TABLE ITEM_PICTURE (
	ITEM_ID		INT				NOT NULL,
	LOCATION	VARCHAR(255)	NOT NULL,

	PRIMARY KEY (ITEM_ID),
	FOREIGN KEY (ITEM_ID) REFERENCES ITEM (ID)
)
GO

CREATE TABLE PERSON_ITEM (
	PERSON_ID	INT		NOT NULL,
	ITEM_ID		INT		NOT NULL,
	BID_AMOUNT	REAL	NOT NULL,

	PRIMARY KEY (PERSON_ID, ITEM_ID),
	FOREIGN KEY (PERSON_ID) REFERENCES PERSON (ID),
	FOREIGN KEY (ITEM_ID) REFERENCES ITEM (ID)
)
GO

SELECT * FROM PERSON
SELECT * FROM PERSON_ADDRESS
SELECT * FROM PERSON_CREDITCARD

SELECT * FROM ITEM
SELECT * FROM ITEM_PICTURE
SELECT * FROM PERSON_ITEM
GO

-------------------------------------------------------------------------------
--------------------- Create Views for Reports --------------------------------

-------------------------------------------------------
------ Get the Highest Bidder on an Item --------------

CREATE VIEW HIGHEST_BIDDER AS
	SELECT
		ITEM_ID AS ITEM_ID,
		MAX(BID_AMOUNT) AS BID_AMOUNT
	FROM 
		PERSON_ITEM
	GROUP BY 
		ITEM_ID
GO

SELECT * FROM HIGHEST_BIDDER
GO

--------------------------------------------------------
------- Partial Views to return Subsets of ITEM --------

CREATE VIEW ITEMS_SOLD AS
	SELECT
		ITEM_ID,
		MAX(BID_AMOUNT) AS MAX_BID
	FROM 
		PERSON_ITEM
	JOIN ITEM ON
		ITEM.ID = PERSON_ITEM.ITEM_ID
	WHERE
		ITEM.BID_START_TIME < SYSDATETIME()
		AND
		ITEM.BID_END_TIME < SYSDATETIME()
	GROUP BY
		ITEM_ID
GO

CREATE VIEW ITEMS_OFFERED AS
	SELECT
		ID,
		OWNER
	FROM
		ITEM
	WHERE 
		BID_START_TIME < SYSDATETIME()
GO

CREATE VIEW ITEMS_AVAILABLE AS
	SELECT
		ID,
		OWNER
	FROM
		ITEM
	WHERE
		BID_START_TIME < SYSDATETIME()
		AND
		BID_END_TIME > SYSDATETIME()
GO

SELECT * FROM ITEMS_SOLD
SELECT * FROM ITEMS_OFFERED
SELECT * FROM ITEMS_AVAILABLE
GO

-----------------------------------------------------
-------------- Views for Reports --------------------

-------------------------------------
-------- MOST_ACTIVE_BUYERS ---------

CREATE VIEW PERSON_ITEMS_BOUGHT AS
	SELECT
		PERSON.NAME AS PERSON_NAME,
		COUNT(MAX_BID) AS ITEMS_BOUGHT
	FROM
		ITEMS_SOLD
	JOIN PERSON_ITEM ON
		ITEMS_SOLD.ITEM_ID = PERSON_ITEM.ITEM_ID 
		AND 
		ITEMS_SOLD.MAX_BID = PERSON_ITEM.BID_AMOUNT
	JOIN PERSON ON
		PERSON_ITEM.PERSON_ID = PERSON.ID
	GROUP BY
		PERSON.NAME
GO

CREATE VIEW MOST_ACTIVE_BUYERS AS
	SELECT TOP 5
		PERSON_NAME,
		ITEMS_BOUGHT
	FROM 
		PERSON_ITEMS_BOUGHT
	ORDER BY
		ITEMS_BOUGHT DESC
GO

SELECT * FROM ITEMS_SOLD
SELECT * FROM PERSON_ITEMS_BOUGHT
SELECT * FROM MOST_ACTIVE_BUYERS
GO

-----------------------------------------------------------
------------------ MOST_POPULAR_SELLERS -------------------

CREATE VIEW PERSON_ITEMS_SOLD AS
	SELECT
		PERSON.NAME AS PERSON_NAME,
		COUNT(MAX_BID) AS ITEMS_SOLD
	FROM
		ITEMS_SOLD
	JOIN PERSON_ITEM ON
		ITEMS_SOLD.ITEM_ID = PERSON_ITEM.ITEM_ID
		AND
		ITEMS_SOLD.MAX_BID = PERSON_ITEM.BID_AMOUNT
	JOIN ITEM ON
		PERSON_ITEM.ITEM_ID = ITEM.ID
		AND
		PERSON_ITEM.PERSON_ID = ITEM.OWNER
	JOIN PERSON ON
		ITEM.OWNER = PERSON.ID
	GROUP BY
		PERSON.NAME
GO

CREATE VIEW MOST_POPULAR_SELLERS AS
	SELECT TOP 5
		PERSON_NAME,
		ITEMS_SOLD
	FROM
		PERSON_ITEMS_SOLD
	ORDER BY
		ITEMS_SOLD DESC
GO

SELECT * FROM ITEMS_SOLD
SELECT * FROM PERSON_ITEMS_SOLD
SELECT * FROM MOST_POPULAR_SELLERS
GO

-----------------------------------------------------------
------------------ MOST_ACTIVE_SELLERS --------------------

CREATE VIEW PERSON_ITEMS_OFFERED AS
	SELECT
		PERSON.NAME AS PERSON_NAME,
		COUNT(ITEMS_OFFERED.ID) AS ITEMS_OFFERED
	FROM ITEMS_OFFERED
	JOIN PERSON ON
		ITEMS_OFFERED.OWNER = PERSON.ID
	GROUP BY PERSON.NAME
GO

CREATE VIEW MOST_ACTIVE_SELLERS AS
	SELECT TOP 5
		PERSON_NAME,
		ITEMS_OFFERED
	FROM 
		PERSON_ITEMS_OFFERED
	ORDER BY
		ITEMS_OFFERED DESC
GO

SELECT * FROM ITEMS_OFFERED
SELECT * FROM PERSON_ITEMS_OFFERED
SELECT * FROM MOST_ACTIVE_SELLERS
GO

------------------------------------------------------------
-------------------- MOST_EXPENSIVE_ITEMS_SOLD -------------

CREATE VIEW MOST_EXPENSIVE_ITEMS_SOLD AS
	SELECT TOP 5
		ITEM.NAME,
		MAX_BID
	FROM
		ITEMS_SOLD
	JOIN ITEM ON
		ITEMS_SOLD.ITEM_ID = ITEM.ID
	ORDER BY
		MAX_BID DESC
GO

SELECT * FROM ITEMS_SOLD
SELECT * FROM MOST_EXPENSIVE_ITEMS_SOLD
GO

------------------------------------------------------------
-------------- MOST_EXPENSIVE_ITEMS_AVAILABLE --------------

CREATE VIEW MOST_EXPENSIVE_ITEMS_AVAILABLE AS
	SELECT TOP 5
		ITEM.NAME,
		MAX(PERSON_ITEM.BID_AMOUNT) AS MAX_BID
	FROM
		ITEMS_AVAILABLE
	JOIN ITEM ON
		ITEMS_AVAILABLE.ID = ITEM.ID
	JOIN PERSON_ITEM ON
		ITEMS_AVAILABLE.ID = PERSON_ITEM.ITEM_ID
	GROUP BY 
		ITEM.NAME
	ORDER BY
		MAX_BID DESC
GO

------------------------------------------------------------
-------------------- LEAST_EXPENSIVE_ITEMS_SOLD ------------

CREATE VIEW LEAST_EXPENSIVE_ITEMS_SOLD AS
	SELECT TOP 5
		ITEM.NAME,
		MAX_BID
	FROM
		ITEMS_SOLD
	JOIN ITEM ON
		ITEMS_SOLD.ITEM_ID = ITEM.ID
	ORDER BY
		MAX_BID ASC
GO

-------------------------------------------------------------
------------------ LEAST_EXPENSIVE_ITEMS_AVAILABLE ----------

CREATE VIEW LEAST_EXPENSIVE_ITEMS_AVAILABLE AS
	SELECT TOP 5
		ITEM.NAME,
		MAX(PERSON_ITEM.BID_AMOUNT) AS MAX_BID
	FROM
		ITEMS_AVAILABLE
	JOIN ITEM ON
		ITEMS_AVAILABLE.ID = ITEM.ID
	JOIN PERSON_ITEM ON
		ITEMS_AVAILABLE.ID = PERSON_ITEM.ITEM_ID
	GROUP BY 
		ITEM.NAME
	ORDER BY
		MAX_BID ASC
GO

--UPDATE ITEM SET HIGHEST_BID = 123.23, HIGHEST_BIDDER = 1 WHERE ID = 58

-- Populate Database with Random Data ---

DECLARE @I INT
SET @I = 1
WHILE @I <= 10
	BEGIN
		INSERT INTO PERSON (NAME, USERNAME, PASSWORD, EMAIL, TELEPHONE)
		VALUES ('Name '+LTRIM(STR(@I)), 'user'+LTRIM(STR(@I)), 'pass'+LTRIM(STR(@I)), 'email'+LTRIM(STR(@I))+'@sample.com', LTRIM(STR(@I)))

		INSERT INTO PERSON_ADDRESS (PERSON_ID, STREET, CITY, STATE, ZIP)
		VALUES (@I, 'Street '+LTRIM(STR(@I)), 'City '+LTRIM(STR(@I)), 'State '+LTRIM(STR(@I)), LTRIM(STR(@I)))

		INSERT INTO PERSON_CREDITCARD (PERSON_ID, OWNER_NAME, NUMBER, EXPIRATION_DATE)
		VALUES (@I, 'Name '+LTRIM(STR(@I)), LTRIM(STR(@I)), LTRIM(STR(@I))+'/'+LTRIM(STR(@I)))

		SET @I = @I + 1
	END

-------------------------------------------------------------------------------

DECLARE @PERSON_ID INT

SET @I = 1
WHILE @I <= 100
	BEGIN
		SET @PERSON_ID = 1 + (((SELECT COUNT(*) FROM PERSON) - 1) * RAND())

		INSERT INTO ITEM(NAME, CONDITION, INITIAL_PRICE, DESCRIPTION, QUANTITY, OWNER, BID_START_TIME, BID_END_TIME)
		VALUES('Name ' + LTRIM(STR(@I)), 'N/A', (@I + RAND() * 100), 'Description ' + LTRIM(STR(@I)), @I, @PERSON_ID, GETDATE(), DATEADD(SECOND, @I*30, GETDATE()))

		INSERT INTO ITEM_PICTURE(ITEM_ID, LOCATION)
		VALUES (@I, 'C:\Pictures\Location'+LTRIM(STR(@I))+'\pic.jpg')

		SET @I = @I + 1
	END

--------------------------------------------------------------------

DECLARE @ITEM_ID INT

SET @I = 1
WHILE @I <= 500
	BEGIN
		SET @PERSON_ID = 1 + (((SELECT COUNT(*) FROM PERSON) - 1) * RAND())
		SET @ITEM_ID = 1 + (((SELECT COUNT(*) FROM ITEM) - 1) * RAND())
		WHILE EXISTS (SELECT * FROM PERSON_ITEM WHERE PERSON_ID = @PERSON_ID AND ITEM_ID = @ITEM_ID)
			BEGIN
				SET @PERSON_ID = 1 + (((SELECT COUNT(*) FROM PERSON) - 1) * RAND())
				SET @ITEM_ID = 1 + (((SELECT COUNT(*) FROM ITEM) - 1) * RAND())
			END

		INSERT INTO PERSON_ITEM(PERSON_ID, ITEM_ID, BID_AMOUNT)
		VALUES (@PERSON_ID, @ITEM_ID, (@I + RAND() * 100))

		SET @I = @I + 1
	END