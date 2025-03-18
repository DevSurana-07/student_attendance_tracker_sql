-- Create a database university.
CREATE DATABASE university;
USE university;

-- Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);

-- Insert data into Departments Table
INSERT INTO Departments (department_name) VALUES 
('Computer Science'),
('Mathematics'),
('Physics'),
('Biology'),
('Chemistry');

-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,  -- Instead of ENUM, use VARCHAR ('Male', 'Female', 'Other')
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15) NOT NULL,
    address VARCHAR(255),
    admission_date DATE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Insert data into Students Table
INSERT INTO Students (name, dob, gender, email, phone_number, address, admission_date, department_id) VALUES
('Alice Johnson', '2002-05-15', 'Female', 'alice@mail.com', '1234567890', '123 Main St', '2021-08-15', 1),
('Bob Smith', '2001-10-20', 'Male', 'bob@mail.com', '1234567891', '456 Elm St', '2022-07-10', 2),
('Charlie Davis', '2003-01-25', 'Male', 'charlie@mail.com', '1234567892', '789 Pine St', '2023-06-01', 1),
('David Green', '2000-12-05', 'Male', 'david@mail.com', '1234567893', '101 Oak St', '2021-09-10', 3),
('Eva Brown', '2002-07-18', 'Female', 'eva@mail.com', '1234567894', '202 Birch St', '2022-08-12', 4),
('Frank Wilson', '2001-03-11', 'Male', 'frank@mail.com', '1234567895', '303 Cedar St', '2023-07-05', 5),
('Grace Miller', '2003-09-21', 'Female', 'grace@mail.com', '1234567896', '404 Maple St', '2021-06-30', 1),
('Hannah Lee', '2000-02-29', 'Female', 'hannah@mail.com', '1234567897', '505 Pine St', '2022-05-20', 2),
('Ian Thompson', '2002-11-10', 'Male', 'ian@mail.com', '1234567898', '606 Elm St', '2023-04-15', 3),
('Jack White', '2001-08-22', 'Male', 'jack@mail.com', '1234567899', '707 Birch St', '2021-03-25', 4);

-- Faculty Table
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Insert data into Faculty Table
INSERT INTO Faculty (name, email, phone_number, department_id) VALUES
('Dr. John Doe', 'john.doe@mail.com', '9876543210', 1),
('Dr. Emily White', 'emily.white@mail.com', '9876543211', 2),
('Dr. Michael Brown', 'michael.brown@mail.com', '9876543212', 3),
('Dr. Sarah Wilson', 'sarah.wilson@mail.com', '9876543213', 4),
('Dr. William Taylor', 'william.taylor@mail.com', '9876543214', 5);

-- Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);

-- Insert data into Courses Table
INSERT INTO Courses (course_name, faculty_id) VALUES
('Database Management', 1),
('Calculus', 2),
('Quantum Physics', 3),
('Molecular Biology', 4),
('Organic Chemistry', 5);

-- Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert data into Enrollments Table
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-08-20'),
(2, 2, '2023-08-21'),
(3, 3, '2023-08-22'),
(4, 4, '2023-08-23'),
(5, 5, '2023-08-24'),
(6, 1, '2023-08-25'),
(7, 2, '2023-08-26'),
(8, 3, '2023-08-27'),
(9, 4, '2023-08-28'),
(10, 5, '2023-08-29');

-- Attendance Table
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    attendance_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,  -- Instead of ENUM, use VARCHAR ('Present', 'Absent', 'Late')
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert data into Attendance Table
INSERT INTO Attendance (student_id, course_id, attendance_date, status) VALUES
(1, 1, '2023-09-01', 'Present'),
(2, 2, '2023-09-01', 'Absent'),
(3, 3, '2023-09-01', 'Late'),
(4, 4, '2023-09-02', 'Present'),
(5, 5, '2023-09-02', 'Absent'),
(6, 1, '2023-09-02', 'Present'),
(7, 2, '2023-09-02', 'Late'),
(8, 3, '2023-09-03', 'Present'),
(9, 4, '2023-09-03', 'Absent'),
(10, 5, '2023-09-03', 'Present');

-- Grades Table
CREATE TABLE Grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    marks_obtained FLOAT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert data into Grades Table
INSERT INTO Grades (student_id, course_id, marks_obtained) VALUES
(1, 1, 92),
(2, 2, 75),
(3, 3, 55),
(4, 4, 88),
(5, 5, 67),
(6, 1, 45),
(7, 2, 78),
(8, 3, 91),
(9, 4, 82),
(10, 5, 95);


