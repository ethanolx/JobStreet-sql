USE JobStreet2012085;

/* Without subquery */
-- SELECT
--     Company.CompanyRegNo AS 'companyNo',
--     CompanyName AS 'companyName',
--     COUNT(DISTINCT MemberEmail) AS 'No of Employees'
-- FROM
--     WorkExperience INNER JOIN Company ON WorkExperience.CompanyRegNo = Company.CompanyRegNo
-- WHERE
--     JoinedUntil IS NULL AND Company.Industry NOT LIKE '%Finance%'
-- GROUP BY
--     Company.CompanyRegNo, Company.CompanyName;

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

