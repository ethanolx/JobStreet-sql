USE JobStreet2012085;

DROP FUNCTION IF EXISTS dbo.GetLatestWorkExperience;
GO

CREATE

DROP FUNCTION IF EXISTS dbo.SummaryProfile;
GO

CREATE FUNCTION dbo.SummaryProfile(@id INTEGER) RETURNS TABLE AS
RETURN
    SELECT
        WorkExperience.PositionTitle AS 'Position Title',
        'SGD ' + CAST(Member.ExpectedSalary AS VARCHAR(7)) AS 'Expected Salary',
        YEAR(GETDATE()) - Member.WorkingSince AS 'Experience',
        IIF(Member.WorkingSince IS NULL, CurrentEducation.InstituteName, HighestQualification.Qualification) AS 'Education Level',
        ISNULL(
    FROM
        JobApplication
            INNER JOIN JobVacancy ON JobApplication.JobID = JobVacancy.JobID
    WHERE
        JobVacancy.JobID = @id;
GO

SELECT * FROM dbo.SummaryProfile(2);
