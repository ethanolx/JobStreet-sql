USE JobStreet2012085;

DROP FUNCTION IF EXISTS dbo.SummaryProfile;
GO

CREATE FUNCTION dbo.SummaryProfile(@id INTEGER, @em VARCHAR(30)) RETURNS TABLE AS
RETURN
    (SELECT
        WorkExperience.PositionTitle,
        'SGD ' + CAST(Member.ExpectedSalary AS VARCHAR(7)) AS ExpectedSalary,
        YEAR(GETDATE()) - Member.WorkingSince AS Experience,
        IIF(Member.WorkingSince IS NULL, CurrentEducation.Qualification, HighestQualification.Qualification) AS EducationLevel,
        WorkExperience.Specialization,
        Nationality
    FROM
        JobApplication
            INNER JOIN Member ON JobApplication.MemberEmail = Member.Email
            LEFT JOIN WorkExperience ON WorkExperience.MemberEmail = Member.Email
            LEFT JOIN CurrentEducation ON CurrentEducation.MemberEmail = Member.Email
            LEFT JOIN HighestQualification ON HighestQualification.MemberEmail = Member.Email
    WHERE
        Member.Email <> @em AND
        JobApplication.JobID = @id AND
        WorkExperience.JoinedUntil IS NULL);
GO

SELECT COUNT(*) AS 'Number of Other Applicants' FROM dbo.SummaryProfile(2, 'alanang@gmail.com');

SELECT COUNT(*) AS 'Number of Local Applicants' FROM dbo.SummaryProfile(2, 'alanang@gmail.com') WHERE Nationality LIKE 'Singapore';

SELECT COUNT(*) AS 'Number of Foreign Applicants' FROM dbo.SummaryProfile(2, 'alanang@gmail.com') WHERE Nationality NOT LIKE 'singapore';

SELECT
    ISNULL(PositionTitle, '-') AS 'Position Title',
    ISNULL(ExpectedSalary, '-') AS 'Expected Salary',
    ISNULL(Experience, 0) AS 'Experience',
    EducationLevel AS 'Education Level',
    ISNULL(Specialization, '-') AS 'Specialization'
FROM
    dbo.SummaryProfile(2, 'alanang@gmail.com');

SELECT GETDATE() AS 'As of';
