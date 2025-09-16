--Easy Tasks
--1
with Numbers as (
	select 1 as n
	union all
	select n+1
	from Numbers
	where n < 1000
)
select n from Numbers
option (maxrecursion 1000);

--2
select e.EmployeeID, e.FirstName, e.LastName, s.TotalSales
from Employees e
join (
	select EmployeeID, SUM(SalesAmount) as TotalSales
	from Sales group by EmployeeID
	) s
on e.EmployeeID = s.EmployeeID;

--3
select e.EmployeeID, e.FirstName, e.LastName, e2.AvgSalary
from Employees e
join (
	select EmployeeID, AVG(Salary) as AvgSalary
	from Employees group by EmployeeID
	) e2
on e.EmployeeID = e2.EmployeeID;

--4
select p.ProductID, p.ProductName, s.MaxSale
from Products p
join (
	select ProductID, MAX(SalesAmount) as MaxSale 
	from Sales group by ProductID
	) s
on p.ProductID = s.ProductID;

--5
with Numbers as (
	select 1 as n
	union all
	select n*2
	from Numbers
	where n*2 < 1000000
)
select n from Numbers
option (maxrecursion 1000);

--6
with SalesCount as (
	select EmployeeID, COUNT(*) as SaleCount
	from Sales group by EmployeeID
)
select e.EmployeeID, e.FirstName, e.LastName, sc.SaleCount
from Employees e
join SalesCount sc on e.EmployeeID = sc.EmployeeID
where sc.SaleCount > 5;

--7
select * from Products
select * from Sales

WITH ProductSales AS (
    SELECT ProductID,
           SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
)
SELECT p.ProductID,
       p.ProductName,
       ps.TotalSales
FROM Products p
JOIN ProductSales ps
  ON p.ProductID = ps.ProductID
WHERE ps.TotalSales > 500;

--8
with avgsalary as (
	select avg(Salary) as CompanyAvgSalary
	from Employees
)
select e.EmployeeID, e.FirstName, e.LastName, e.Salary
from Employees e
cross join avgsalary a
where e.Salary > a.CompanyAvgSalary;

--Medium Tasks

--1
select e.EmployeeID, e.FirstName, e.LastName
from Employees e
join (
	select EmployeeID, COUNT(*) as OrderCount
	from Sales group by EmployeeID
) s
on e.EmployeeID = s.EmployeeID
order by s.OrderCount desc
offset 0 rows fetch next 5 rows only;

--2
select p.CategoryID, sum(s.TotalSales) as CategorySales
from Products p
join (
	select ProductID, sum(SalesAmount) as TotalSales
	from Sales group by ProductID
) s
on p.ProductID = s.ProductID
group by p.CategoryID;

--3
with cte_factorial as (
	select Number, cast(5 as bigint) as factorial, 5 as step
	from Numbers1 where Number = 5
	union all
	select n.Number, f.factorial * n.Number as factorial, step + 1 
	from Numbers1 n
	join cte_factorial f on n.Number = f.step + 1
)
select Number, factorial
from cte_factorial where Number = step;

--4
with cte_split as (
	select id, 1 as pos, SUBSTRING(String, 1, 1) as ch, String
	from Example
	union all
	select id, pos + 1, SUBSTRING(String, pos + 1, 1), String
	from cte_split where pos + 1 <= len(String)
)
select id, pos, ch
from cte_split order by id, pos
option (maxrecursion 0);

--5
; with monthlySales  as (
	select YEAR(SaleDate) as Saleyear, MONTH(SaleDate) as Salemonth, sum(SalesAmount) as TotalSales
	from Sales group by YEAR(SaleDate), MONTH(SaleDate)
)
select cur.Saleyear, cur.Salemonth, cur.TotalSales
from monthlySales cur
left join monthlySales prev on (prev.Saleyear = cur.Saleyear and prev.Salemonth = cur.Salemonth - 1)
							or (prev.Saleyear = cur.Saleyear - 1 and cur.Salemonth = 1 and prev.Salemonth = 12)
order by cur.Saleyear, cur.Salemonth;

--6
select * from Employees
select * from Sales

select e.EmployeeID, e.FirstName, e.LastName, s.Salesyear, s.SalesQuarter, s.TotalSales
from Employees e
join (
	select EmployeeID, year(SaleDate) as Salesyear, datepart(QUARTER, SaleDate) as SalesQuarter, SUM(SalesAmount) as TotalSales
	from Sales group by EmployeeID, YEAR(SaleDate), datepart(QUARTER, SaleDate)
	having sum(SalesAmount) > 45000
) s
on e.EmployeeID = s.EmployeeID
order by s.Salesyear, s.SalesQuarter, e.FirstName;

--Difficult Tasks

--1
with cte as(
select 1 n, 1 num1, 2 num2
union all
select n+1,num2,num2+num1 from cte where n<12)
select * from cte;

--2
select * from FindSameCharacters
where vals is not null and len(vals)>1 and vals not like '%[^'+LEFT(vals,1)+']%'

--3
with cte as(
select 1 n1,cast('1' as varchar(50)) n2
union all
select n1+1,cast(n2+cast(n1+1 as varchar(50)) as varchar(50)) from cte where n1<5)
select * from cte
order by n1 desc

--4
select e.EmployeeID, e.FirstName, e.LastName
from Employees e
join (
	select EmployeeID, sum(SalesAmount) as TotalSales
	from Sales where SaleDate >= dateadd(MONTH, -6, GETDATE())
	group by EmployeeID
) s
on e.EmployeeID = s.EmployeeID
where s.TotalSales = (select max(TotalSales) 
						from (select EmployeeID, sum(SalesAmount) as TotalSales
								from Sales where SaleDate >= DATEADD(MONTH, -6, GETDATE())
								group by EmployeeID
) x );
