USE JobStreet2012085;

INSERT INTO Award (AwardNo, AwardName) VALUES
    ('A1234', 'Best Sales Person'),
    ('A2311', 'Top Performing Manager'),
    ('A3212', 'Oustanding Employee of the Year');

INSERT INTO CompanyAward (CompanyRegNo, AwardNo, Value) VALUES
    ('C1230', 'A2311', 2000.00),
    ('C1230', 'A3212', 4000.00),
    ('C3456', 'A2311', 3000.00),
    ('C3456', 'A3212', 6000.00),
    ('C4568', 'A3212', 5000.00);

INSERT INTO AwardConferment (MemberEmail, AwardNo, CompanyRegNo, DateAwarded) VALUES
    ('alanang@gmail.com', 'A3212', 'C4568', '2012-08-01'),
    ('LeeBB@gmail.com', 'A2311', 'C3456', '1999-04-01'),
    ('Prisca@Yahoo.com', 'A2311', 'C1230', '1990-07-01'),
    ('Prisca@Yahoo.com', 'A3212', 'C3456', '1990-07-01'),
    ('Prisca@Yahoo.com', 'A2311', 'C3456', '1993-01-01');

