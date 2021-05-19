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

SELECT 
    dbo.GetFullName(FirstName, LastName) AS 'Name of Member',
    Email AS 'Email Address',
    dbo.DateVerbose(Joinedin) + IIF(JoinedUntil IS NOT NULL, ' to ', '') + ISNULL(dbo.DateVerbose(JoinedUntil), '--Current Job') + '--' + PositionTitle + '(' + CompanyName + ')' AS 'Employment History',
    WorkExperience.Industry AS 'The Industry'
FROM 
    Member
    INNER JOIN WorkExperience ON Member.Email = WorkExperience.MemberEmail
    INNER JOIN Company ON WorkExperience.CompanyRegNo = Company.CompanyRegNo
ORDER BY
    'Name of Member' DESC,
    'Employment History';

SELECT
    dbo.GetFullName(FirstName, LastName) AS 'Name of Member',
    PositionTitle AS 'Latest Current Job',
    YEAR(GETDATE()) - YEAR(JoinedIn) AS 'Number of Years on Current Job'
FROM
    Member INNER JOIN WorkExperience ON Member.Email = WorkExperience.MemberEmail
WHERE
    JoinedUntil IS NULL
ORDER BY
    'Number of Years on Current Job' DESC;

/* Without subquery */
/* SELECT */
/*     MIN(Company.CompanyRegNo) AS 'companyNo', */
/*     MIN(CompanyName) AS 'companyName', */
/*     COUNT(DISTINCT MemberEmail) AS 'No of Employees' */
/* FROM */
/*     WorkExperience INNER JOIN Company ON WorkExperience.CompanyRegNo = Company.CompanyRegNo */
/* WHERE */
/*     JoinedUntil IS NULL AND Company.Industry NOT LIKE '%Finance%' */
/* GROUP BY */
/*     Company.CompanyRegNo; */

/* With subquery */
SELECT
    C.CompanyRegNo AS 'companyNo',
    C.CompanyName AS 'companyName',
FROM
    Company AS C
        INNER JOIN
        (SELECT
            CompanyRegNo
        FROM
            Company
        WHERE
            Industry NOT LIKE '%finance%') AS NF
        ON C.CompanyRegNo = NF.CompanyRegNo;

