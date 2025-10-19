-- The primary objective of this project is to design and create a relational database for a Student Management System (SMS) 
-- using SQL. The database should efficiently store and manage data on students, courses, instructors, and enrollments, enabling 
-- users to perform key administrative functions such as adding students, assigning courses, and generating dynamic reports 
-- through SQL queries.


-- Students' Information
CREATE TABLE Students
				(Student_ID varchar PRIMARY KEY, 
				 Name varchar, 
				 Gender varchar, 
				 DOB date, 
				 Department_ID varchar,
				 FOREIGN KEY (Department_ID) REFERENCES Departments (Department_ID));



-- Department Information
CREATE TABLE Departments 
				(Department_ID varchar PRIMARY KEY,
				 Department_Name varchar);



-- Courses' Details
CREATE TABLE Courses
				(Course_ID varchar PRIMARY KEY,
				 Course_Name varchar,
				 Department_ID varchar,
				 FOREIGN KEY (Department_ID) REFERENCES Departments (Department_ID));



-- Enrollments' Details
CREATE TABLE Enrollments
				(Enrollment_ID varchar PRIMARY KEY,
				 Student_ID varchar,
				 Course_ID varchar,
				 Enrollment_Date date,
				 FOREIGN KEY (Student_ID) REFERENCES Students (Student_ID),
				 FOREIGN KEY (Course_ID) REFERENCES Courses (Course_ID));



-- Instructors' Details
CREATE TABLE Instructors
				(Instructor_ID varchar PRIMARY KEY,
				 Name varchar,
				 Gender varchar,
				 Email varchar,
				 Hire_Date date,
				 Department_ID varchar,
				 FOREIGN KEY (Department_ID) REFERENCES Departments (Department_ID));



-- Course Instructors' Details
CREATE TABLE CourseInstructors
				(Assignment_ID varchar PRIMARY KEY,
				 Instructor_ID varchar,
				 Course_ID varchar,
				 FOREIGN KEY (Instructor_ID) REFERENCES Instructors (Instructor_ID),
				 FOREIGN KEY (Course_ID) REFERENCES Courses (Course_ID));



-- Inserting Values

-- Departments' Table
INSERT INTO Departments
VALUES ('DT001', 'Computer Science'),
	   ('DT002', 'Biology'),
	   ('DT003', 'Mathematics'),
	   ('DT004', 'Physics'),
	   ('DT005', 'Economics'),
	   ('DT006', 'English');



-- Courses' Table
INSERT INTO Courses
VALUES ('CS001', 'Introduction to Programming', 'DT001'),
	   ('CS002', 'Data Structures', 'DT001'),
	   ('CS003', 'Database Systems', 'DT001'),
	   ('CS004', 'Algorithms and Complexity', 'DT001'),
	   ('CS005', 'Cell Biology', 'DT002'),
	   ('CS006', 'Genetics', 'DT002'),
	   ('CS007', 'Microbiology', 'DT002'),
	   ('CS008', 'Calculus I', 'DT003'),
	   ('CS009', 'Linear Algebra', 'DT003'),
	   ('CS010', 'Probability and Statistics', 'DT003'),
	   ('CS011', 'Classical Mechanics', 'DT004'),
	   ('CS012', 'Quantum Physics', 'DT004'),
	   ('CS013', 'Thermodynamics', 'DT004'),
	   ('CS014', 'Microeconomics', 'DT005'),
	   ('CS015', 'Macroeconomics', 'DT005'),
	   ('CS016', 'Econometrics', 'DT005'),
	   ('CS017', 'English Literature', 'DT006'),
	   ('CS018', 'Creative Writing', 'DT006'),
	   ('CS019', 'Academic Writing', 'DT006'),
	   ('CS020', 'Technical Communication', 'DT006');



