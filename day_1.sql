-- Q1: write query to get the list of StudentID who entrolled in all courses availabel in 2019... suppose the query has 10 10 courses available in 2019, 
--     query should return studentid who were entolled in all these courses.

CREATE TABLE student_batch (
    StudentID INT,
    CourseID INT,
    EnrollmentYear INT
);

INSERT INTO student_batch (StudentID, CourseID, EnrollmentYear) VALUES
(1, 101, 2019),
(1, 102, 2019),
(1, 103, 2019),
(1, 104, 2019),
(1, 105, 2019),
(1, 106, 2019),
(1, 107, 2019),
(1, 108, 2019),
(1, 109, 2019),
(1, 110, 2019),
(2, 101, 2019),
(2, 102, 2019),
(2, 103, 2019),
(2, 104, 2019),
(2, 105, 2019),
(2, 106, 2019),
(2, 107, 2019),
(2, 108, 2019),
(2, 109, 2019),
(2, 110, 2019),
(3, 101, 2019),
(3, 102, 2019),
(3, 103, 2019),
(3, 104, 2019),
(3, 105, 2019),
(3, 106, 2019),
(3, 107, 2019),
(3, 108, 2019),
(4, 101, 2019),
(4, 102, 2019),
(4, 103, 2019),
(4, 104, 2019),
(4, 105, 2019),
(4, 106, 2019),
(4, 107, 2019),
(4, 108, 2019),
(4, 109, 2019),
(1, 105, 2020),
(1, 106, 2020),
(3, 107, 2020),
(4, 108, 2019),
(4, 109, 2020),
(2, 106, 2020),
(1, 107, 2020),
(4, 110, 2020),
(4, 111, 2020);

use student_batch;

select StudentID, count( distinct CourseID)
from student_batch 
where EnrollmentYear = 2019
group by StudentID
having count(distinct CourseID) = (select count(distinct CourseID)
                                   from student_batch
                                   where EnrollmentYear = 2019);


-- Q2- what will be the output  ;

CREATE TABLE t1(c1 INT);

CREATE TABLE t2(c2 INT);

INSERT INTO t1
VALUES
(4),
(6),
(7),
(9),
(3),
(9);

INSERT INTO t2
VALUES
(1),
(5),
(9),
(2),
(2),
(11);

select t1.c1
from t1
left join t2 on t1.c1 = t2.c2;












