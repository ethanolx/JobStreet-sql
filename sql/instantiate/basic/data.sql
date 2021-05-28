USE JobStreet2012085;

/* Member Relation */
INSERT INTO Member (Email, FirstName, LastName, Password, ResidentCountry, Nationality, PRCountry, ExpectedSalary, WorkingSince) VALUES
    ('alanang@gmail.com', 'Alan', 'Ang', 'GoofieWord', 'Singapore', 'Singapore', NULL, 7000.0, 1980),
    ('LeeBB@gmail.com', 'Beng', 'Lee', 'opopiuy', 'Singapore', 'Singapore', 'Singapore', 5000.0, 1990),
    ('LeeCY@Gmail.com', 'ChuanYong', 'Lee', 'xvytyu', 'Singapore', 'Hong Kong', 'Singapore', 4500.0, 1990),
    ('LinJJ@gmail.com', 'JJ', 'Lin', 'ggghhh123', 'Singapore', 'Taiwan', 'Singapore', 5000.0, 1984),
    ('Prisca@Yahoo.com', 'Prisca', 'Lee', 'HuaHien', 'Singapore', 'Singapore', NULL, 8000.0, 1985),
    ('Robert@gmail.com', 'Robert', 'Lin', 'cvbnu768', 'Singapore', 'Taiwan', 'Singapore', 4000.0, 1969),
    ('ethanol@gmail.com', 'Ethan', 'Tan', 'dfo&2j0', 'Singapore', 'Singapore', 'Singapore', 3500.0, NULL),
    ('iscar@yahoo.com.sg', 'Isaac', NULL, 'dwod&#2k', 'Malaysia', 'Malaysia', 'Singapore', 4200.0, 1990),
    ('john@inet.com', 'Jones', 'Jonathan', 'f3o9k20', 'Singapore', 'China', NULL, NULL, 2010),
    ('lucy3@mmail.com', 'Lucy', 'Lim', '(27K2kcl', 'Singapore', 'Australia', 'New Zealand', 6000.0, 2003),
    ('bucky@barnes.net', 'Bucky', 'Barnes', 'ggg1239o', 'Singapore', 'India', 'Germany', NULL, NULL),
    ('aiden@yahoo.com', 'Aiden', 'Lee', '38nd3d9J', 'Singapore', 'Singapore', NULL, NULL, NULL),
    ('xavierkhoo@net.com', 'Xavier', 'Khoo', '2s*n3Kd3j', 'Singapore', 'Japan', 'Singapore', 5600.0, NULL);

/* Language Relation */
INSERT INTO Language (MemberEmail, Language, LangProficiency, PrimaryLanguage) VALUES
    ('alanang@gmail.com', 'English', 7, 0),
    ('alanang@gmail.com', 'Mandarin', 8, 1),
    ('LeeBB@gmail.com', 'Mandarin', 8, 1),
    ('LeeCY@Gmail.com', 'English', 6, 1),
    ('LeeCY@Gmail.com', 'Chinese', 3, 0),
    ('LinJJ@gmail.com', 'Chinese', 9, 1),
    ('Prisca@Yahoo.com', 'English', 7, 1),
    ('Robert@gmail.com', 'English', 7, 1),
    ('ethanol@gmail.com', 'English', 8, 1),
    ('ethanol@gmail.com', 'Greek', 2, 0),
    ('iscar@yahoo.com.sg', 'Malay', 5, 0),
    ('john@inet.com', 'Mandarin', 9, 1),
    ('lucy3@mmail.com', 'English', 10, 1),
    ('bucky@barnes.net', 'German', 7, 1),
    ('aiden@yahoo.com', 'English', 6, 1),
    ('xavierkhoo@net.com', 'Japanese', 8, 1);

