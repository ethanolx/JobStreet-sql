USE JobStreet2012085;

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
        ON C.CompanyRegNo = W.CompanyRegNo
ORDER BY
    'companyName';