-- 1. Implement CRUD Operations (Low Weightage)
    -- • Insert new students, faculty members, courses, and enrollments.
    
        -- Insert a new student
        INSERT INTO Students (name, dob, gender, email, phone_number, address, admission_date, department_id)
        VALUES ('John Doe', '2002-09-10', 'Male', 'johndoe@mail.com', '9876543210', '789 Oak St', '2023-08-01', 1);

        -- Insert a new faculty member
        INSERT INTO Faculty (name, email, phone_number, department_id)
        VALUES ('Dr. Amanda Smith', 'amanda.smith@mail.com', '9876543215', 3);

        -- Insert a new course
        INSERT INTO Courses (course_name, faculty_id)
        VALUES ('Advanced Physics', 3);

        -- Insert a new enrollment
        INSERT INTO Enrollments (student_id, course_id, enrollment_date)
        VALUES (1, 1, '2023-09-01');

    
    -- • Update student records when they change contact details.
    UPDATE Students
    SET phone_number = '9998887776', email = 'newemail@mail.com'
    WHERE student_id = 1;

    -- • Delete students who have dropped out.
    DELETE FROM Students
    WHERE student_id = 11;

-- 2. Use SQL Clauses (WHERE, HAVING, LIMIT) (Low Weightage)
    -- • Get students enrolled in the Computer Science Department.
    SELECT * FROM students
    WHERE department_id = 1;
    
    -- • Retrieve the top 10 highest-scoring students.
    SELECT student_id, AVG(marks_obtained) AS avg_marks
    FROM Grades
    GROUP BY student_id
    ORDER BY avg_marks DESC
    LIMIT 10;
    
    -- • Find students with attendance below 75%.
    SELECT student_id, (COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100 / COUNT(*)) AS attendance_percentage
    FROM Attendance
    GROUP BY student_id
    HAVING attendance_percentage < 75;

-- 3. Apply SQL Operators (AND, OR, NOT) (Medium Weightage)
    -- • Retrieve students who have attendance below 50% AND are failing.    
    -- • Find students who scored above 90 OR have perfect attendance.
    SELECT DISTINCT s.student_id, s.name
    FROM Students s
    LEFT JOIN Grades g ON s.student_id = g.student_id
    LEFT JOIN Attendance a ON s.student_id = a.student_id
    WHERE g.marks_obtained > 90 OR 
      (SELECT COUNT(*) FROM Attendance att WHERE att.student_id = s.student_id AND att.status = 'Absent') = 0;
    
    -- • List faculty members NOT assigned to any course.
    SELECT * FROM Faculty
    WHERE faculty_id NOT IN (SELECT faculty_id FROM Courses);

-- 4. Sorting & Grouping Data (ORDER BY, GROUP BY) (Medium Weightage)
    -- • List students alphabetically by name.
    SELECT * FROM students ORDER BY name;    
    
    -- • Count the number of students enrolled in each department.
    SELECT d.department_name, COUNT(s.student_id) AS num_students
    FROM Departments d
    LEFT JOIN Students s ON d.department_id = s.department_id
    GROUP BY d.department_name;
    
    -- • Show the average marks per course.
    SELECT c.course_name , AVG(g.marks_obtained) AS avg_marks
    FROM Courses c
    LEFT JOIN Grades g ON c.course_id = g.course_id
    GROUP BY c.course_name;

-- 5. Use Aggregate Functions (SUM, AVG, MAX, MIN, COUNT) (High Weightage)
    -- • Find the average attendance percentage of students.
    SELECT AVG(attendance_percentage) AS avg_attendance
    FROM (SELECT student_id, (COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100 / COUNT(*)) AS attendance_percentage
    FROM Attendance
    GROUP BY student_id
    ) AS subquery;
    
    -- • Identify the highest and lowest marks obtained in each course.
    SELECT course_id, MAX(marks_obtained) AS highest_marks , MIN(marks_obtained) AS lowest_marks
    FROM Grades
    GROUP BY course_id;

    -- • Calculate the total number of students per department.
    SELECT d.department_name, COUNT(s.student_id) AS num_of_students
    FROM Departments d
    LEFT JOIN Students s ON s.department_id = d.department_id
    GROUP BY d.department_name;

-- 6. Establish Primary & Foreign Key Relationships (High Weightage)
    -- • Ensure that students cannot enroll in the same course multiple times.
    ALTER TABLE Enrollments ADD CONSTRAINT unique_enrollment UNIQUE (student_id, course_id);    
    
    -- • Link faculty members to the courses they teach.
    SELECT f.name AS faculty_name, c.course_name
    FROM Faculty f
    JOIN Courses c ON f.faculty_id = c.faculty_id;

