create database organisation;
use organisation;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Dept VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Salary INT NOT NULL,
    JoinDate DATE NOT NULL,
    Role VARCHAR(50) NOT NULL
);


-- Insert all data
INSERT INTO Employees (EmpID, Name, Dept, City, Gender, Salary, JoinDate, Role) VALUES
(1,'Alice','HR','New York','F',55000,'2019-03-15','Manager'),
(2,'Bob','IT','Chicago','M',72000,'2020-07-22','Developer'),
(3,'Carol','Finance','New York','F',68000,'2018-11-01','Analyst'),
(4,'David','HR','Chicago','M',52000,'2021-01-10','Executive'),
(5,'Eve','IT','Houston','F',85000,'2017-06-30','Senior Dev'),
(6,'Frank','Finance','New York','M',74000,'2019-09-14','Manager'),
(7,'Grace','Marketing','Chicago','F',60000,'2022-02-28','Executive'),
(8,'Hank','IT','Houston','M',90000,'2016-04-05','Lead'),
(9,'Ivy','HR','New York','F',58000,'2020-12-19','Executive'),
(10,'Jack','Finance','Chicago','M',65000,'2021-03-07','Analyst'),
(11,'Karen','Marketing','Houston','F',62000,'2018-08-23','Manager'),
(12,'Leo','IT','New York','M',78000,'2019-11-11','Developer'),
(13,'Mia','HR','Chicago','F',53000,'2022-05-16','Executive'),
(14,'Nate','Finance','Houston','M',71000,'2017-12-02','Manager'),
(15,'Olivia','Marketing','New York','F',66000,'2020-06-18','Analyst'),
(16,'Paul','IT','Chicago','M',82000,'2018-03-27','Senior Dev'),
(17,'Quinn','HR','Houston','F',57000,'2021-09-09','Executive'),
(18,'Rita','Finance','New York','F',76000,'2019-01-25','Lead'),
(19,'Sam','Marketing','Chicago','M',63000,'2022-07-14','Executive'),
(20,'Tina','IT','Houston','F',88000,'2016-10-31','Lead'),
(21,'Uma','HR','New York','F',60000,'2020-04-03','Manager'),
(22,'Victor','Finance','Chicago','M',69000,'2018-07-19','Analyst'),
(23,'Wendy','Marketing','Houston','F',64000,'2021-11-27','Manager'),
(24,'Xander','IT','New York','M',95000,'2015-02-14','Architect'),
(25,'Yara','HR','Chicago','F',54000,'2022-09-08','Executive'),
(26,'Zoe','Finance','Houston','F',73000,'2019-05-21','Manager'),
(27,'Aaron','Marketing','New York','M',67000,'2020-10-15','Analyst'),
(28,'Bella','IT','Chicago','F',80000,'2017-08-06','Senior Dev'),
(29,'Carlos','HR','Houston','M',56000,'2021-06-24','Executive'),
(30,'Diana','Finance','New York','F',77000,'2018-02-09','Lead');

-- Q1. Total number of employees in each department
SELECT Dept, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY Dept;

-- Q2. Total salary paid per department
SELECT Dept, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Dept;

-- Q3. Average salary in each city
SELECT City, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY City;

-- Q4. Maximum salary in each department
SELECT Dept, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY Dept;

-- Q5. Minimum salary in each department
SELECT Dept, MIN(Salary) AS MinSalary
FROM Employees
GROUP BY Dept;

-- Q6. Departments with employee count (descending)
SELECT Dept, COUNT(*) AS EmpCount
FROM Employees
GROUP BY Dept
ORDER BY EmpCount DESC;

-- Q7. Cities with total salary (ascending)
SELECT City, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY City
ORDER BY TotalSalary ASC;

-- Q8. Employees ordered by department and salary
SELECT Name, Dept, Salary
FROM Employees
ORDER BY Dept ASC, Salary DESC;

-- Q9. Employees ordered by city and join date
SELECT Name, City, JoinDate
FROM Employees
ORDER BY City ASC, JoinDate ASC;

-- Q10. Employees ordered by role and salary
SELECT Name, Role, Salary
FROM Employees
ORDER BY Role ASC, Salary ASC;

-- Q11. Departments having more than 7 employees
SELECT Dept, COUNT(*) AS EmpCount
FROM Employees
GROUP BY Dept
HAVING COUNT(*) > 7;

-- Q12. Departments where average salary > 65000
SELECT Dept, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Dept
HAVING AVG(Salary) > 65000;

-- Q13. Cities where total salary > 650000
SELECT City, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY City
HAVING SUM(Salary) > 650000;

-- Q14. Departments where max salary >= 80000
SELECT Dept, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY Dept
HAVING MAX(Salary) >= 80000;

-- Q15. Roles appearing more than 5 times
SELECT Role, COUNT(*) AS RoleCount
FROM Employees
GROUP BY Role
HAVING COUNT(*) > 5;

-- Q16. Overall average salary
SELECT AVG(Salary) AS CompanyAvgSalary
FROM Employees;

-- Q17. Female employees in each department
SELECT Dept, COUNT(*) AS FemaleCount
FROM Employees
WHERE Gender='F'
GROUP BY Dept;

-- Q18. Highest and lowest salary
SELECT MAX(Salary) AS Highest,
       MIN(Salary) AS Lowest
FROM Employees;

-- Q19. Total salary of employees joined after 2019-01-01
SELECT SUM(Salary) AS TotalSalary
FROM Employees
WHERE JoinDate > '2019-01-01';

-- Q20. Average salary by gender
SELECT Gender, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Gender;

-- Q21. Total employees by department and city
SELECT Dept, City, COUNT(*) AS EmpCount
FROM Employees
GROUP BY Dept, City;

-- Q22. Average salary by department and gender
SELECT Dept, Gender, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Dept, Gender;

-- Q23. Total salary by city and role
SELECT City, Role, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY City, Role
ORDER BY City ASC, TotalSalary DESC;

-- Q24. Employee count by department and role (>1)
SELECT Dept, Role, COUNT(*) AS EmpCount
FROM Employees
GROUP BY Dept, Role
HAVING COUNT(*) > 1;

-- Q25. Max salary by city and gender
SELECT City, Gender, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY City, Gender;

-- Q26. Departments with avg salary >60000
SELECT Dept, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Dept
HAVING AVG(Salary) > 60000
ORDER BY AvgSalary DESC;

-- Q27. City and department combinations with more than 1 employee
SELECT City, Dept, COUNT(*) AS EmpCount
FROM Employees
GROUP BY City, Dept
HAVING COUNT(*) > 1
ORDER BY EmpCount DESC, City ASC;

-- Q28. Roles where total salary >300000
SELECT Role, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Role
HAVING SUM(Salary) > 300000
ORDER BY TotalSalary ASC;

-- Q29. Employee name in uppercase and join year
SELECT UPPER(Name) AS EmpName,
       YEAR(JoinDate) AS JoinYear
FROM Employees
ORDER BY JoinYear;

-- Q30. Number of employees joined each year
SELECT YEAR(JoinDate) AS JoinYear,
       COUNT(*) AS Joiners
FROM Employees
GROUP BY YEAR(JoinDate)
ORDER BY JoinYear;

