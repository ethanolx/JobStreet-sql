CREATE TABLE Award (
    AwardNo CHAR(5) PRIMARY KEY,
    AwardName VARCHAR(25) NOT NULL
);

CREATE TABLE CompanyAward (
    CompanyRegNo VARCHAR(5),
    AwardNo CHAR(5),
    Value DECIMAL(7, 2),
    PRIMARY KEY (CompanyRegNo, AwardNo),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo),
    FOREIGN KEY (AwardNo) REFERENCES Award (AwardNo)
);

CREATE TABLE AwardConferment (
    ID IDENTITY(1, 1) PRIMARY KEY,
    DateAwarded DATE NOT NULL,
    AwardNo CHAR(5),
    MemberEmail VARCHAR(30),
    CompanyRegNo VARCHAR(5),
    PRIMARY KEY (AwardNo, MemberEmail, CompanyRegNo),
    FOREIGN KEY (AwardNo) REFERENCES Award (AwardNo),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo)
);
