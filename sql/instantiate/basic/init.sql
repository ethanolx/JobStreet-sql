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

DROP FUNCTION IF EXISTS dbo.CheckWorkExperience;
GO

CREATE FUNCTION dbo.CheckWorkExperience(@em VARCHAR(30), @comp CHAR(5)) RETURNS BIT AS
BEGIN
    IF @em IN (SELECT DISTINCT MemberEmail FROM WorkExperience WHERE CompanyRegNo = @comp)
        RETURN 1
    RETURN 0
END;
GO

/* Relations */
CREATE TABLE Member (
    Email VARCHAR(30) NOT NULL,
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(15) DEFAULT NULL,
    [Password] VARCHAR(20) NOT NULL,
    WorkingSince INTEGER DEFAULT NULL,
    ExpectedSalary DECIMAL(7, 2) DEFAULT NULL,
    ResidentCountry VARCHAR(20) NOT NULL,
    Nationality VARCHAR(20) NOT NULL,
    PRCountry VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (Email),
    CHECK (Email LIKE '%@%'),
    CHECK (WorkingSince BETWEEN 1900 AND 2200)
);

CREATE TABLE [Language] (
    MemberEmail VARCHAR(30) NOT NULL,
    [Language] VARCHAR(20) NOT NULL,
    PrimaryLanguage BIT NOT NULL DEFAULT 0,
    LangProficiency TINYINT NOT NULL,
    PRIMARY KEY (MemberEmail, [Language]),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    CHECK (LangProficiency BETWEEN 0 AND 10)
);

CREATE TABLE Skill (
    MemberEmail VARCHAR(30) NOT NULL,
    Skill VARCHAR(20) NOT NULL,
    SkillProficiency VARCHAR(12) NOT NULL,
    PRIMARY KEY (MemberEmail, Skill),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    CHECK (SkillProficiency IN ('Beginner', 'Intermediate', 'Advanced'))
);

CREATE TABLE PreferredSpecialization (
    MemberEmail VARCHAR(30) NOT NULL,
    Specialization VARCHAR(40) NOT NULL,
    PRIMARY KEY (MemberEmail, Specialization),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE PreferredWorkLocation (
    MemberEmail VARCHAR(30) NOT NULL,
    Region VARCHAR(25) NOT NULL,
    PRIMARY KEY (MemberEmail, Region),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE CurrentEducation (
    MemberEmail VARCHAR(30) NOT NULL,
    YearOfAdmission INTEGER NOT NULL,
    CurrentLevelOfStudy VARCHAR(15) NOT NULL,
    CourseOfStudy VARCHAR(30) NOT NULL,
    InstituteName VARCHAR(40) NOT NULL,
    Qualification VARCHAR(25) NOT NULL,
    PRIMARY KEY (MemberEmail),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    CHECK (YearOfAdmission BETWEEN 1900 AND 2200)
);

CREATE TABLE HighestQualification (
    MemberEmail VARCHAR(30) NOT NULL,
    Qualification VARCHAR(25) NOT NULL,
    InstituteName VARCHAR(40) NOT NULL,
    FieldOfStudy VARCHAR(30) NOT NULL,
    InstituteLocation VARCHAR(30) NOT NULL,
    GraduationDate DATE NOT NULL,
    PRIMARY KEY (MemberEmail),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE Company (
    CompanyRegNo CHAR(5) NOT NULL,
    CompanyName VARCHAR(40) NOT NULL UNIQUE,
    [Address] VARCHAR(40) DEFAULT NULL,
    WorkStartTime TIME DEFAULT NULL,
    WorkEndTime TIME DEFAULT NULL,
    CompanySizeMin INTEGER DEFAULT NULL,
    CompanySizeMax INTEGER DEFAULT NULL,
    Industry VARCHAR(30) NOT NULL,
    PRIMARY KEY (CompanyRegNo),
    CHECK (CompanySizeMax > CompanySizeMin)
);

CREATE TABLE WorkExperience (
    WorkExperienceID INTEGER IDENTITY(1, 1) NOT NULL,
    PositionTitle VARCHAR(40) NOT NULL,
    CompanyRegNo CHAR(5),
    MemberEmail VARCHAR(30) NOT NULL,
    [Role] VARCHAR(20) NOT NULL,
    PositionLevel VARCHAR(20) NOT NULL,
    Specialization VARCHAR(40) NOT NULL,
    JoinedIn DATE NOT NULL,
    JoinedUntil DATE DEFAULT NULL,
    MobileNumber VARCHAR(15) DEFAULT NULL,
    CompanyName VARCHAR(40) DEFAULT NULL,
    PRIMARY KEY (WorkExperienceID),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo),
    CHECK ((CompanyRegNo IS NULL AND CompanyName IS NOT NULL) OR (CompanyRegNo IS NOT NULL AND CompanyName IS NULL))
);

CREATE TABLE Review (
    MemberEmail VARCHAR(30) NOT NULL,
    CompanyRegNo CHAR(5) NOT NULL,
    RecommendToFriend BIT NOT NULL,
    OverallRating TINYINT NOT NULL,
    SalaryRating VARCHAR(7) NOT NULL,
    DateOfReview DATE NOT NULL DEFAULT GETDATE(),
    PRIMARY KEY (MemberEmail, CompanyRegNo),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo),
    CHECK (OverallRating BETWEEN 1 AND 5),
    CHECK (SalaryRating IN ('High', 'Average', 'Low')),
    CHECK (dbo.CheckWorkExperience(MemberEmail, CompanyRegNo) = 1)
);

CREATE TABLE JobVacancy (
    CompanyRegNo CHAR(5) NOT NULL,
    JobID INTEGER IDENTITY(1, 1) NOT NULL,
    JobTitle VARCHAR(40) NOT NULL,
    JobLevel VARCHAR(20) NOT NULL,
    WorkLocation VARCHAR(25) NOT NULL,
    Specialization VARCHAR(40) NOT NULL,
    MinSalary DECIMAL(7, 2) DEFAULT NULL,
    MaxSalary DECIMAL(7, 2) DEFAULT NULL,
    JobResponsibilities VARCHAR(120),
    AdvertisementDate DATE DEFAULT NULL,
    ApplicationClosingDate DATE DEFAULT NULL,
    PRIMARY KEY (JobID),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo),
    CHECK (MaxSalary > MinSalary)
);

CREATE TABLE JobApplication (
    MemberEmail VARCHAR(30) NOT NULL,
    JobID INTEGER NOT NULL,
    PRIMARY KEY (MemberEmail, JobID),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    FOREIGN KEY (JobID) REFERENCES JobVacancy (JobID)
);
