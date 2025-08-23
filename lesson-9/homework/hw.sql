--1
SELECT 
	p.ProductName, 
	s.SupplierName
FROM Products p 
JOIN Suppliers s 
	ON p.SupplierID = s.SupplierID;

--2
SELECT 
	d.DepartmentName,
	e.Name
FROM Departments d
INNER JOIN Employees e
	ON d.DepartmentID = e.DepartmentID;

--3
SELECT
	p.ProductName,
	s.SupplierName
FROM Products p
INNER JOIN Suppliers s
	ON p.SupplierID = s.SupplierID;

--4
SELECT 
	o.OrderID,
	c.FirstName,
	c.LastName
FROM Orders o
JOIN Customers c
	ON o.CustomerID = c.CustomerID;

--5
SELECT 
	s.Name,
	c.CourseName
FROM Students s
CROSS JOIN Courses c;

--6
SELECT 
	p.ProductName, 
	o.OrderID
FROM Products p 
JOIN Orders o 
	ON p.ProductID = o.ProductID;

--7
SELECT 
	e.Name,
	d.DepartmentName
	FROM Departments d
JOIN Employees e
	ON d.DepartmentID = e.DepartmentID;

--8
SELECT
	e.CourseID,
	s.Name
FROM Students s
JOIN Enrollments e
	ON s.StudentID = e.StudentID;

--9
SELECT 
	o.OrderID,
	p.PaymentID,
	p.PaymentMethod,
	p.Amount
FROM Payments p
JOIN Orders o
	ON p.OrderID = o.OrderID;

--10
SELECT 
	o.OrderID,
	p.ProductName,
	p.Price
FROM Orders o
JOIN Products p
	ON o.ProductID = o.ProductID
	WHERE p.Price > 100;

--11
SELECT 
	e.Name,
	d.DepartmentName
FROM Employees e
JOIN Departments d
	ON e.DepartmentID <> d.DepartmentID;

--12
SELECT 
	o.Quantity,
	p.StockQuantity
FROM Orders o
JOIN Products p
	ON o.ProductID = p.ProductID
	WHERE o.Quantity > p.StockQuantity;

--13
SELECT 
	c.FirstName,
	c.LastName,
	s.ProductID,
	s.SaleAmount
FROM Customers c
JOIN Sales s
	ON c.CustomerID = s.CustomerID
	WHERE s.SaleAmount >= 500; 

--14
SELECT
	s.Name,
	c.CourseName
FROM Students s	
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON c.CourseID = e.CourseID;

--15
SELECT
	p.ProductName,
	s.SupplierName
	FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
WHERE s.SupplierName LIKE '%Tech%';

--16
SELECT
	o.OrderID,
	o.TotalAmount,
	p.Amount
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID
WHERE o.TotalAmount > p.Amount;

--17
SELECT
	e.Name,
	d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

--18
SELECT 
	p.ProductName,
	c.CategoryName
FROM Products p
JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName = 'Electronics' OR c.CategoryName = 'Furniture';

--19
SELECT
	s.SaleID,
	c.Country
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';

--20
SELECT
	o.OrderID,
	c.FirstName,
	c.LastName,
	c.Country,
	o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' and o.TotalAmount > 100;

--21
SELECT 
	e1.Name as Employee1,
	e1.DepartmentID as Department1,
	e2.Name as Employee2,
	e2.DepartmentID as Department2
FROM Employees e1
INNER JOIN Employees e2 
	ON e1.EmployeeID < e2.EmployeeID 
	AND e1.DepartmentID <> e2.DepartmentID;

--22
SELECT 
	p.ProductName,
	p1.Amount,
	o.Quantity,
	p.Price,
	(o.Quantity*p.Price) AS Result
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
JOIN Payments p1 ON p1.OrderID = o.OrderID
WHERE p1.Amount <> (o.Quantity*p.Price);

--23
SELECT
	s.Name,
	c.CourseName
FROM Students s
FUll OUTER JOIN Enrollments e ON s.StudentID = e.StudentID
FULL OUTER JOIN Courses c ON c.CourseID = e.CourseID
WHERE c.CourseName is NULL;

--24
SELECT 
	e1.Name AS EmployeeName,
	e1.Salary AS EmployeeSalary,
	e2.Name AS ManagerName,
	e2.Salary AS ManagerSalary
FROM Employees e1
LEFT JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID
WHERE e2.Salary <= e1.Salary;

--25
SELECT DISTINCT
	c.CustomerID,
	c.FirstName,
	c.LastName,
	p.Amount
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON p.OrderID = o.OrderID
WHERE p.OrderID is NULL;
