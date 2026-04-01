create database companys_db;

create table department(
dept_id int primary key,
dept_name varchar(50) not null unique
);

CREATE TABLE promotion_history (
    promotion_id INT PRIMARY KEY,
    emp_id INT,
    old_role_id INT,
    new_role_id INT,
    promotion_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (old_role_id) REFERENCES job_role(role_id),
    FOREIGN KEY (new_role_id) REFERENCES job_role(role_id)
);

create table location(
location_id int primary key,
location_name varchar(50) not null 
);

--sub tables
create table job_role(
role_id int primary key, 
role_name varchar(50) not null,
min_salary decimal(10,2),
max_salary decimal(10,2)
);




create table employees(
emp_id int primary key,
emp_name varchar(100) not null,
gender varchar(10),
dept_id int,
role_id int,
join_date date,
location_id int,
status varchar(20) default 'Active',
foreign key(dept_id) references department(dept_id),
foreign key(role_id) references job_role(role_id),
foreign key(location_id) references location(location_id)
);



create table salaries(
salary_id int primary key,
emp_id int,
salary decimal(10,2),
effective_date date,
foreign key(emp_id) references employees(emp_id)
);

create table performance_reviews(
review_id int primary key,
emp_id int,
review_year date,
rating decimal(2,1) check(rating between 1 and 5),
foreign key(emp_id) references employees(emp_id)
);

