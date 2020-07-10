CREATE TABLE Users
(
	Id BIGINT UNIQUE IDENTITY (1,1),
	Name VARCHAR(30) NOT NULL,
	Password VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY CHECK (DATALENGTH(ProfilePicture)/1024<900),
	LastLoginTime DATETIME, 
	IsDeleted BIT,
	CONSTRAINT PK_Users PRIMARY KEY(Id)
)

ALTER TABLE Users
	DROP CONSTRAINT PK_Users

ALTER TABLE Users 
	ADD CONSTRAINT 
	PK_Users PRIMARY KEY(Id, Name)

ALTER TABLE Users
	ADD CONSTRAINT 
	PK_Users PRIMARY KEY(Id)
	

ALTER TABLE Users 
	ADD  CONSTRAINT CK_Password CHECK ( LEN(Password) >= 5),
	     CONSTRAINT CK_Name CHECK (LEN(Name) >= 3)

ALTER TABLE Users
	ADD CONSTRAINT DF_LastLoginTime DEFAULT GETDATE() FOR LastLoginTime;

INSERT INTO Users(Name, Password, ProfilePicture, IsDeleted)
VALUES
('John', 'password', NULL, 1),
('Smith', 'password',NULL, 1),
('Jane', 'password', NULL, 1),
('Doee', 'password', NULL, 1),
('Will', 'password', NULL, 1)


INSERT INTO Users(Name, Password, ProfilePicture, IsDeleted)
VALUES
('Man', '12345',NULL, 1)

SELECT * FROM Users

DELETE FROM Users

DROP TABLE Users