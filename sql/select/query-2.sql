USE JobStreet2012085;

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