/* Skill Relation */
INSERT INTO Skill (MemberEmail, Skill, SkillProficiency) VALUES
    ('alanang@gmail.com', 'Java Programming', 'Advanced'),
    ('LeeBB@gmail.com', 'Team Management', 'Intermediate'),
    ('LinJJ@gmail.com', 'Material Science', 'Advanced'),
    ('LeeCY@Gmail.com', 'Cybersecurity', 'Advanced'),
    ('LinJJ@gmail.com', 'Marketing and Sales', 'Intermediate'),
    ('Prisca@Yahoo.com', 'Banking', 'Intermediate'),
    ('Robert@gmail.com', 'Software Engineering', 'Advanced'),
    ('ethanol@gmail.com', 'Music', 'Beginner'),
    ('ethanol@gmail.com', 'Design Thinking', 'Beginner'),
    ('iscar@yahoo.com.sg', 'Mechatronics', 'Advanced'),
    ('john@inet.com', 'Mathematics', 'Advanced'),
    ('lucy3@mmail.com', 'Chemical Analysis', 'Advanced'),
    ('bucky@barnes.net', 'Networking', 'Intermediate'),
    ('aiden@yahoo.com', 'Science', 'Beginner'),
    ('xavierkhoo@net.com', 'Literature', 'Intermediate');

/* Preferred Specialization Relation */
INSERT INTO PreferredSpecialization (MemberEmail, Specialization) VALUES
    ('alanang@gmail.com', 'IT Software'),
    ('LeeBB@gmail.com', 'Banking & Finance'),
    ('LinJJ@gmail.com', 'Human Resource'),
    ('LeeCY@Gmail.com', 'IT Networking'),
    ('Prisca@Yahoo.com', 'Banking'),
    ('Robert@gmail.com', 'IT Software'),
    ('ethanol@gmail.com', 'IT Software'),
    ('iscar@yahoo.com.sg', 'Robotics'),
    ('john@inet.com', 'Education'),
    ('lucy3@mmail.com', 'Chemical Analysis'),
    ('bucky@barnes.net', 'IT Networking'),
    ('aiden@yahoo.com', 'IT Software'),
    ('xavierkhoo@net.com', 'Education');

/* Preferred Work Location Relation */
INSERT INTO PreferredWorkLocation (MemberEmail, Region) VALUES
    ('alanang@gmail.com', 'Singapore'),
    ('LeeBB@gmail.com', 'Singapore'),
    ('LinJJ@gmail.com', 'Johor Bahru'),
    ('LeeCY@Gmail.com', 'Hong Kong'),
    ('Prisca@Yahoo.com', 'Singapore'),
    ('Robert@gmail.com', 'Kuala Lumpur'),
    ('ethanol@gmail.com', 'Singapore'),
    ('iscar@yahoo.com.sg', 'Johor Bahru'),
    ('john@inet.com', 'Australia'),
    ('lucy3@mmail.com', 'Singapore'),
    ('bucky@barnes.net', 'New York'),
    ('aiden@yahoo.com', 'Singapore'),
    ('xavierkhoo@net.com', 'Japan');

/* Current Education Relation */
INSERT INTO CurrentEducation (MemberEmail, InstituteName, YearOfAdmission, Qualification, CurrentLevelOfStudy, CourseOfStudy) VALUES
    ('ethanol@gmail.com', 'Singapore Polytechnic', 2019, 'Diploma', 'Second Year', 'Applied AI and Analytics'),
    ('bucky@barnes.net', 'Meridian Junior College', 2000, 'GCE A Level', 'Second Year', 'PCME'),
    ('lucy3@mmail.com', 'SUTD', 2018, 'Bacheler Degree', 'Last Year', 'Business & Finance'),
    ('aiden@yahoo.com', 'Victoria School', 2020, 'GCE O Level', 'Secondary One', 'GCE O Level'),
    ('xavierkhoo@net.com', 'Singapore Management University', 2015, 'Doctorate', 'Last Year', 'HR Management');

