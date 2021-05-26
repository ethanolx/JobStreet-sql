USE JobStreet2012085;

INSERT INTO Award (AwardNo, AwardName) VALUES
    ('A1234', 'Best Sales Person'),
    ('A2311', 'Top Performing Manager'),
    ('A3212', 'Outstanding Employee of the Year'),
    ('A1000', 'Most Impressive Progress'),
    ('A2000', 'Long Service Award'),
    ('A3000', 'Most Hardworking Staff'),
    ('A4000', 'Most Confident Speaker'),
    ('A5000', 'Most Punctual Employee of the Month'),
    ('A6000', 'Best Software Engineer'),
    ('A7000', 'Best Networking Engineer'),
    ('A8000', 'Most Productive Staff');

INSERT INTO CompanyAward (CompanyRegNo, AwardNo, Value) VALUES
    ('C1230', 'A2311', 2000.00),
    ('C1230', 'A3212', 4000.00),
    ('C3456', 'A2311', 3000.00),
    ('C3456', 'A3212', 6000.00),
    ('C4568', 'A3212', 5000.00),
    ('C1001', 'A6000', 5000.00),
    ('C1001', 'A7000', 4500.00),
    ('C2020', 'A8000', 1200.00),
    ('C2020', 'A1000', 750.00),
    ('C2021', 'A4000', 500.00),
    ('C9999', 'A3000', 1000.00),
    ('C4000', 'A5000', 2000.00);

INSERT INTO AwardConferment (MemberEmail, AwardNo, CompanyRegNo, DateAwarded) VALUES
    ('alanang@gmail.com', 'A3212', 'C4568', '2012-08-01'),
    ('LeeBB@gmail.com', 'A2311', 'C3456', '1999-04-01'),
    ('Prisca@Yahoo.com', 'A2311', 'C3456', '1990-07-01'),
    ('Prisca@Yahoo.com', 'A3212', 'C3456', '1990-07-01'),
    ('Prisca@Yahoo.com', 'A2311', 'C1230', '1993-01-01'),
    ('Robert@gmail.com', 'A8000', 'C2020', '1979-03-20'),
    ('Robert@gmail.com', 'A1000', 'C2020', '1999-08-15'),
    ('iscar@yahoo.com.sg', 'A6000', 'C1001', '2000-02-02'),
    ('iscar@yahoo.com.sg', 'A7000', 'C1001', '2000-02-02'),
    ('john@inet.com', 'A8000', 'C2020', '2012-07-21'),
    ('lucy3@mmail.com', 'A4000', 'C2021', '2017-10-10');

