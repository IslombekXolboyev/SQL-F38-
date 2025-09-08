
--Easy Tasks

--1
select CONCAT('100', '-', 'Steven', ' ', 'King') as Employee_Info
from Employees
where EMPLOYEE_ID = '100' and FIRST_NAME = 'Steven' and LAST_NAME = 'King';

--2
update Employees
set PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124', '999')
where PHONE_NUMBER like '%124%';

--3
select
	FIRST_NAME as First_name,
	LEN(FIRST_NAME) as Len_firstname
from Employees
where LEFT(FIRST_NAME, 1) in ('A', 'J', 'M')
order byFirst_name;

--4
select 
	MANAGER_ID,
	sum(SALARY) as Total_Salary
from Employees
group by MANAGER_ID;

--5
select
	year1,
	GREATEST(Max1, Max2, Max3) as Highest_Value
from TestMax;

--6
select *
from cinema
where id%2 = 1 and description <> 'boring';

--7
select * from SingleOrder
order by case when Id = 0 then 1 else 0 end, Id;

--8
select
	coalesce(ssn, passportid, itin) as FirstNonNullValue
from person;

--Medium Tasks

--1
select 
	FullName,
	PARSENAME(REPLACE(FullName, ' ', '.'), 3) as FirstName,
	PARSENAME(REPLACE(FullName, ' ', '.'), 2) as FirstName,
	PARSENAME(REPLACE(FullName, ' ', '.'), 1) as FirstName
from Students;

--2
select * from Orders
where CustomerID in (select CustomerID from Orders where DeliveryState = 'CA') and DeliveryState = 'TX';

--3
select
	STRING_AGG(String, ' ') as Concatenated
from DMLTable;

--4
select
	CONCAT(FIRST_NAME, ' ', LAST_NAME) as ConcateName
from Employees
where (LEN(lower(CONCAT(FIRST_NAME, ' ', LAST_NAME))) - LEN(REPLACE(LOWER(CONCAT(FIRST_NAME, ' ', LAST_NAME)), 'a', ''))) >=3; 

--5
select 
	DEPARTMENT_ID,
	count(EMPLOYEE_ID) as Total_number_employees,
	100*sum(case when DATEDIFF(year, HIRE_DATE, GETDATE()) > 3 then 1 else 0 end)/count(EMPLOYEE_ID) as Percentage
from Employees
group by DEPARTMENT_ID;

--6
select p1.SpacemanID, p1.JobDescription, p1.MissionCount
from Personal p1
join (
select JobDescription,
  max(MissionCount) as MaxMission,
  MIn(MissionCount) as MinMission 
  from Personal
  group by JobDescription 
  ) p2 
 on p1.JobDescription=p2.JobDescription
 and (p1.MissionCount=p2.MaxMission or p1.MissionCount=p2.MinMission);

--Difficult Tasks

--1
DECLARE @str VARCHAR(50) = 'tf56sd#%OqH';
SELECT CONCAT(
        CASE WHEN ASCII(SUBSTRING(@str,1,1)) BETWEEN 65 AND 90 THEN SUBSTRING(@str,1,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,2,1)) BETWEEN 65 AND 90 THEN SUBSTRING(@str,2,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,3,1)) BETWEEN 65 AND 90 THEN SUBSTRING(@str,3,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,4,1)) BETWEEN 65 AND 90 THEN SUBSTRING(@str,4,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,5,1)) BETWEEN 65 AND 90 THEN SUBSTRING(@str,5,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,6,1)) BETWEEN 65 AND 90 THEN SUBSTRING(@str,6,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,7,1)) BETWEEN 65 AND 90 THEN SUBSTRING(@str,7,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,8,1)) BETWEEN 65 AND 90 THEN SUBSTRING(@str,8,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,9,1)) BETWEEN 65 AND 90 THEN SUBSTRING(@str,9,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,10,1)) BETWEEN 65 AND 90 THEN SUBSTRING(@str,10,1) ELSE '' END
    ) AS UppercaseLetters,
CONCAT(
        CASE WHEN ASCII(SUBSTRING(@str,1,1)) BETWEEN 97 AND 122 THEN SUBSTRING(@str,1,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,2,1)) BETWEEN 97 AND 122 THEN SUBSTRING(@str,2,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,3,1)) BETWEEN 97 AND 122 THEN SUBSTRING(@str,3,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,4,1)) BETWEEN 97 AND 122 THEN SUBSTRING(@str,4,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,5,1)) BETWEEN 97 AND 122 THEN SUBSTRING(@str,5,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,6,1)) BETWEEN 97 AND 122 THEN SUBSTRING(@str,6,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,7,1)) BETWEEN 97 AND 122 THEN SUBSTRING(@str,7,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,8,1)) BETWEEN 97 AND 122 THEN SUBSTRING(@str,8,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,9,1)) BETWEEN 97 AND 122 THEN SUBSTRING(@str,9,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,10,1)) BETWEEN 97 AND 122 THEN SUBSTRING(@str,10,1) ELSE '' END
    ) AS LowercaseLetters,
