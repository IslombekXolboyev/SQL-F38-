--1
select top (5) EmployeeID, FirstName, LastName, DepartmentName, Salary, HireDate, Age, Email, Country
from Employees;
--2
select distinct Category
from Products;
--3
select * from Products
where Price > 100;
--4
select * from Customers
where FirstName like 'A%';
--5
select * from Products
order by Price asc;
--6
select * from Employees
where Salary >= 60000 and DepartmentName = 'HR';
--7
select 
	EmployeeID, 
	FirstName, 
	LastName, 
	DepartmentName, 
	Salary,
	HireDate, 
	Age, 
	ISNULL(Email, 'noemail@example.com') as Email,
	Country
from Employees;
--8
select * from Products
where Price between 50 and 100;
--9
select distinct Category, ProductName
from Products;
--10
select distinct Category, ProductName
from Products
order by ProductName desc;
--11
select top (10) ProductID, ProductName, Price, Category, StockQuantity
from Products
order by Price desc;
--12
select 
	EmployeeID,
	coalesce(FirstName, LastName) as FirstnonNullName
from Employees;
--13
select distinct Category, Price
from Products;
--14
select
	EmployeeID, 
	FirstName, 
	LastName, 
	DepartmentName, 
	Salary,
	HireDate, 
	Age, 
	Email,
	Country
from Employees
where (Age between 30 and 40)
	or DepartmentName = 'Marketing';
--15
select * from Employees
order by Salary desc
offset 10 rows fetch next 10 rows only;
--16
select * from Products
where Price <= 1000 and StockQuantity > 50
order by StockQuantity asc;
--17
select * from Products
where ProductName like '%e%';
--18
select * from Employees
where DepartmentName in ('HR', 'IT', 'Finance');
--19
select * from Customers
order by City asc, PostalCode desc;
--20
select top (5) SaleID, ProductID, CustomerID, SaleDate, SaleAmount
from Sales
order by SaleAmount desc;
--21
select CONCAT(FirstName, ' ', LastName) as FullName
from Employees;
--22
select distinct Category, ProductName, Price
from Products
where Price > 50;
--23
select * from Products
where Price < 0.1 * (select avg(Price) from Products);
--24
select * from Employees
where Age < 30 and DepartmentName in ('HR', 'IT');
--25
select * from Employees
where Email like '%@gmail.com';
--26
select * from Employees
where Salary > all (select Salary from Employees 
					where DepartmentName = 'Sales');
--27
select * from Orders
where OrderDate between DATEADD(DAY, -180, GETDATE()) and GETDATE();