-- Instructors' Table
INSERT INTO Instructors
VALUES ('IT001', 'Dr. Samuel Okoro', 'Male', 'samuel.okoro@university.edu.ng', '2023-03-15', 'DT001'),
	   ('IT002', 'Prof. Amina Yusuf', 'Female', 'amina.yusuf@university.edu.ng', '2023-05-21', 'DT002'),
	   ('IT003', 'Dr. Michael Adeniyi', 'Male', 'michael.adeniyi@university.edu.ng', '2024-02-10', 'DT003'),
	   ('IT004', 'Dr. Helen Chukwu', 'Female', 'helen.chukwu@university.edu.ng', '2023-07-09', 'DT004'),
	   ('IT005', 'Dr. Joseph Anya', 'Male', 'joseph.anya@university.edu.ng', '2023-10-03', 'DT005'),
	   ('IT006', 'Dr. Rita Oladimeji', 'Female', 'rita.oladimeji@university.edu.ng', '2024-01-20', 'DT006'),
	   ('IT007', 'Dr. Emeka Obi', 'Male', 'emeka.obi@university.edu.ng', '2023-08-12', 'DT001'),
	   ('IT008', 'Dr. Clara Nwankwo', 'Female', 'clara.nwankwo@university.edu.ng', '2023-11-02', 'DT002'),
	   ('IT009', 'Mr. Daniel Peters', 'Male', 'daniel.peters@university.edu.ng', '2024-03-18', 'DT003'),
	   ('IT010', 'Prof. Mary Johnson', 'Female', 'mary.johnson@university.edu.ng', '2023-06-25', 'DT004'),
	   ('IT011', 'Dr. Aminu Bello', 'Male', 'aminu.bello@university.edu.ng', '2023-09-11', 'DT005'),
	   ('IT012', 'Ms. Funke Adeyemi', 'Female', 'funke.adeyemi@university.edu.ng', '2024-01-05', 'DT006'),
	   ('IT013', 'Dr. Samuel Kuti', 'Male', 'samuel.kuti@university.edu.ng', '2023-12-15', 'DT001'),
	   ('IT014', 'Dr. Ngozi Ezenwa', 'Female', 'ngozi.ezenwa@university.edu.ng', '2023-08-22', 'DT003'),
	   ('IT015', 'Mr. Olu Jacobs', 'Male', 'olu.jacobs@university.edu.ng', '2024-02-08', 'DT006');



