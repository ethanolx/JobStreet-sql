USE JobStreet2012085;

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