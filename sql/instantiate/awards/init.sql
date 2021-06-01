USE JobStreet2012085;

/* Utility Functions */
DROP FUNCTION IF EXISTS dbo.GetWorkingPeriod;
GO

CREATE FUNCTION dbo.GetWorkingPeriods(@em VARCHAR(30), @comp CHAR(5)) RETURNS TABLE AS
RETURN
    (SELECT
        JoinedIn,
        JoinedUntil
    FROM
        WorkExperience
    WHERE
        MemberEmail = @em AND
        CompanyRegNo = @comp);
GO

DROP FUNCTION IF EXISTS dbo.CheckAwardConferment;
GO

CREATE FUNCTION dbo.CheckAwardConferment(@em VARCHAR(30), @comp CHAR(5), @dt DATE) RETURNS INT AS
BEGIN
    IF
        (SELECT COUNT(*)
        FROM dbo.GetWorkingPeriods(@em, @comp)
        WHERE
            JoinedIn <= @dt AND
            ISNULL(JoinedUntil, '9999-12-31') >= @dt) >= 1
        RETURN 1
    RETURN 0
END;
GO

/* Award Relation */
CREATE TABLE Award (
    AwardNo CHAR(5) NOT NULL,
    AwardName VARCHAR(40) NOT NULL,
    PRIMARY KEY (AwardNo)
);

/* Company Award Relation */
CREATE TABLE CompanyAward (
    CompanyRegNo CHAR(5) NOT NULL,
    AwardNo CHAR(5) NOT NULL,
    [Value] DECIMAL(7, 2) NOT NULL,
    PRIMARY KEY (CompanyRegNo, AwardNo),
    FOREIGN KEY (CompanyRegNo) REFERENCES Company (CompanyRegNo),
    FOREIGN KEY (AwardNo) REFERENCES Award (AwardNo)
);

/* Award Conferment Relation */
CREATE TABLE AwardConferment (
    ID INTEGER IDENTITY(1, 1) PRIMARY KEY,
    DateAwarded DATE NOT NULL,
    AwardNo CHAR(5) NOT NULL,
    MemberEmail VARCHAR(30) NOT NULL,
    CompanyRegNo CHAR(5) NOT NULL,
    FOREIGN KEY (CompanyRegNo, AwardNo) REFERENCES CompanyAward (CompanyRegNo, AwardNo),
    FOREIGN KEY (MemberEmail) REFERENCES Member (Email),
    CHECK (dbo.CheckAwardConferment(MemberEmail, CompanyRegNo, DateAwarded) = 1)
);