-- Students' Table
INSERT INTO Students
VALUES ('ST001', 'Adebayo Adeola', 'Male', '2001-04-12', 'DT001'),
	   ('ST002', 'Amaka Okoye', 'Female', '2002-08-03', 'DT002'),
	   ('ST003', 'Babatunde Femi', 'Male', '2000-11-21', 'DT001'),
	   ('ST004', 'Chiamaka Obi', 'Female', '2001-06-15', 'DT003'),
	   ('ST005', 'Daniel Eke', 'Male', '1999-12-05', 'DT004'),
	   ('ST006', 'Ebere Nnaji', 'Female', '2003-01-28', 'DT006'),
	   ('ST007', 'Francis John', 'Male', '2002-03-07', 'DT005'),
	   ('ST008', 'Grace Uche', 'Female', '2000-09-19', 'DT002'),
	   ('ST009', 'Hassan Musa', 'Male', '2001-02-10', 'DT001'),
	   ('ST010', 'Ifeoma Eze', 'Female', '1999-07-30', 'DT003'),
	   ('ST011', 'Jide Olatunji', 'Male', '2000-05-22', 'DT001'),
	   ('ST012', 'Kemi Afolabi', 'Female', '2001-10-11', 'DT006'),
	   ('ST013', 'Lekan Owolabi', 'Male', '2002-12-01', 'DT005'),
	   ('ST014', 'Mariam Bello', 'Female', '2003-06-02', 'DT002'),
	   ('ST015', 'Nkem Opara', 'Female', '2000-04-08', 'DT003'),
	   ('ST016', 'Oluwatobi Akin', 'Male', '2001-09-27', 'DT001'),
	   ('ST017', 'Patience Okonkwo', 'Female', '2002-02-18', 'DT004'),
	   ('ST018', 'Quadri Lawal', 'Male', '2000-08-07', 'DT005'),
	   ('ST019', 'Rita Chukwu', 'Female', '2001-11-14', 'DT006'),
	   ('ST020', 'Seyi Adesanya', 'Male', '1999-03-31', 'DT001'),
	   ('ST021', 'Tosin Bakare', 'Female', '2002-07-09', 'DT001'),
	   ('ST022', 'Uzochi Nwaneri', 'Female', '2003-05-25', 'DT002'),
	   ('ST023', 'Victor Agbo', 'Male', '2000-10-03', 'DT004'),
	   ('ST024', 'Wunmi Adebisi', 'Female', '2001-01-05', 'DT006'),
	   ('ST025', 'Xavier Ekong', 'Male', '2002-04-16', 'DT005'),
	   ('ST026', 'Yemi Balogun', 'Male', '2001-12-20', 'DT001'),
	   ('ST027', 'Zainab Hassan', 'Female', '2000-06-06', 'DT002'),
	   ('ST028', 'Abigail Peters', 'Female', '2003-03-13', 'DT006'),
	   ('ST029', 'Bolanle Ilesanmi', 'Female', '1999-09-09', 'DT003'),
	   ('ST030', 'Chukwuma Nwosu', 'Male', '2000-02-26', 'DT004'),
	   ('ST031', 'Damilola Ogun', 'Female', '2001-05-04', 'DT001'),
	   ('ST032', 'Elias Mensah', 'Male', '2002-11-02', 'DT005'),
	   ('ST033', 'Favour Amadi', 'Female', '2000-01-19', 'DT003'),
	   ('ST034', 'Gbenga Ayo', 'Male', '1998-12-30', 'DT001'),
	   ('ST035', 'Halima Usman', 'Female', '2002-09-23', 'DT002'),
	   ('ST036', 'Ibrahim Bello', 'Male', '2001-07-12', 'DT005'),
	   ('ST037', 'Jumoke Ade', 'Female', '2000-03-03', 'DT006'),
	   ('ST038', 'Kola Martins', 'Male', '1999-11-08', 'DT004'),
	   ('ST039', 'Lola Awolowo', 'Female', '2001-08-28', 'DT003'),
	   ('ST040', 'Moses Eze', 'Male', '2002-05-17', 'DT004'),
	   ('ST041', 'Ngozi Umeh', 'Female', '1998-10-25', 'DT006'),
	   ('ST042', 'Olaide Ojo', 'Female', '2000-02-14', 'DT001'),
	   ('ST043', 'Peter Ike', 'Male', '2001-06-29', 'DT005'),
	   ('ST044', 'Queen Nwachukwu', 'Female', '2002-01-02', 'DT003'),
	   ('ST045', 'Ramon Okoro', 'Male', '1999-04-21', 'DT004'),
	   ('ST046', 'Susan Okafor', 'Female', '2003-07-20', 'DT006'),
	   ('ST047', 'Tunde Aina', 'Male', '2000-09-01', 'DT001'),
	   ('ST048', 'Umar Abdullahi', 'Male', '2001-03-11', 'DT002'),
	   ('ST049', 'Vera Chike', 'Female', '2002-10-30', 'DT003'),
	   ('ST050', 'Yakubu Sule', 'Male', '1999-05-17', 'DT005');



