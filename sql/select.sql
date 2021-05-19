
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
SELECT
    Company.CompanyRegNo AS 'companyNo',
    CompanyName AS 'companyName',
    COUNT(DISTINCT MemberEmail) AS 'No of Employees'
FROM
    WorkExperience INNER JOIN Company ON WorkExperience.CompanyRegNo = Company.CompanyRegNo
WHERE
    JoinedUntil IS NULL AND Company.Industry NOT LIKE '%Finance%'
GROUP BY
    Company.CompanyRegNo, Company.CompanyName;

/* With subquery */
SELECT
    C.CompanyRegNo AS 'companyNo',
    C.CompanyName AS 'companyName',
    W.CurrentEmployees AS 'No of Employees'
FROM
    (SELECT
        CompanyRegNo,
        CompanyName
    FROM
        Company
    WHERE
        Industry NOT LIKE '%finance%')
    AS C
        INNER JOIN
            (SELECT
                CompanyRegNo,
                COUNT(DISTINCT MemberEmail) CurrentEmployees
            FROM
                WorkExperience
            WHERE
                JoinedUntil IS NULL
            GROUP BY
                CompanyRegNo)
            AS W
        ON C.CompanyRegNo = W.CompanyRegNo;