-- 7. Implement Joins (High Weightage)
    -- • Retrieve student details along with their department using INNER JOIN.
    SELECT s.name , d.department_name
    FROM Students s
    JOIN Departments d ON s.department_id = d.department_id;
    
    -- • Get a list of students who have not enrolled in any course using LEFT JOIN.
    SELECT s.name , e.course_id
    FROM students s
    LEFT JOIN enrollments e ON s.student_id = e.student_id
    WHERE e.course_id is NULL;
    
    -- • List courses that have no faculty assigned using RIGHT JOIN.
    SELECT c.course_name , f.name
    FROM Courses c 
    RIGHT JOIN Faculty f ON c.faculty_id = f.faculty_id
    WHERE c.faculty_id IS NULL;

    -- • Show students without grades using FULL OUTER JOIN.
    SELECT s.student_id, s.name
    FROM Students s
    LEFT JOIN Grades g ON s.student_id = g.student_id
    WHERE g.student_id IS NULL

    UNION

    SELECT s.student_id, s.name
    FROM Students s
    RIGHT JOIN Grades g ON s.student_id = g.student_id
    WHERE s.student_id IS NULL;

-- 8. Use Subqueries (High Weightage)
    -- • Find students with marks above the average score.
    SELECT * FROM Grades
    WHERE marks_obtained > (SELECT AVG(marks_obtained)FROM Grades);
    
    -- • Retrieve courses taught by faculty members with at least 5 years of experience.
    SELECT * FROM Courses
    WHERE faculty_id IN (SELECT faculty_id FROM Faculty WHERE DATEDIFF(CURDATE(),hire_date) / 365 >= 5); -- WILL ADD THE HIRE DATE HERE IF IT IS THERE IN FACULTY TABLE. 

    -- • Identify students who have missed more than 10 classes.
    SELECT * FROM Students
    WHERE student_id IN (SELECT student_id FROM Attendance WHERE status = 'Absent' GROUP BY student_id HAVING COUNT(*) > 10);

-- 9. Implement Date & Time Functions (High Weightage)
    -- • Extract the month from attendance_date to analyze attendance trends.
    SELECT MONTH(attendance_date) AS months, COUNT(*) AS num_of_students
    FROM Attendance
    GROUP BY months;   
    
    -- • Calculate the number of years since a student's admission.
    SELECT name, TIMESTAMPDIFF(YEAR, admission_date, CURDATE()) AS years_since_admission
    FROM Students;    
   
    -- • Format attendance_date as DD-MM-YYYY.
    SELECT student_id , course_id , DATE_FORMAT(attendance_date, '%d-%m-%Y') AS formatted_date
    FROM Attendance;

-- 10. Use String Manipulation Functions (High Weightage)
    -- • Convert all faculty names to uppercase.
    SELECT UPPER(name) AS faculty_name_in_uppercase
    FROM faculty;
    
    -- • Trim unnecessary spaces from student names.
    SELECT TRIM(name) AS trimmed_name
    FROM students;
    
    -- • Replace NULL email fields with "Email Not Provided"
    SELECT IFNULL(email, 'Email Not Provided') AS email
    FROM students;

-- 11. Implement Window Functions (Very High Weightage)
    -- • Rank students based on their overall marks.
    SELECT student_id, course_id, marks_obtained, 
        RANK() OVER (ORDER BY marks_obtained DESC) AS `rank`
    FROM Grades;

    -- • Show the cumulative attendance percentage per course.
    SELECT course_id, student_id, status,
       SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) 
           OVER (PARTITION BY course_id) * 100.0 / 
       COUNT(*) OVER (PARTITION BY course_id) AS cumulative_attendance
    FROM Attendance;

    -- • Display the running total of students enrolled per month.
    SELECT 
        DATE_FORMAT(enrollment_date, '%Y-%m') AS enrollment_month,
        COUNT(student_id) AS students_enrolled,
        SUM(COUNT(student_id)) OVER (ORDER BY DATE_FORMAT(enrollment_date, '%Y-%m')) AS running_total
    FROM Enrollments
    GROUP BY enrollment_month
    ORDER BY enrollment_month;

-- 12. Apply SQL CASE Expressions (Very High Weightage)

-- • Assign student performance levels:
    -- • "Excellent" ifmarks_obtained > 90.
    -- • "Good" ifmarks_obtained BETWEEN 75 AND 90.
    -- • "Needs Improvement" otherwise.
    SELECT student_id, course_id, marks_obtained,
       CASE 
           WHEN marks_obtained > 90 THEN 'Excellent'
           WHEN marks_obtained BETWEEN 75 AND 90 THEN 'Good'
           ELSE 'Needs Improvement'
       END AS performance_level
    FROM Grades;

-- • Categorize attendance records:
    -- • "Regular" for attendance above 80%.
    -- • "Irregular" for attendance between 50% and 80%.
    -- • "Defaulter" otherwise.
    SELECT student_id, 
       (COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100.0 / COUNT(*)) AS attendance_percentage,
       CASE 
           WHEN (COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100.0 / COUNT(*)) > 80 THEN 'Regular'
           WHEN (COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100.0 / COUNT(*)) BETWEEN 50 AND 80 THEN 'Irregular'
           ELSE 'Defaulter'
       END AS attendance_category
    FROM Attendance
    GROUP BY student_id;