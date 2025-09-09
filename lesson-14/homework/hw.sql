--Easy Tasks

--1
select
	SUBSTRING(Name, 1, CHARINDEX(',', Name) - 1) as Name,
	SUBSTRING(Name, CHARINDEX(',', Name) + 1, LEN(Name)) as SurName
from TestMultipleColumns;

--2
select *
from TestPercent
where Strs like '%!%%' escape '!';

--3
select 
	SUBSTRING(Vals, 1, CHARINDEX('.', Vals) - 1) as Value1,
	SUBSTRING(Vals, CHARINDEX('.', Vals) + 1, LEN(Vals)) as Value2
from Splitter;

--4
select 
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	'1234ABC123456XYZ1234567890ADS',
	'0', 'X'),'1', 'X'),'2', 'X'),'3', 'X'), '4', 'X'), '5', 'X'), '6', 'X'), '7', 'X'), '8', 'X'), '9', 'X') as ReplaceString; 

--5
select * 
from testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;

--6
select *,
	LEN(texts) - LEN(REPLACE(texts, ' ', ''))  as SpaceCount
from CountSpaces;

--7
select 
	e.Name as EmployeeName
from Employee e
left join Employee m on e.ManagerId = m.Id
where e.Salary > m.Salary;

--8
select
	EMPLOYEE_ID,
	FIRST_NAME,
	LAST_NAME,
	HIRE_DATE,
	DATEDIFF(YEAR, HIRE_DATE, GETDATE()) as YearsOfService
from Employees
where DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 10 and DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 15;

--Medium Tasks

--1
select 
	REPLACE(REPLACE('rtcfvty34redt', '3', ''), '4', '') as OnlyChars,
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	'rtcfvty34redt', 'r', ''), 't', ''), 'c', ''), 'f', ''), 'v', ''), 'y', ''), 'e', ''), 'd', '') as OnlyInt;

--2
select 
	w1.Id
from weather w1
join weather w2 on DATEDIFF(day, w2.RecordDate, w1.RecordDate) = 1
where w1.Temperature > w2.Temperature;

--3
select 
	player_id,
	min(event_date) as FirstLoginDate
from Activity
group by player_id;

--4
select SUBSTRING(fruit_list,
           CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list) + 1) + 1,
           CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list) + 1) + 1) 
           - (CHARINDEX(',', fruit_list, CHARINDEX(',', fruit_list) + 1) + 1)
       ) AS ThirdFruit
from fruits;

--5
WITH Numbers AS (
    SELECT TOP (LEN('sdgfhsdgfhs@121313131'))
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects
)
SELECT SUBSTRING('sdgfhsdgfhs@121313131', n, 1) AS CharValue
FROM Numbers;

--6
select
	p1.id,
	case when p1.code = 0 then p2.code
	else p1.code
	end as Code
from p1
join p2 on p1.id = p2.id;

--7
select 
	EMPLOYEE_ID,
	FIRST_NAME,
	LAST_NAME,
	HIRE_DATE,
	case when DATEDIFF(year, HIRE_DATE, GETDATE()) < 1 then 'New hire'
		when DATEDIFF(year, HIRE_DATE, GETDATE()) > 1 and DATEDIFF(year, HIRE_DATE, GETDATE()) < 5 then 'Junior'
		when DATEDIFF(year, HIRE_DATE, GETDATE()) > 5 and DATEDIFF(year, HIRE_DATE, GETDATE()) > 10 then 'Mid-level'
		when DATEDIFF(year, HIRE_DATE, GETDATE()) > 10 and DATEDIFF(year, HIRE_DATE, GETDATE()) < 20 then 'Senior'
		else 'Veteran'
		end as Employment_stage
from Employees;

--8
SELECT 
    Vals,
    LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'X') - 1) AS StartingInteger
FROM GetIntegers;

--Difficult Tasks

--1
SELECT 
    STUFF(
        STUFF(vals, 1, CHARINDEX(',', vals), 
              SUBSTRING(vals, CHARINDEX(',', vals) + 1, CHARINDEX(',', vals, CHARINDEX(',', vals) + 1) - CHARINDEX(',', vals))),
        CHARINDEX(',', vals, CHARINDEX(',', vals) + 1),
        CHARINDEX(',', vals) - 1,
        LEFT(vals, CHARINDEX(',', vals) - 1)
    ) AS SwappedValue
FROM MultipleVals;

--2
select 
	player_id,
	min(event_date) as FirstLoginDate
from Activity
group by player_id;

--3
select *
from WeekPercentagePuzzle