-- Enrollments' Table
INSERT INTO Enrollments
VALUES ('EN001', 'ST001', 'CS001', '2023-09-12'),
	   ('EN002', 'ST001', 'CS002', '2023-09-12'),
	   ('EN003', 'ST002', 'CS005', '2023-09-14'),
	   ('EN004', 'ST002', 'CS006', '2023-09-14'),
	   ('EN005', 'ST003', 'CS001', '2023-09-15'),
	   ('EN006', 'ST003', 'CS003', '2023-09-15'),
	   ('EN007', 'ST004', 'CS008', '2023-09-16'),
	   ('EN008', 'ST004', 'CS009', '2023-09-16'),
	   ('EN009', 'ST004', 'CS010', '2023-09-16'),
	   ('EN010', 'ST005', 'CS011', '2023-09-17'),
	   ('EN011', 'ST005', 'CS012', '2023-09-17'),
	   ('EN012', 'ST006', 'CS017', '2023-09-18'),
	   ('EN013', 'ST006', 'CS019', '2023-09-18'),
	   ('EN014', 'ST007', 'CS014', '2023-09-19'),
	   ('EN015', 'ST007', 'CS015', '2023-09-19'),
	   ('EN016', 'ST008', 'CS006', '2023-09-20'),
	   ('EN017', 'ST008', 'CS007', '2023-09-20'),
	   ('EN018', 'ST009', 'CS002', '2023-09-21'),
	   ('EN019', 'ST009', 'CS003', '2023-09-21'),
	   ('EN020', 'ST010', 'CS008', '2023-09-22'),
	   ('EN021', 'ST010', 'CS009', '2023-09-22'),
	   ('EN022', 'ST011', 'CS001', '2023-09-23'),
	   ('EN023', 'ST011', 'CS004', '2023-09-23'),
	   ('EN024', 'ST012', 'CS018', '2023-09-24'),
	   ('EN025', 'ST012', 'CS020', '2023-09-24'),
	   ('EN026', 'ST013', 'CS014', '2023-09-25'),
	   ('EN027', 'ST013', 'CS016', '2023-09-25'),
	   ('EN028', 'ST014', 'CS005', '2023-09-26'),
	   ('EN029', 'ST014', 'CS007', '2023-09-26'),
	   ('EN030', 'ST015', 'CS010', '2023-09-27'),
	   ('EN031', 'ST015', 'CS009', '2023-09-27'),
	   ('EN032', 'ST016', 'CS002', '2023-09-28'),
	   ('EN033', 'ST016', 'CS004', '2023-09-28'),
	   ('EN034', 'ST017', 'CS012', '2023-09-29'),
	   ('EN035', 'ST017', 'CS013', '2023-09-29'),
	   ('EN036', 'ST018', 'CS015', '2023-09-30'),
	   ('EN037', 'ST018', 'CS016', '2023-09-30'),
	   ('EN038', 'ST019', 'CS018', '2023-10-01'),
	   ('EN039', 'ST019', 'CS020', '2023-10-01'),
	   ('EN040', 'ST020', 'CS001', '2023-10-02'),
	   ('EN041', 'ST020', 'CS003', '2023-10-02'),
	   ('EN042', 'ST021', 'CS001', '2023-10-03'),
	   ('EN043', 'ST021', 'CS002', '2023-10-03'),
	   ('EN044', 'ST022', 'CS005', '2023-10-04'),
	   ('EN045', 'ST022', 'CS007', '2023-10-04'),
	   ('EN046', 'ST023', 'CS011', '2023-10-05'),
	   ('EN047', 'ST023', 'CS013', '2023-10-05'),
	   ('EN048', 'ST024', 'CS017', '2023-10-06'),
	   ('EN049', 'ST024', 'CS019', '2023-10-06'),
	   ('EN050', 'ST025', 'CS014', '2023-10-07'),
	   ('EN051', 'ST025', 'CS016', '2023-10-07'),
	   ('EN052', 'ST026', 'CS002', '2023-10-08'),
	   ('EN053', 'ST026', 'CS003', '2023-10-08'),
	   ('EN054', 'ST027', 'CS006', '2023-10-09'),
	   ('EN055', 'ST027', 'CS007', '2023-10-09'),
	   ('EN056', 'ST028', 'CS018', '2023-10-10'),
	   ('EN057', 'ST028', 'CS020', '2023-10-10'),
	   ('EN058', 'ST029', 'CS008', '2023-10-11'),
	   ('EN059', 'ST029', 'CS009', '2023-10-11'),
	   ('EN060', 'ST030', 'CS011', '2023-10-12'),
	   ('EN061', 'ST030', 'CS012', '2023-10-12'),
	   ('EN062', 'ST031', 'CS004', '2023-10-13'),
	   ('EN063', 'ST031', 'CS001', '2023-10-13'),
	   ('EN064', 'ST032', 'CS015', '2023-10-14'),
	   ('EN065', 'ST032', 'CS016', '2023-10-14'),
	   ('EN066', 'ST033', 'CS008', '2023-10-15'),
	   ('EN067', 'ST033', 'CS010', '2023-10-15'),
	   ('EN068', 'ST034', 'CS002', '2023-10-16'),
	   ('EN069', 'ST034', 'CS003', '2023-10-16'),
	   ('EN070', 'ST035', 'CS006', '2023-10-17'),
	   ('EN071', 'ST035', 'CS007', '2023-10-17'),
	   ('EN072', 'ST036', 'CS014', '2023-10-18'),
	   ('EN073', 'ST036', 'CS015', '2023-10-18'),
	   ('EN074', 'ST037', 'CS017', '2023-10-19'),
	   ('EN075', 'ST037', 'CS018', '2023-10-19'),
	   ('EN076', 'ST038', 'CS011', '2023-10-20'),
	   ('EN077', 'ST038', 'CS013', '2023-10-20'),
	   ('EN078', 'ST039', 'CS009', '2023-10-21'),
	   ('EN079', 'ST039', 'CS010', '2023-10-21'),
	   ('EN080', 'ST040', 'CS012', '2023-10-22'),
	   ('EN081', 'ST040', 'CS013', '2023-10-22'),
	   ('EN082', 'ST041', 'CS017', '2023-10-23'),
	   ('EN083', 'ST041', 'CS019', '2023-10-23'),
	   ('EN084', 'ST042', 'CS001', '2023-10-24'),
	   ('EN085', 'ST042', 'CS004', '2023-10-24'),
	   ('EN086', 'ST043', 'CS015', '2023-10-25'),
	   ('EN087', 'ST043', 'CS016', '2023-10-25'),
	   ('EN088', 'ST044', 'CS008', '2023-10-26'),
	   ('EN089', 'ST044', 'CS009', '2023-10-26'),
	   ('EN090', 'ST045', 'CS011', '2023-10-27'),
	   ('EN091', 'ST045', 'CS013', '2023-10-27'),
	   ('EN092', 'ST046', 'CS018', '2023-10-28'),
	   ('EN093', 'ST046', 'CS020', '2023-10-28'),
	   ('EN094', 'ST047', 'CS002', '2023-10-29'),
	   ('EN095', 'ST047', 'CS004', '2023-10-29'),
	   ('EN096', 'ST048', 'CS005', '2023-10-30'),
	   ('EN097', 'ST048', 'CS006', '2023-10-30'),
	   ('EN098', 'ST049', 'CS009', '2023-10-31'),
	   ('EN099', 'ST049', 'CS010', '2023-10-31'),
	   ('EN100', 'ST050', 'CS014', '2023-10-31');



