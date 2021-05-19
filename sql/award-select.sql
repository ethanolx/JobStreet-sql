USE JobStreet2012085;

SELECT
    dbo.GetFullName(FirstName, LastName) AS 'Name of Member',
    Company.CompanyName AS 'Name of Company',
    Award.AwardName + '- $' + CAST(CompanyAward.Value AS VARCHAR(7)) AS 'Award Description and Value'
FROM
    Member
        INNER JOIN AwardConferment ON Member.Email = AwardConferment.MemberEmail
        INNER JOIN Company ON AwardConferment.CompanyRegNo = Company.CompanyRegNo
        INNER JOIN CompanyAward ON AwardConferment.CompanyRegNo = CompanyAward.CompanyRegNo
        INNER JOIN Award ON CompanyAward.AwardNo = Award.AwardNo;
