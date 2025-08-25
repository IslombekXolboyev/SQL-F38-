--1
select 
	o.OrderID,
	o.OrderDate,
	c.FirstName,
	c.LastName
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where o.OrderDate > '2022-12-31';

--2
select
	e.Name,
	d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Sales' or d.DepartmentName = 'Marketing';

--3
select
	d.DepartmentName,
	max(e.Salary) as MaxSalary
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName;

--4
select distinct
	c.FirstName,
	c.LastName,
	o.OrderID,
	o.OrderDate
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where c.Country = 'USA' and YEAR(o.OrderDate) = 2023;

--5
select
	c.FirstName,
	count(o.OrderID) as TotalOrders
from Customers c
left join Orders o on c.CustomerID = o.CustomerID
group by c.FirstName;

--6
select
	p.ProductName,
	s.SupplierName
from Products p
join Suppliers s on p.SupplierID = s.SupplierID
where s.SupplierName = 'Gadget Supplies' or s.SupplierName = 'Clothing Mart';

--7
select 
	c.FirstName,
	max(o.OrderDate) as MostRecenrOrderDate
from Customers c
left join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID, c.FirstName;

--8
select 
	c.FirstName as CustomerName,
	o.TotalAmount as OrderTotal
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where o.TotalAmount > 500;

--9
select
	p.ProductName,
	s.SaleDate,
	s.SaleAmount
from Products p
join Sales s on s.ProductID = p.ProductID
where year(s.SaleDate) = 2022 or s.SaleAmount > 400;

--10
select
	p.ProductName,
	SUM(s.SaleAmount) as TotalSalesAmount
from Products p
left join Sales s on p.ProductID = s.ProductID
group by p.ProductName;

--11
select
	e.Name as EmployeeName,
	d.DepartmentName,
	e.Salary
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Human Resources' and e.Salary > 60000;

--12
select 
	p.ProductName,
	s.SaleDate,
	p.StockQuantity
from Products p
join Sales s on p.ProductID = s.ProductID
where year(s.SaleDate) = 2023 and p.StockQuantity > 100;

--13
select
	e.Name as EmployeeName,
	d.DepartmentName,
	e.HireDate
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Sales' or e.HireDate > '2020-12-31';

--14
select
	c.FirstName as CustomerName,
	o.OrderID,
	c.Address,
	o.OrderDate
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where c.Country = 'USA' and c.Address like '[0-9][0-9][0-9][0-9]%';

--15
select
	p.ProductName,
	p.Category,
	s.SaleAmount
from Products p
join Sales s on p.ProductID = s.ProductID
where p.ProductName = 'Electronics' or s.SaleAmount > 350;

--16
select
	c.CategoryName,
	count(p.ProductID) as ProductCount
from Products p
join Categories c on p.Category = c.CategoryName
group by c.CategoryName;

--17
select 
	c.FirstName as CustomerName,
	c.City,
	o.OrderID,
	o.TotalAmount as Amount
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where c.City = 'Los Angeles' and o.TotalAmount > 300;

--18
select
	e.Name as EmployeeName,
	d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName in ('Human Resources', 'Finance') 
	or (
		(len(e.Name) - len(replace(lower(e.Name), 'a', ''))) +
		(len(e.Name) - len(replace(lower(e.Name), 'e', ''))) +
		(len(e.Name) - len(replace(lower(e.Name), 'i', ''))) +
		(len(e.Name) - len(replace(lower(e.Name), 'o', ''))) +
		(len(e.Name) - len(replace(lower(e.Name), 'u', ''))) 
	) >=4;

--19
select
	e.Name as EmployeeName,
	d.DepartmentName,
	e.Salary
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName in ('Sales', 'Marketing') and e.Salary > 60000;