-- Course Instructors' Table
INSERT INTO CourseInstructors
VALUES ('CA001', 'IT001', 'CS001'),
	   ('CA002', 'IT007', 'CS001'),
	   ('CA003', 'IT001', 'CS002'),
	   ('CA004', 'IT013', 'CS002'),
	   ('CA005', 'IT007', 'CS003'),
	   ('CA006', 'IT013', 'CS004'),
	   ('CA007', 'IT001', 'CS004'),
	   ('CA008', 'IT002', 'CS005'),
	   ('CA009', 'IT008', 'CS005'),
	   ('CA010', 'IT002', 'CS006'),
	   ('CA011', 'IT008', 'CS007'),
	   ('CA012', 'IT003', 'CS008'),
	   ('CA013', 'IT009', 'CS008'),
	   ('CA014', 'IT009', 'CS009'),
	   ('CA015', 'IT014', 'CS010'),
	   ('CA016', 'IT004', 'CS011'),
	   ('CA017', 'IT010', 'CS011'),
	   ('CA018', 'IT004', 'CS012'),
	   ('CA019', 'IT010', 'CS013'),
	   ('CA020', 'IT005', 'CS014'),
	   ('CA021', 'IT011', 'CS015'),
	   ('CA022', 'IT005', 'CS016'),
	   ('CA023', 'IT006', 'CS017'),
	   ('CA024', 'IT012', 'CS017'),
	   ('CA025', 'IT006', 'CS018'),
	   ('CA026', 'IT015', 'CS018'),
	   ('CA027', 'IT006', 'CS019'),
	   ('CA028', 'IT012', 'CS020');



-- Calling out each Tables

SELECT * 
FROM Courses;

SELECT * 
FROM Departments;

SELECT * 
FROM Students;

SELECT * 
FROM Enrollments;

SELECT * 
FROM Instructors;

SELECT *
FROM CourseInstructors;