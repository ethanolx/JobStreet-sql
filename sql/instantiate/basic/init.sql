/* Reset Database From Scratch */
DROP DATABASE IF EXISTS JobStreet2012085;

CREATE DATABASE JobStreet2012085;

USE JobStreet2012085;

/* Utility Functions */
DROP FUNCTION IF EXISTS dbo.MonthVerbose;
GO

CREATE FUNCTION dbo.MonthVerbose(@dt DATE) RETURNS VARCHAR(12) AS
BEGIN
    DECLARE @month INTEGER
    SET @month = MONTH(@dt)
    RETURN
        CASE
            WHEN @month = 1 THEN 'Jan'
            WHEN @month = 2 THEN 'Feb'
            WHEN @month = 3 THEN 'Mar'
            WHEN @month = 4 THEN 'Apr'
            WHEN @month = 5 THEN 'May'
            WHEN @month = 6 THEN 'Jun'
            WHEN @month = 7 THEN 'Jul'
            WHEN @month = 8 THEN 'Aug'
            WHEN @month = 9 THEN 'Sep'
            WHEN @month = 10 THEN 'Oct'
            WHEN @month = 11 THEN 'Nov'
            WHEN @month = 12 THEN 'Dec'
        END
END;
GO

DROP FUNCTION IF EXISTS dbo.GetFullName;
GO

CREATE FUNCTION dbo.GetFullName(@fname VARCHAR(15), @lname VARCHAR(15)) RETURNS VARCHAR(31) AS
BEGIN
    RETURN @fname + ' ' + ISNULL(@lname, '')
END;
GO

DROP FUNCTION IF EXISTS dbo.DateVerbose;
GO

CREATE FUNCTION dbo.DateVerbose(@dt DATE) RETURNS VARCHAR(15) AS
BEGIN
    RETURN CAST(YEAR(@dt) AS CHAR(4)) + ' ' + dbo.MonthVerbose(@dt)
END;
GO

/* Relations */
CREATE TABLE Member (
    Email VARCHAR(30),
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(15),
    [Password] VARCHAR(20) NOT NULL,
    HasWorkExperience BIT NOT NULL DEFAULT 0,
    WorkingSince INTEGER,
    ExpectedSalary DECIMAL(7, 2),
    ResidentCountry VARCHAR(20) NOT NULL,
    Nationality VARCHAR(20),
    PRCountry VARCHAR(20),
    PRIMARY KEY (Email),
    CHECK (WorkingSince BETWEEN 1900 AND 2200)
);

CREATE TABLE [Language] (
    MemberEmail VARCHAR(30),
    Language VARCHAR(20),
    PrimaryLanguage BIT NOT NULL DEFAULT 0,
    LangProficiency TINYINT NOT NULL,
    PRIMARY KEY (MemberEmail, Language),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    CHECK (LangProficiency BETWEEN 0 AND 10)
);

CREATE TABLE Skill (
    MemberEmail VARCHAR(30),
    Skill VARCHAR(20),
    ProficiencyLevel VARCHAR(12) NOT NULL,
    PRIMARY KEY (MemberEmail, Skill),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    CHECK ProficiencyLevel IN ('Beginner', 'Intermediate', 'Advanced')
);

CREATE TABLE PreferredSpecialization (
    MemberEmail VARCHAR(30),
    Specialization VARCHAR(40),
    PRIMARY KEY (MemberEmail, Specialization),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE PreferredWorkLocation (
    MemberEmail VARCHAR(30),
    Region VARCHAR(25),
    PRIMARY KEY (MemberEmail, Region),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE CurrentEducation (
    MemberEmail VARCHAR(30),
    YearOfAdmission INTEGER NOT NULL,
    CurrentLevelOfStudy VARCHAR(15) NOT NULL,
    CourseOfStudy VARCHAR(30) NOT NULL,
    InstituteName VARCHAR(30) NOT NULL,
    PRIMARY KEY (MemberEmail),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    CHECK YearOfAdmission BETWEEN 1900 AND 2200
);

CREATE TABLE HighestQualification (
    MemberEmail VARCHAR(30),
    Qualification VARCHAR(25) NOT NULL,
    InstituteName VARCHAR(30) NOT NULL,
    FieldOfStudy VARCHAR(20) NOT NULL,
    InstituteLocation VARCHAR(30) NOT NULL,
    GraduationDate DATE NOT NULL,
    PRIMARY KEY (MemberEmail),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);
/* where i stopped */
CREATE TABLE Company (
    CompanyRegNo VARCHAR(5) PRIMARY KEY,
    CompanyName VARCHAR(40) NOT NULL,
    Address VARCHAR(15) NULL,
    WorkStartTime TIME NULL,
    WorkEndTime TIME NULL,
    CompanySizeMin INTEGER NULL,
    CompanySizeMax INTEGER NULL,
    Industry VARCHAR(20),
    CHECK (CompanySizeMax > CompanySizeMin)
);

CREATE TABLE WorkExperience (
    WorkExperienceID SMALLINT IDENTITY(1, 1) PRIMARY KEY,
    PositionTitle VARCHAR(20) NOT NULL,
    CompanyRegNo VARCHAR(5),
    Industry VARCHAR(20),
    Role VARCHAR(15),
    PositionLevel VARCHAR(15),
    Specialization VARCHAR(40),
    JoinedIn DATE NULL,
    JoinedUntil DATE DEFAULT NULL,
    MobileNumber VARCHAR(15),
    MemberEmail VARCHAR(30),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo)
);

CREATE TABLE JobVacancy (
    JobID INTEGER PRIMARY KEY,
    JobTitle VARCHAR(25) NOT NULL,
    WorkLocation VARCHAR(15),
    Specialization VARCHAR(40),
    SalaryMin INTEGER NULL,
    SalaryMax INTEGER NULL,
    JobLevel VARCHAR(20) NOT NULL,
    JobResponsibilities VARCHAR(150),
    AdvertisementDate DATE DEFAULT NULL,
    ApplicationClosingDate DATE DEFAULT NULL,
    CompanyRegNo VARCHAR(5),
    CHECK (SalaryMax > SalaryMin),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo)
);

CREATE TABLE Review (
    MemberEmail VARCHAR(30),
    CompanyRegNo VARCHAR(5),
    RecommendToFriend BIT,
    OverallRating TINYINT CHECK (OverallRating BETWEEN 1 AND 5),
    SalaryRating VARCHAR(7) CHECK (SalaryRating IN ('High', 'Average', 'Low')),
    DateOfReview TIMESTAMP,
    PRIMARY KEY (MemberEmail, CompanyRegNo),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo)
);
