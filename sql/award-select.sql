USE JobStreet2012085;

SELECT
    dbo.GetFullName(FirstName, LastName) AS 'Name of Member',
    Company.CompanyName AS 'Name of Company',
    a.AwardName + '- $' + CAST(a.Value AS VARCHAR(7)) AS 'Award Description and Value'
FROM
    (SELECT
        Award.AwardNo,
        Award.AwardName,
        CompanyAward.CompanyRegNo,
        CompanyAward.Value
    FROM
        Award
    INNER JOIN
        CompanyAward
    ON
        Award.AwardNo = CompanyAward.AwardNo) a
        INNER JOIN
            (SELECT
                Member.FirstName,
                Member.LastName,
                Member.Email,
                AwardConferment.AwardNo,
                AwardConferment.CompanyRegNo
            FROM
                Member
            INNER JOIN
                AwardConferment
            ON
                Member.Email = AwardConferment.MemberEmail) b
        ON
            a.AwardNo = b.AwardNo AND a.CompanyRegNo = b.CompanyRegNo 
        INNER JOIN
            Company
        ON
            a.CompanyRegNo = Company.CompanyRegNo;
