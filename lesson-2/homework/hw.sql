--1
--create table Employees (EmpID int, Name varchar(50), Salary decimal(10,2));
--select * from Employees

--2	single-row
--insert into Employees values (1, 'John', 100.5);
--	multiple-row
--insert into Employees values (2, 'Elena', 90.8), (3, 'Antony', 103.1);

--3
--update Employees set Salary = 7000 where EmpID = 1;

--4
--delete from Employees where EmpID = 2;

--5	DELETE - Removes specific rows from a table using the where clause
--	TRUNCATE - Removes all rows from a table
--	DROP - Deletes the entire table or database

--6
--alter table Employees 
--alter column Name varchar(100);

--7
--alter table Employees add Department varchar(50);

--8
--alter table Employees alter column Salary float;

--9
--create table Departments (DepartmentID int primary key, DepartmentName varchar(50));
--select * from Departments

--10
--TRUNCATE TABLE Employees;

--11
--insert into Departments (DepartmentID, DepartmentName)
--select 1, 'HR' union all
--select 2, 'Finance' union all
--select 3, 'Marketing' union all
--select 4, 'Sales' union all
--select 5, 'Operations';

--12
--update Employees
--set Department = 'Management'
--where Salary > 5000;

--13
--delete from Employees;

--14
--alter table Employees
--drop column Department;

--15
--exec sp_rename 'Employees', 'StaffMembers';

--16
--drop table Departments;

--17
--create table Products (ProductID int primary key, ProductName varchar(100), Category varchar (50), Price decimal(10,2));

--18
--alter table Products add constraint chk_Price check (Price > 0);

--19
--alter table Products add StockQuantity int default 50;

--20
--exec sp_rename 'Products.Category', 'ProductCategory', 'column';

--21
--insert into Products (ProductID, ProductName, ProductCategory, Price)
--values (1, 'Phone', 'Electronics', 900.00), 
--		(2, 'PC', 'Electronics', 1500.00), 
--		(3, 'Chair', 'Furniture', 500.00), 
--		(4, 'Table', 'Furniture', 550.00), 
--		(5, 'Book', 'Stationary', 120.00);

--22
--select * into Products_Backup from Products;

--23
--exec sp_rename 'Products', 'Inventory';

--24
--alter table Inventory alter column Price float;

--25
--alter table Inventory add ProductCode int identity(1000,5);