-- Departments
INSERT INTO department (dept_id, dept_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');

-- Locations
INSERT INTO location (location_id, location_name) VALUES
(101, 'Chennai'),
(102, 'Bangalore'),
(103, 'Mumbai'),
(104, 'Delhi'),
(105, 'Hyderabad'),
(106, 'Pune'),
(107, 'Kolkata'),
(108, 'Jaipur'),
(109, 'Ahmedabad'),
(110, 'Chandigarh'),
(111, 'Goa'),
(112, 'Lucknow'),
(113, 'Coimbatore'),
(114, 'Nagpur'),
(115, 'Indore');

-- Job Roles
INSERT INTO job_role (role_id, role_name, min_salary, max_salary) VALUES
(1, 'Software Engineer', 40000, 80000),
(2, 'HR Manager', 35000, 70000),
(3, 'Financial Analyst', 45000, 90000),
(4, 'Marketing Executive', 30000, 60000),
(5, 'Operations Manager', 50000, 100000);

INSERT INTO employees (emp_id, emp_name, gender, dept_id, role_id, join_date, location_id, status) VALUES
(1, 'Aditya Menon', 'Male', 1, 1, '2020-01-15', 101, 'Active'),
(2, 'Neha Sharma', 'Female', 2, 2, '2019-03-20', 102, 'Active'),
(3, 'Vikram Joshi', 'Male', 3, 3, '2021-05-10', 105, 'Active'),
(4, 'Shreya Iyer', 'Female', 4, 4, '2022-02-28', 103, 'Active'),
(5, 'Kunal Reddy', 'Male', 5, 5, '2018-11-12', 104, 'Active'),
(6, 'Aisha Khan', 'Female', 2, 2, '2021-06-18', 102, 'Active'),
(7, 'Raghav Nair', 'Male', 1, 1, '2020-09-05', 101, 'Active'),
(8, 'Priyanka Mehta', 'Female', 4, 4, '2019-12-22', 103, 'Active'),
(9, 'Sandeep Kulkarni', 'Male', 5, 5, '2022-04-30', 104, 'Active'),
(10, 'Anjali Rao', 'Female', 3, 3, '2021-08-14', 105, 'Active'),
(11, 'Aditya Menon', 'Male', 1, 1, '2020-01-15', 101, 'Active'),
(12, 'Neha Sharma', 'Female', 2, 2, '2019-03-20', 102, 'Active'),
(13, 'Vikram Joshi', 'Male', 3, 3, '2021-05-10', 105, 'Active'),
(14, 'Shreya Iyer', 'Female', 4, 4, '2022-02-28', 103, 'Active'),
(15, 'Kunal Reddy', 'Male', 5, 5, '2018-11-12', 104, 'Active'),
(16, 'Aisha Khan', 'Female', 2, 2, '2021-06-18', 102, 'Active'),
(17, 'Raghav Nair', 'Male', 1, 1, '2020-09-05', 101, 'Active'),
(18, 'Priyanka Mehta', 'Female', 4, 4, '2019-12-22', 103, 'Active'),
(19, 'Sandeep Kulkarni', 'Male', 5, 5, '2022-04-30', 104, 'Active'),
(20, 'Anjali Rao', 'Female', 3, 3, '2021-08-14', 105, 'Active');


INSERT INTO salaries (salary_id, emp_id, salary, effective_date) VALUES
(1, 1, 58000, '2021-01-15'),
(2, 2, 39000, '2020-03-20'),
(3, 3, 47000, '2022-05-10'),
(4, 4, 35000, '2023-02-28'),
(5, 5, 81000, '2019-11-12'),
(6, 6, 41000, '2022-06-18'),
(7, 7, 62000, '2021-09-05'),
(8, 8, 33000, '2020-12-22'),
(9, 9, 78000, '2023-04-30'),
(10, 10, 46000, '2022-08-14'),
(11, 11, 58000, '2021-01-15'),
(12, 12, 39000, '2020-03-20'),
(13, 13, 47000, '2022-05-10'),
(14, 14, 35000, '2023-02-28'),
(15, 15, 81000, '2019-11-12'),
(16, 16, 41000, '2022-06-18'),
(17, 17, 62000, '2021-09-05'),
(18, 18, 33000, '2020-12-22'),
(19, 19, 78000, '2023-04-30'),
(20, 20, 46000, '2022-08-14');

INSERT INTO performance_reviews (review_id, emp_id, review_year, rating) VALUES
(1, 1, '2021-12-31', 4.2),
(2, 2, '2020-12-31', 3.9),
(3, 3, '2022-12-31', 4.0),
(4, 4, '2022-12-31', 3.8),
(5, 5, '2019-12-31', 4.6),
(6, 6, '2022-12-31', 4.1),
(7, 7, '2021-12-31', 4.3),
(8, 8, '2020-12-31', 3.7),
(9, 9, '2022-12-31', 4.5),
(10, 10, '2022-12-31', 4.0),
(11, 11, '2021-12-31', 4.2),
(12, 12, '2020-12-31', 3.9),
(13, 13, '2022-12-31', 4.0),
(14, 14, '2022-12-31', 3.8),
(15, 15, '2019-12-31', 4.6),
(16, 16, '2022-12-31', 4.1),
(17, 17, '2021-12-31', 4.3),
(18, 18, '2020-12-31', 3.7),
(19, 19, '2022-12-31', 4.5),
(20, 20, '2022-12-31', 4.0);

-- 1. Departments
BULK INSERT department
FROM 'C:\Users\Administrator\Downloads\department.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- 2. Locations
BULK INSERT location
FROM 'C:\Users\Administrator\Downloads\location.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- 3. Job Roles
BULK INSERT job_role
FROM 'C:\Users\Administrator\Downloads\job_role.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- 4. Employees
BULK INSERT employees
FROM 'C:\Users\Administrator\Downloads\employees.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- 5. Salaries
BULK INSERT salaries
FROM 'C:\Users\Administrator\Downloads\salaries.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- 6. Performance Reviews
BULK INSERT performance_reviews
FROM 'C:\Users\Administrator\Downloads\performance_reviews.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


------------------------Performance Analysis---------------------------------
--1
SELECT TOP 10 e.emp_id, e.emp_name, e.dept_id, e.role_id, e.location_id,
       p.review_year, p.rating
FROM performance_reviews p
JOIN employees e ON p.emp_id = e.emp_id
ORDER BY p.rating DESC;

--2 average rating per department
SELECT d.dept_name, 
       AVG(p.rating) AS avg_rating
FROM performance_reviews p
JOIN employees e ON p.emp_id = e.emp_id
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY avg_rating DESC;

--3 employees eligible for promotion(rating > 4 and 2 + years)
SELECT TOP 3 
       e.emp_id,
       e.emp_name,
       e.dept_id,
       e.role_id,
       e.location_id,
       e.join_date,
       DATEDIFF(year, e.join_date, GETDATE()) AS years_worked,
       p.rating
FROM employees e
JOIN performance_reviews p ON e.emp_id = p.emp_id
WHERE p.rating > 4
  AND DATEDIFF(year, e.join_date, GETDATE()) >= 2
ORDER BY p.rating DESC;

--4 performance trend over year
SELECT YEAR(p.review_year) AS review_year,
       AVG(p.rating) AS avg_rating,
       COUNT(p.emp_id) AS num_employees
FROM performance_reviews p
GROUP BY YEAR(p.review_year)
ORDER BY review_year ASC;

-------------------Salary Analytics----------------------
--5. salary distribution per department
SELECT d.dept_name,
       COUNT(s.salary) AS num_employees,
       AVG(s.salary) AS avg_salary,
       MIN(s.salary) AS min_salary,
       MAX(s.salary) AS max_salary
FROM salaries s
JOIN employees e ON s.emp_id = e.emp_id
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY avg_salary DESC;

--6. highest and lowest salary per role

SELECT r.role_name,
       COUNT(s.salary) AS num_employees,
       MIN(s.salary) AS min_salary,
       MAX(s.salary) AS max_salary,
       AVG(s.salary) AS avg_salary
FROM salaries s
JOIN employees e ON s.emp_id = e.emp_id
JOIN job_role r ON e.role_id = r.role_id
GROUP BY r.role_name
ORDER BY max_salary DESC;

--7. salary vs performance correlation
SELECT e.emp_id,
       e.emp_name,
       s.salary,
       p.rating,
       e.dept_id,
       e.role_id,
       e.location_id
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
JOIN performance_reviews p ON e.emp_id = p.emp_id
ORDER BY s.salary DESC;

--8. employees below department average salary
SELECT e.emp_id,
       e.emp_name,
       d.dept_name,
       s.salary,
       dept_avg.avg_salary AS dept_avg_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
JOIN department d ON e.dept_id = d.dept_id
JOIN (
    -- Subquery: average salary per department
    SELECT e.dept_id, AVG(s.salary) AS avg_salary
    FROM employees e
    JOIN salaries s ON e.emp_id = s.emp_id
    GROUP BY e.dept_id
) AS dept_avg ON e.dept_id = dept_avg.dept_id
WHERE s.salary < dept_avg.avg_salary
ORDER BY dept_name, salary ASC;

--------------------Department Growth------------------------
--9.hiring trend per year 
SELECT YEAR(join_date) AS hire_year,
       COUNT(emp_id) AS num_hired
FROM employees
GROUP BY YEAR(join_date)
ORDER BY hire_year ASC;

--10. headcount growth by department
SELECT d.dept_name,
       YEAR(e.join_date) AS year_joined,
       COUNT(e.emp_id) AS headcount
FROM employees e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name, YEAR(e.join_date)
ORDER BY d.dept_name, year_joined ASC;

--11. attrition rate by department
SELECT 
    d.dept_name,
    COUNT(CASE WHEN e.status <> 'Active' THEN 1 END) AS num_left,
    COUNT(e.emp_id) AS total_employees,
    CAST(COUNT(CASE WHEN e.status <> 'Active' THEN 1 END) * 100.0 / COUNT(e.emp_id) AS DECIMAL(5,2)) AS attrition_rate_percent
FROM employees e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY attrition_rate_percent DESC;

-----------------------Strategic Insights---------------------------
--12.Employees over due for promotion
SELECT e.emp_id,
       e.emp_name,
       e.dept_id,
       e.role_id,
       e.join_date,
       DATEDIFF(year, e.join_date, GETDATE()) AS years_worked,
       p.rating
FROM employees e
JOIN performance_reviews p ON e.emp_id = p.emp_id
WHERE p.rating > 4
  AND DATEDIFF(year, e.join_date, GETDATE()) >= 3
ORDER BY p.rating DESC;

--13.high salary but low performance
SELECT e.emp_id,
       e.emp_name,
       s.salary,
       p.rating,
       e.dept_id,
       e.role_id
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
JOIN performance_reviews p ON e.emp_id = p.emp_id
WHERE s.salary > (SELECT AVG(salary) FROM salaries)
  AND p.rating < 3.5
ORDER BY s.salary DESC;

--16.Location-wise salary comparison
SELECT l.location_name,
       COUNT(e.emp_id) AS num_employees,
       AVG(s.salary) AS avg_salary,
       MIN(s.salary) AS min_salary,
       MAX(s.salary) AS max_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
JOIN location l ON e.location_id = l.location_id
GROUP BY l.location_name
ORDER BY avg_salary DESC;

--17.gender diversity ratio(if added)
SELECT d.dept_name,
       SUM(CASE WHEN e.gender='Male' THEN 1 ELSE 0 END) AS num_male,
       SUM(CASE WHEN e.gender='Female' THEN 1 ELSE 0 END) AS num_female,
       COUNT(e.emp_id) AS total_employees,
       CAST(SUM(CASE WHEN e.gender='Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(e.emp_id) AS DECIMAL(5,2)) AS female_percentage
FROM employees e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY female_percentage DESC;

--18. median salary calculation
SELECT DISTINCT
       d.dept_name,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY s.salary) 
           OVER (PARTITION BY d.dept_name) AS median_salary
FROM salaries s
JOIN employees e ON s.emp_id = e.emp_id
JOIN department d ON e.dept_id = d.dept_id
ORDER BY d.dept_name;

--19.employees with multiple promotions
SELECT e.emp_id,
       e.emp_name,
       e.dept_id,
       e.role_id,
       e.join_date,
       DATEDIFF(year, e.join_date, GETDATE()) AS years_worked,
       p.rating
FROM employees e
JOIN performance_reviews p ON e.emp_id = p.emp_id
WHERE p.rating >= 4.5
  AND DATEDIFF(year, e.join_date, GETDATE()) >= 3
ORDER BY p.rating DESC, years_worked DESC;

--20.identify leadership pipeline candidates
SELECT e.emp_id,
       e.emp_name,
       e.dept_id,
       e.role_id,
       j.role_name,
       p.rating,
       s.salary,
       DATEDIFF(year, e.join_date, GETDATE()) AS years_worked
FROM employees e
JOIN performance_reviews p ON e.emp_id = p.emp_id
JOIN salaries s ON e.emp_id = s.emp_id
JOIN job_role j ON e.role_id = j.role_id
WHERE p.rating >= 4.5
  AND DATEDIFF(year, e.join_date, GETDATE()) >= 2
  AND j.role_name LIKE '%Manager%' OR j.role_name LIKE '%Lead%'
ORDER BY p.rating DESC, years_worked DESC;