/* Highest Qualification Relation */
INSERT INTO HighestQualification (MemberEmail, InstituteName, Qualification, InstituteLocation, FieldOfStudy, GraduationDate) VALUES
    ('alanang@gmail.com', 'University of Oxford', 'Masters Degree', 'England', 'Android Programming', '2008-03-02'),
    ('LeeBB@gmail.com', 'Singapore Management University', 'Doctorate', 'Singapore', 'Human Resource Management', '1997-04-10'),
    ('LeeCY@Gmail.com', 'National University of Singapore', 'Bachelor Degree', 'Singapore', 'General Business', '1985-12-08'),
    ('LinJJ@gmail.com', 'National University of Singapore', 'Masters Degree', 'Singapore', 'Civil Engineering', '1997-11-23'),
    ('Prisca@Yahoo.com', 'Singapore Polytechnic', 'Diploma', 'Singapore', 'Business and Finance', '1992-01-02'),
    ('Robert@gmail.com', 'Harvard University', 'Doctorate', 'Cambridge', 'Mechanical Engineering', '1966-04-04'),
    ('iscar@yahoo.com.sg', 'Temasek Polytechnic', 'Diploma', 'Singapore', 'Mechatronics and Robotics', '1985-05-30'),
    ('john@inet.com', 'National Institute of Education', 'Masters Degree', 'Singapore', 'Mathematics Education', '2008-03-27'),
    ('lucy3@mmail.com', 'Nanyang Polytechnic', 'Diploma', 'Singapore', 'Chemical Engineering', '2002-04-16');

/* Company Relation */
INSERT INTO Company (CompanyRegNo, CompanyName, Industry, Address, CompanySizeMin, CompanySizeMax, WorkStartTime, WorkEndTime) VALUES
    ('C1230', 'Aston Systems and Maintenance', 'Pipes and Sewage', 'Jurong', 500, NULL, '08:00:00', NULL),
    ('C1234', 'Good Earth Pte Ltd', 'Engineering', 'Bukit Panjang', NULL, NULL, NULL, '18:00:00'),
    ('C3456', 'MidEast Bank', 'Finance and Services', 'Raffles City', NULL, NULL, NULL, NULL),
    ('C4568', 'Huat Heng Constructions', 'Plumbing', 'Jurong Island', NULL, NULL, NULL, NULL),
    ('C1001', 'Ionic Software', 'IT Software', NULL, NULL, NULL, NULL, NULL),
    ('C2021', 'Imagine Music Pte Ltd', 'Music Production', 'Dhoby Ghaut', NULL, NULL, NULL, NULL),
    ('C2020', 'Potter Pottery', 'Pottery and Ceramics', 'Tiong Bahru', NULL, NULL, NULL, NULL),
    ('C2019', 'Peter Healthcare', 'Healthcare', 'Pasir Ris', NULL, NULL, NULL, NULL),
    ('C9999', 'TelCorp', 'Telecommunications', NULL, NULL, NULL, NULL, NULL),
    ('C4000', 'Security@Hand', 'Cybersecurity', NULL, NULL, NULL, NULL, NULL);

/* Work Experience Relation */
/* Registered Companies */
INSERT INTO WorkExperience (MemberEmail, PositionTitle, PositionLevel, Role, Specialization, CompanyRegNo, JoinedIn, JoinedUntil) VALUES
    ('alanang@gmail.com', 'Programmer', 'Jr Executive', 'Systems', 'Civil Engineering', 'C4568', '2012-08-01', NULL),
    ('LeeBB@gmail.com', 'Manager', 'Manager', 'Management', 'Banking', 'C3456', '1999-04-01', NULL),
    ('LinJJ@gmail.com', 'Engineer', 'Executive', 'Operations', 'Civil Engineering', 'C4568', '1980-01-01', '1982-05-01'),
    ('LinJJ@gmail.com', 'Manager', 'Manager', 'Operations', 'Geology', 'C1234', '1984-06-01', '1990-12-01'),
    ('LinJJ@gmail.com', 'Director', 'Senior Mgmt', 'Management', 'Civil Engineering', 'C4568', '1991-02-01', NULL),
    ('Prisca@Yahoo.com', 'Sales Executive', 'Executive', 'Sales', 'Banking', 'C3456', '1990-07-01', '1992-05-01'),
    ('Prisca@Yahoo.com', 'Director', 'Director', 'Management', 'Thermo-Fluid Engineering', 'C1230', '1993-01-01', NULL),
    ('Robert@gmail.com', 'Logistics Head', 'Executive', 'Logistics', 'Stock Management', 'C2020', '1969-03-20', NULL),
    ('iscar@yahoo.com.sg', 'Engineer', 'Senior Employee', 'Operations', 'Software Engineering', 'C1001', '1990-12-09', NULL),
    ('john@inet.com', 'Director', 'Director', 'Management', 'Event Planning', 'C2020', '2010-10-28', NULL),
    ('lucy3@mmail.com', 'Manager', 'Manager', 'Management', 'Training', 'C2021', '2003-06-07', NULL);

