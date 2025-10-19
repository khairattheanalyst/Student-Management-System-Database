-- Student & Enrollment Reports

-- How many students are currently enrolled in each course?

SELECT c.course_id, c.course_name, COUNT(e.enrollment_id) AS total_students
FROM courses AS c
JOIN enrollments AS e
	ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_students DESC;

-- The result shows the number of students enrolled in each course, with Introduction to Programming CS001,
-- Data Structures CS002, Linear Algebra CS009, having the highest (7) students and 
-- Academic Writing CS019 with the lowest (3) students.



-- Which students are enrolled in multiple courses, and which courses are they taking?

SELECT s.student_id, s.name, STRING_AGG(c.course_name, ', ') AS courses_enrolled, COUNT(e.course_id) AS total_courses
FROM students AS s
JOIN enrollments AS e 
	ON s.student_id = e.student_id
JOIN courses AS c 
	ON e.course_id = c.course_id
GROUP BY s.student_id, s.name
HAVING 
    COUNT(e.course_id) > 1
ORDER BY total_courses DESC;

-- The result shows that 49 students are enrolled in multiple courses, Student ID 004 - Chiamaka Obi registered three courses
-- making her the only student with the highest number of courses enrolled. 



-- What is the total number of students per department across all courses?

SELECT d.department_id, d.department_name, COUNT(s.student_id) AS total_Students
FROM departments AS d
JOIN students AS s
	ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_students DESC;

-- Computer Science department has the highest number of students (12 students). 
-- Physics and Biology department have the least number of students. (7 students each).










-- Course & Instructor Analysis

-- Which courses have the highest number of enrollments?

SELECT c.course_id, c.course_name, COUNT(e.enrollment_id) AS total_students
FROM courses AS c
JOIN enrollments AS e
	ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_students DESC
LIMIT 3;

-- CS009 Linear Algebra, CS001 Introduction to Programming and CS002 Data Structures



-- Which department has the least number of students?

SELECT d.department_id, d.department_name, COUNT(s.student_id) AS total_Students
FROM departments AS d
JOIN students AS s
	ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_students ASC
LIMIT 2;

-- Physics and Biology Departments.










-- Data Integrity & Operational Insights

-- Are there any students not enrolled in any course?

SELECT s.student_id, s.name
FROM students AS s
JOIN enrollments AS e
    ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- There are no students currently not enrolled in any course.



-- How many courses does each student take on average?

SELECT ROUND(AVG(total_courses), 2) AS avg_courses_per_student
FROM
	(SELECT s.student_id, COUNT(e.course_id) AS total_courses
     FROM students AS s
     LEFT JOIN enrollments AS e 
        ON s.student_id = e.student_id
     GROUP BY s.student_id) AS total_courses_per_student;

-- Each student takes two courses on an average. 



-- What is the gender distribution of students across courses and instructors?

-- Firstly, Let's understand the courses-instructors table

SELECT c.course_name,i.name AS instructor_name, d.department_id, d.department_name
FROM courseinstructors AS ci
JOIN courses AS c 
	ON ci.course_id = c.course_id
JOIN instructors AS i 
	ON ci.instructor_id = i.instructor_id
JOIN departments AS d 
	ON c.department_id = d.department_id
ORDER BY d.department_id ASC;

-- Now, that we have understood the course-instructors table, let's answer the question.
-- Gender distribution of students across courses and instructors

SELECT 
    i.name AS instructor_name,
    c.course_name AS course_name,
    SUM(CASE WHEN s.gender = 'Male' THEN 1 ELSE 0 END) AS male_students,
    SUM(CASE WHEN s.gender = 'Female' THEN 1 ELSE 0 END) AS female_students
FROM students AS s
JOIN enrollments AS e 
	ON s.student_id = e.student_id
JOIN courses AS c 
	ON e.course_id = c.course_id
JOIN courseinstructors AS ci 
	ON c.course_id = ci.course_id
JOIN instructors AS i 
	ON ci.instructor_id = i.instructor_id
GROUP BY i.name, c.course_name;

-- Mr. Daniel Peters taking Linear Algebra has the highest number of female students in his class. 
-- Dr. Samuel Okoro and Dr. Samuel Kuti taking Data Structures have the highest number of male students in their classes. 



-- Which course has the highest number of male or female students enrolled?

SELECT
    c.course_name,
    SUM(CASE WHEN s.gender = 'Male' THEN 1 ELSE 0 END) AS male_students,
    SUM(CASE WHEN s.gender = 'Female' THEN 1 ELSE 0 END) AS female_students
FROM students AS s
JOIN enrollments AS e 
	ON s.student_id = e.student_id
JOIN courses AS c 
	ON e.course_id = c.course_id
GROUP BY c.course_name;

-- Data Structures course has the highest number of male students enrolled while
-- Linear Algebra course has the highest number of female students enrolled.