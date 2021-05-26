USE JobStreet2012085;

SELECT
    JobTitle AS 'Job Title',
    CompanyName AS 'Name of Company',
    WorkLocation AS 'Work Location',
    'SGD ' + ISNULL(CAST(MinSalary AS VARCHAR(10)), 'not stated') + ' - ' + ISNULL(CAST(MaxSalary AS VARCHAR(10)), 'not stated') AS 'Salary Range',
    JobResponsibilities AS 'Job Responsibility'
FROM
    JobVacancy
        INNER JOIN Company ON JobVacancy.CompanyRegNo = Company.CompanyRegNo
WHERE
    JobTitle LIKE '%health%' OR
    Specialization LIKE '%it%' OR
    MinSalary >= 5000.00;