/* Non-Registered Company */
INSERT INTO WorkExperience (MemberEmail, PositionTitle, PositionLevel, Role, Specialization, CompanyName, JoinedIn, JoinedUntil) VALUES
    ('john@inet.com', 'Employee', 'Employee', 'Employee', 'Specialist', 'Singapore Armed Forces', '2010-01-20', '2010-10-27');

/* Review Relation */
INSERT INTO Review (MemberEmail, CompanyRegNo, OverallRating, SalaryRating, RecommendToFriend) VALUES
    ('alanang@gmail.com', 'C4568', 4, 'Average', 1),
    ('LeeBB@gmail.com', 'C3456', 3, 'Low', 0),
    ('LinJJ@gmail.com', 'C1234', 5, 'High', 1),
    ('LinJJ@gmail.com', 'C4568', 1, 'Average', 0),
    ('Prisca@Yahoo.com', 'C3456', 2, 'High', 0),
    ('Prisca@Yahoo.com', 'C1230', 5, 'High', 1),
    ('Robert@gmail.com', 'C2020', 3, 'Average', 1),
    ('iscar@yahoo.com.sg', 'C1001', 4, 'High', 1),
    ('john@inet.com', 'C2020', 2, 'Average', 0),
    ('lucy3@mmail.com', 'C2021', 2, 'Low', 0);

/* Job Vacancy Relation */
INSERT INTO JobVacancy (CompanyRegNo, JobTitle, JobLevel, JobResponsibilities, Specialization, WorkLocation, AdvertisementDate, ApplicationClosingDate, MinSalary, MaxSalary) VALUES
    ('C2019', 'Healthcare Assistant', 'Assistant', 'Help in patient registration', 'Healthcare', 'Changi', NULL, NULL, 3000.0, NULL),
    ('C1001', 'Software Engineer', 'Employee', 'Help to design new application', 'IT Software', 'Online', NULL, '2021-05-26', 5500.0, NULL),
    ('C4568', 'Pipe Inspector', 'Inspector', 'Inspect status of sewage pipelines', 'Plumbing', 'Bukit Panjang', '2021-07-26', NULL, NULL, 7000.0),
    ('C1001', 'DevOps Engineer', 'Engineer', 'Design a sustainable DevOps lifecycle', 'IT DevOps', 'Kallang', '2020-12-01', '2021-12-01', 6500, NULL),
    ('C2020', 'Master Potter', 'Senior Mentor', 'Teach new employees the art of pottery', 'Clayware', 'Tiong Bahru', NULL, NULL, 2500.0, 5000.0),
    ('C9999', 'Network Designer', 'Engineer', 'Design new telecommunications networks', 'Telecommunications', 'Tampines', NULL, NULL, NULL, NULL),
    ('C9999', 'Help Desk Support', 'Employee', 'Attend to customer enquiries', 'Customer Support', 'Bukit Timah', NULL, NULL, NULL, NULL),
    ('C4000', 'Business Analyst', 'Analyst', 'Forecast business trends and oversee development', 'Data Analysis', 'Online', NULL, NULL, NULL, NULL),
    ('C2021', 'Studio Manager', 'Manager', 'Open and lock up music studio', 'Logistics', 'Dhoby Ghaut', NULL, NULL, 1500.0, NULL),
    ('C2021', 'Score Composer', 'Composer', 'Compose new scores for the band', 'Music', 'Dhoby Ghaut', NULL, '2022-01-02', 3000.0, 4500.0);

/* Job Application Relation */
INSERT INTO JobApplication (MemberEmail, JobID) VALUES
    ('ethanol@gmail.com', 1),
    ('ethanol@gmail.com', 2),
    ('ethanol@gmail.com', 3),
    ('bucky@barnes.net', 1),
    ('bucky@barnes.net', 2),
    ('bucky@barnes.net', 3),
    ('john@inet.com', 2),
    ('Robert@gmail.com', 2),
    ('iscar@yahoo.com.sg', 3),
    ('lucy3@mmail.com', 1);
