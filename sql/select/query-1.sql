USE JobStreet2012085;

SELECT
    dbo.GetFullName(FirstName, LastName) AS 'Name of Member',
    Email AS 'Email Address',
    dbo.DateVerbose(Joinedin) + IIF(JoinedUntil IS NOT NULL, ' to ', '') + ISNULL(dbo.DateVerbose(JoinedUntil), '--Current Job') + '--' + PositionTitle + '(' + ISNULL(Company.CompanyName, WorkExperience.CompanyName) + ')' AS 'Employment History',
    ISNULL(Company.Industry, 'Unknown') AS 'The Industry'
FROM
    Member
    INNER JOIN WorkExperience ON Member.Email = WorkExperience.MemberEmail
    LEFT JOIN Company ON WorkExperience.CompanyRegNo = Company.CompanyRegNo
ORDER BY
    'Name of Member' DESC,
    'Employment History';
