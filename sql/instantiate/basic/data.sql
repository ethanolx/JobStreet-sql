USE JobStreet2012085;

/* Member Relation */
INSERT INTO Member (Email, FirstName, LastName, Password, Nationality, ResidentCountry, ExpectedSalary, PRCountry, WorkingSince) VALUES
    ('alanang@gmail.com', 'Alan', 'Ang', 'GoofieWord', 'Singapore', 'Singapore', 7000.0, NULL, 1980),
    ('LeeBB@gmail.com', 'Beng', 'Lee', 'opopiuy', 'Singapore', 'Singapore', 5000.0, 'Singapore', 1990),
    ('LeeCY@Gmail.com', 'ChuanYong', 'Lee', 'xvytyu', 'Hong Kong', 'Singapore', 4500.0, 'Singapore', 1990),
    ('LinJJ@gmail.com', 'JJ', 'Lin', 'ggghhh123', 'Taiwan', 'Singapore', 5000.0, 'Singapore', 1984),
    ('Prisca@Yahoo.com', 'Prisca', 'Lee', 'HuaHien', 'Singapore', 'Singapore', 8000.0, NULL, 1985),
    ('Robert@gmail.com', 'Robert', 'Lin', 'cvbnu768', 'Taiwan', 'Singapore', 4000.0, 'Singapore', 1969);

INSERT INTO Company (CompanyRegNo, CompanyName, Industry) VALUES
    ('C1230', 'Aston Systems and Maintenance', 'Pipes and Sewage'),
    ('C1234', 'Good Earth Pte Ltd', 'Engineering'),
    ('C3456', 'MidEast Bank', 'Finance and Services'),
    ('C4568', 'Huat Heng Constructions', 'Plumbing');

INSERT INTO WorkExperience (MemberEmail, PositionTitle, PositionLevel, Role, Specialization, CompanyRegNo, JoinedIn, JoinedUntil) VALUES
    ('alanang@gmail.com', 'Programmer', 'Jr Executive', 'Systems', 'Civil Engineering', 'C4568', '2012-08-01', NULL),
    ('LeeBB@gmail.com', 'Manager', 'Manager', 'Management', 'Banking', 'C3456', '1999-04-01', NULL),
    ('LinJJ@gmail.com', 'Engineer', 'Executive', 'Operations', 'Civil Engineering', 'C4568', '1980-01-01', '1982-05-01'),
    ('LinJJ@gmail.com', 'Manager', 'Manager', 'Operations', 'Geology', 'C1234', '1984-06-01', '1990-12-01'),
    ('LinJJ@gmail.com', 'Director', 'Senior Mgmt', 'Management', 'Civil Engineering', 'C4568', '1991-02-01', NULL),
    ('Prisca@Yahoo.com', 'Sales Executive', 'Executive', 'Sales', 'Banking', 'C3456', '1990-07-01', '1992-05-01'),
    ('Prisca@Yahoo.com', 'Director', 'Director', 'Management', 'Thermo-Fluid Engineering', 'C1230', '1993-01-01', NULL);
