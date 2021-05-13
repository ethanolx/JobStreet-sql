DROP DATABASE IF EXISTS JobStreet2012085;

CREATE DATABASE JobStreet2012085;

USE JobStreet2012085;

CREATE TABLE Member (
    Email VARCHAR(30) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Password VARCHAR(20) NOT NULL,
    HasWorkExperience BIT NOT NULL,
    WorkingSince DECIMAL(4, 0) NOT NULL,
    Nationality VARCHAR(20) NOT NULL,
    CurrentResidence VARCHAR(20) NOT NULL
);


CREATE TABLE Language (
    MemberEmail VARCHAR(30),
    LanguageName VARCHAR(20),
    PrimaryLanguage BIT NOT NULL,
    ProficiencyLevel TINYINT NOT NULL,
    PRIMARY KEY (MemberEmail, LanguageName),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE Skill (
    MemberEmail VARCHAR(30),
    SkillName VARCHAR(30),
    ProficiencyLevel VARCHAR(12) NOT NULL CHECK (ProficiencyLevel IN('Beginner', 'Intermediate', 'Advanced')),
    PRIMARY KEY (MemberEmail, SkillName),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE PreferredSpecialization (
    MemberEmail VARCHAR(30),
    SpecializationName VARCHAR(30),
    PRIMARY KEY (MemberEmail, SpecializationName),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE PermanentResidence (
    MemberEmail VARCHAR(30),
    Country VARCHAR(20),
    PRIMARY KEY (MemberEmail, Country),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE PreferredWorkLocation (
    MemberEmail VARCHAR(30),
    Region VARCHAR(20),
    PRIMARY KEY (MemberEmail, Region),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE WorkExperience (
    WorkExperienceID SMALLINT IDENTITY(1, 1) PRIMARY KEY,
    PositionTitle VARCHAR(20) NOT NULL,
    CompanyName VARCHAR(30) NOT NULL,
    Industry VARCHAR(20),
    Role VARCHAR(15),
    PositionLevel VARCHAR(15),
    Specialization VARCHAR(20),
    JoinedIn DATE NOT NULL,
    JoinedUntil DATE DEFAULT NULL,
    MobileNumber VARCHAR(15),
    MemberEmail VARCHAR(30),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email)
);

CREATE TABLE CurrentEducation (
    MemberEmail VARCHAR(30) PRIMARY KEY,
    YearOfAdmission DECIMAL(4, 0) NOT NULL,
    CurrentLevelOfStudy


CREATE TABLE Company (
    CompanyRegNo INTEGER PRIMARY KEY,
    CompanyName VARCHAR(20) NOT NULL,
    Address VARCHAR(15) NOT NULL,
    WorkStartTime TIME NOT NULL,
    WorkEndTime TIME NOT NULL,
    CompanySizeMin INTEGER NOT NULL,
    CompanySizeMax INTEGER NOT NULL CHECK (CompanySizeMax > CompanySizeMin),
    Industry VARCHAR(20)
);

CREATE TABLE JobVacancy (
    JobID INTEGER PRIMARY KEY,
    JobTitle VARCHAR(25) NOT NULL,
    WorkLocation VARCHAR(15),
    Specialization VARCHAR(20),
    SalaryMin INTEGER NOT NULL,
    SalaryMax INTEGER NOT NULL CHECK (SalaryMax > SalaryMin),
    JobLevel VARCHAR(20) NOT NULL,
    JobResponsibilities VARCHAR(150),
    AdvertisementDate DATE DEFAULT NULL,
    ApplicationClosingDate DATE DEFAULT NULL,
    CompanyRegNo INTEGER NOT NULL,
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo)
);

CREATE TABLE Review (
    MemberEmail VARCHAR(30),
    CompanyRegNo INTEGER,
    RecommendToFriend BIT,
    OverallRating TINYINT CHECK (OverallRating BETWEEN 1 AND 5),
    SalaryRating VARCHAR(7) CHECK (SalaryRating IN ('High', 'Average', 'Low')),
    DateOfReview TIMESTAMP,
    PRIMARY KEY (MemberEmail, CompanyRegNo),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo)
);
