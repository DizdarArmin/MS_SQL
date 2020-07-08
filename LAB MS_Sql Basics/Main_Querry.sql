-- 2.Create Tables 

CREATE TABLE Clients
(
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL
)
CREATE TABLE AccountTypes
(
	Id	INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Accounts 
(
	Id	INT PRIMARY KEY IDENTITY,
	AccountTypeId INT FOREIGN KEY REFERENCES AccountTypes(Id),
	Balance DECIMAL (15, 2 ) NOT NULL DEFAULT(0),
	ClientId INT FOREIGN KEY REFERENCES Clients(Id)
)

-- Transactions table 
CREATE TABLE Transactions (
	Id INT PRIMARY KEY IDENTITY,
	AccountId INT FOREIGN KEY REFERENCES Accounts(Id),
	OldBalance DECIMAL (15, 2) NOT NULL,
	NewBalance DECIMAL (15, 2) NOT NULL,
	Amount AS NewBalance - OldBalance,
	[DateTime] DATETIME2
)




--3.Insert Example Data into our Database 
INSERT INTO Clients (FirstName, LastName)
	VALUES
	('Greta', 'Andersson'), 
	('Peter', 'Pettersson'), 
	('Mel', 'Gibson'), 
	('Maria', 'Danielsson')

INSERT INTO AccountTypes (Name) 
	VALUES
	('Checking'), 
	('Savings')

INSERT INTO Accounts (ClientId, AccountTypeId, Balance)
	VALUES
	(1, 1, 175), 
	(2, 1, 275.56), 
	(3, 1, 138.01), 
	(4, 1, 40.30), 
	(4, 2, 375.50)

SELECT dbo.f_CalculateTotalBalance(4) AS BALANCE




p_AddAccount 2, 1

p_Deposit 4, 20
GO

p_Withdraw 6, 6

SELECT * FROM v_ClientBalances

SELECT * FROM Transactions