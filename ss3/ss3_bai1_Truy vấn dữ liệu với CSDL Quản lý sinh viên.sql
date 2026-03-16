CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50),
    StartDate DATE,
    Status BIT
);
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Address VARCHAR(100),
    Phone VARCHAR(20),
    Status BIT,
    ClassID INT
);
CREATE TABLE Subject (
    SubID INT PRIMARY KEY,
    SubName VARCHAR(50),
    Credit INT,
    Status BIT
);
CREATE TABLE Mark (
    MarkID INT PRIMARY KEY,
    SubID INT,
    StudentID INT,
    Mark FLOAT
);

INSERT INTO Class VALUES
(1,'A1','2008-12-20',1),
(2,'A2','2008-12-22',1),
(3,'B3',CURRENT_DATE,0);

INSERT INTO Student VALUES
(1,'Hung','Ha Noi','0901234567',1,1),
(2,'Hoa','Hai Phong','0912345678',1,1),
(3,'Manh','HCM','0923456789',0,2);

INSERT INTO Subject VALUES
(1,'CF',5,1),
(2,'C',6,1),
(3,'HDJ',5,1),
(4,'RDBMS',10,1);
INSERT INTO Mark VALUES
(1,1,1,8),
(2,1,2,10),
(3,2,1,12);
-- hiển thị sinh viên có tên bắt đầu bằng chữ h
SELECT *
FROM Student
WHERE StudentName LIKE 'H%';
-- 2 Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT *
FROM Class
WHERE MONTH(StartDate) = 12;
-- 3 Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
SELECT *
FROM Subject
WHERE Credit BETWEEN 3 AND 5;
-- 4 Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
UPDATE Student
SET ClassID = 2
WHERE StudentName = 'Hung';
-- 5 Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
SELECT Student.StudentName, Subject.SubName, Mark.Mark
FROM Mark
JOIN Student ON Mark.StudentID = Student.StudentID
JOIN Subject ON Mark.SubID = Subject.SubID
ORDER BY Mark.Mark DESC, Student.StudentName ASC;