CONCAT(
        CASE WHEN ASCII(SUBSTRING(@str,1,1)) BETWEEN 48 AND 57 THEN SUBSTRING(@str,1,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,2,1)) BETWEEN 48 AND 57 THEN SUBSTRING(@str,2,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,3,1)) BETWEEN 48 AND 57 THEN SUBSTRING(@str,3,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,4,1)) BETWEEN 48 AND 57 THEN SUBSTRING(@str,4,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,5,1)) BETWEEN 48 AND 57 THEN SUBSTRING(@str,5,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,6,1)) BETWEEN 48 AND 57 THEN SUBSTRING(@str,6,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,7,1)) BETWEEN 48 AND 57 THEN SUBSTRING(@str,7,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,8,1)) BETWEEN 48 AND 57 THEN SUBSTRING(@str,8,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,9,1)) BETWEEN 48 AND 57 THEN SUBSTRING(@str,9,1) ELSE '' END,
        CASE WHEN ASCII(SUBSTRING(@str,10,1)) BETWEEN 48 AND 57 THEN SUBSTRING(@str,10,1) ELSE '' END
    ) AS Numbers,
CONCAT(
        CASE WHEN NOT (
                     ASCII(SUBSTRING(@str,1,1)) BETWEEN 48 AND 57 OR
                     ASCII(SUBSTRING(@str,1,1)) BETWEEN 65 AND 90 OR
                     ASCII(SUBSTRING(@str,1,1)) BETWEEN 97 AND 122
                 ) THEN SUBSTRING(@str,1,1) ELSE '' END,
        CASE WHEN NOT (
                     ASCII(SUBSTRING(@str,2,1)) BETWEEN 48 AND 57 OR
                     ASCII(SUBSTRING(@str,2,1)) BETWEEN 65 AND 90 OR
                     ASCII(SUBSTRING(@str,2,1)) BETWEEN 97 AND 122
                 ) THEN SUBSTRING(@str,2,1) ELSE '' END,
        CASE WHEN NOT (
                     ASCII(SUBSTRING(@str,3,1)) BETWEEN 48 AND 57 OR
                     ASCII(SUBSTRING(@str,3,1)) BETWEEN 65 AND 90 OR
                     ASCII(SUBSTRING(@str,3,1)) BETWEEN 97 AND 122
                 ) THEN SUBSTRING(@str,3,1) ELSE '' END,
        CASE WHEN NOT (
                     ASCII(SUBSTRING(@str,4,1)) BETWEEN 48 AND 57 OR
                     ASCII(SUBSTRING(@str,4,1)) BETWEEN 65 AND 90 OR
                     ASCII(SUBSTRING(@str,4,1)) BETWEEN 97 AND 122
                 ) THEN SUBSTRING(@str,4,1) ELSE '' END,
        CASE WHEN NOT (
                     ASCII(SUBSTRING(@str,5,1)) BETWEEN 48 AND 57 OR
                     ASCII(SUBSTRING(@str,5,1)) BETWEEN 65 AND 90 OR
                     ASCII(SUBSTRING(@str,5,1)) BETWEEN 97 AND 122
                 ) THEN SUBSTRING(@str,5,1) ELSE '' END,
        CASE WHEN NOT (
                     ASCII(SUBSTRING(@str,6,1)) BETWEEN 48 AND 57 OR
                     ASCII(SUBSTRING(@str,6,1)) BETWEEN 65 AND 90 OR
                     ASCII(SUBSTRING(@str,6,1)) BETWEEN 97 AND 122
                 ) THEN SUBSTRING(@str,6,1) ELSE '' END,
        CASE WHEN NOT (
                     ASCII(SUBSTRING(@str,7,1)) BETWEEN 48 AND 57 OR
                     ASCII(SUBSTRING(@str,7,1)) BETWEEN 65 AND 90 OR
                     ASCII(SUBSTRING(@str,7,1)) BETWEEN 97 AND 122
                 ) THEN SUBSTRING(@str,7,1) ELSE '' END,
        CASE WHEN NOT (
                     ASCII(SUBSTRING(@str,8,1)) BETWEEN 48 AND 57 OR
                     ASCII(SUBSTRING(@str,8,1)) BETWEEN 65 AND 90 OR
                     ASCII(SUBSTRING(@str,8,1)) BETWEEN 97 AND 122
                 ) THEN SUBSTRING(@str,8,1) ELSE '' END,
        CASE WHEN NOT (
                     ASCII(SUBSTRING(@str,9,1)) BETWEEN 48 AND 57 OR
                     ASCII(SUBSTRING(@str,9,1)) BETWEEN 65 AND 90 OR
                     ASCII(SUBSTRING(@str,9,1)) BETWEEN 97 AND 122
                 ) THEN SUBSTRING(@str,9,1) ELSE '' END,
        CASE WHEN NOT (
                     ASCII(SUBSTRING(@str,10,1)) BETWEEN 48 AND 57 OR
                     ASCII(SUBSTRING(@str,10,1)) BETWEEN 65 AND 90 OR
                     ASCII(SUBSTRING(@str,10,1)) BETWEEN 97 AND 122
                 ) THEN SUBSTRING(@str,10,1) ELSE '' END
) AS OtherCharacters;

--2
select
	StudentID,
	Grade,
	sum(Grade) over (order by studentid) as RunningTotal
from Students;

--3
select
	Equation,
	(
	select sum(CAST(value as int))
	from string_split(Equation, '+')
	) as Result
from Equations;

--4
select 
	Birthday,
	count(*) as NumStudents
from Student
group by Birthday
having count(*) > 1;

--5
select * from PlayerScores
SELECT 
    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END AS Player1,
    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END AS Player2,
    SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY 
    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END,
    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END;
