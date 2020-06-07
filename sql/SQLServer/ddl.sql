USE CampusDb

CREATE TABLE [Role]
(
    Id   INT IDENTITY NOT NULL PRIMARY KEY,
    Name VARCHAR(50)  NOT NULL,
)
GO

CREATE TABLE [Status]
(
    Id   INT IDENTITY NOT NULL PRIMARY KEY,
    Name VARCHAR(50)  NOT NULL,
)
GO

CREATE TABLE [AppUser]
(
    Id               INT IDENTITY   NOT NULL PRIMARY KEY,
    Name             VARCHAR(80)    NOT NULL,
    Surname          VARCHAR(80)    NULL,
    Email            VARCHAR(100)   NOT NULL,
    Login            VARCHAR(60)    NOT NULL UNIQUE,
    PasswordHash     VARBINARY(MAX) NOT NULL,
    PasswordSalt     VARBINARY(MAX) NOT NULL,
    RegistrationDate DATETIME       NOT NULL,
    RoleId           INT FOREIGN KEY REFERENCES [Role] (Id) ON DELETE CASCADE
)
GO

CREATE TABLE [Project]
(
    Id     INT IDENTITY  NOT NULL PRIMARY KEY,
    Name   NVARCHAR(100) NOT NULL,
    Color  NVARCHAR(30)  NULL,
    UserId INT FOREIGN KEY REFERENCES [AppUser] (Id) ON DELETE CASCADE,
    StatusId INT FOREIGN KEY REFERENCES [Status] (Id) ON DELETE CASCADE
)
GO

CREATE TABLE [UserTask]
(
    Id          INT IDENTITY  NOT NULL PRIMARY KEY,
    Description NVARCHAR(MAX) NOT NULL,
    Priority    VARCHAR(30)   NOT NULL,
    ProjectTag  VARCHAR(50)   NOT NULL,
    Deadline    DATETIME      NULL,
    ProjectId   INT FOREIGN KEY REFERENCES [Project] (Id) ON DELETE CASCADE
)
GO