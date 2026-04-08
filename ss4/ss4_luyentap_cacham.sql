USE quanlysinhvien;
SELECT * FROM Student;
SELECT * FROM Mark;
SELECT * FROM Subject;
SELECT *
FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);
SELECT S.SubID, S.SubName, M.Mark
FROM Subject S
JOIN Mark M ON S.SubID = M.SubID
WHERE M.Mark = (SELECT MAX(Mark) FROM Mark);
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS AvgMark
FROM Student S
JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
ORDER BY AvgMark DESC;