CREATE TABLE Minions (
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(50) NOT NULL,
	AGE INT NULL,
)

ALTER TABLE Minions
ADD TownId INT FOREIGN KEY REFERENCES Towns(Id);

CREATE TABLE Towns(
	Id INT PRIMARY KEY IDENTITY,
	NAME NVARCHAR(50) NOT NULL,
)
INSERT INTO Towns(NAME)
VALUES
('Sofia'),
('Peter'),
('Victoria')

INSERT INTO Minions(Name,AGE,TownId)
VALUES
('Kevin', 22, 1),
('Bob', 15, 3),
('Kevin', NULL, 2)

SELECT * FROM Minions
DELETE FROM Minions

CREATE TABLE People(
	Id INT PRIMARY KEY IDENTITY (1,1),
    Name VARCHAR(255) NOT NULL,
	Picture VARBINARY(max) DEFAULT NULL,
	Height DECIMAL (15, 2 ) NULL,
	Weight DECIMAL (15, 2 ) NULL,
	Gender VARCHAR(1) NOT NULL CHECK (Gender IN ('M', 'F')),
	Birthdate DATE NOT NULL,
	Biography NTEXT NULL
)
--DROP TABLE People

INSERT INTO People(Name, Picture, Height, Weight,Gender,Birthdate,Biography)
VALUES 
('Armin',NULL,1.83, 110.5, 'M', '1992-06-13', 'Musician, Developer, Artist'),
('Second',NULL,1.85, 90.5, 'M', '1992-06-13', 'Musician, Developer, Artist'),
('Third',NULL,1.89, 92.5, 'M', '1992-06-13', 'Musician, Developer, Artist'),
('Fourth',NULL,1.93, 88.5, 'F', '1992-06-13', 'Musician, Developer, Artist'),
('Fifth',NULL,1.73, 67.5, 'F', '1992-06-13', 'Musician, Developer, Artist')

SELECT * FROM People 

