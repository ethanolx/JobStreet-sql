USE JobStreet2012085;

DROP TABLE IF EXISTS Award;
CREATE TABLE Award (
    AwardNo CHAR(5) PRIMARY KEY,
    AwardName VARCHAR(40) NOT NULL
);

DROP TABLE IF EXISTS CompanyAward;
CREATE TABLE CompanyAward (
    CompanyRegNo VARCHAR(5),
    AwardNo CHAR(5),
    Value DECIMAL(7, 2),
    PRIMARY KEY (CompanyRegNo, AwardNo),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo),
    FOREIGN KEY (AwardNo) REFERENCES Award (AwardNo)
);

DROP TABLE IF EXISTS AwardConferment;
CREATE TABLE AwardConferment (
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
    DateAwarded DATE NOT NULL,
    AwardNo CHAR(5),
    MemberEmail VARCHAR(30),
    CompanyRegNo VARCHAR(5),
    FOREIGN KEY (AwardNo) REFERENCES Award (AwardNo),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo)
);
