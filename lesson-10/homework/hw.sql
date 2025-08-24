--1
SELECT 
	e.Name,
	e.Salary,
	d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000;

--2
SELECT
	c.FirstName,
	c.LastName,
	o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
	WHERE o.OrderDate BETWEEN '2023-01-01' AND '2023-12-31';

--3
SELECT
	e.Name,
	d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

--4
SELECT 
	s.SupplierName,
	p.ProductName
FROM Suppliers s
LEFT JOIN Products p ON s.SupplierID = p.SupplierID;

--5
SELECT
	o.OrderID,
	o.OrderDate,
	p.PaymentDate,
	p.Amount
FROM Orders o
FULL OUTER JOIN Payments p ON o.OrderID = p.OrderID;

--6
SELECT 
	e.Name AS EmployeeName,
	m.Name AS ManagerName
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID;

--7
SELECT 
	s.Name,
	c.CourseName
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
	WHERE c.CourseName = 'Math 101';

--8
SELECT
	c.FirstName,
	c.LastName,
	o.Quantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.Quantity > 3;

--9
SELECT
	e.Name,
	d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
	WHERE d.DepartmentName = 'Human Resources';

--10
SELECT
	d.DepartmentName,
	COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

--11
SELECT 
	p.ProductID,
	p.ProductName
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
	WHERE s.ProductID IS NULL;

--12
SELECT DISTINCT
	c.FirstName,
	c.LastName,
	o.Quantity AS TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.Quantity >= 1;

--13
SELECT
	e.Name,
	d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID =d.DepartmentID;

--14
SELECT 
	e.Name AS Employee1,
	m.Name AS Employee2,
	e.ManagerID
FROM Employees e
JOIN Employees m ON e.ManagerID = m.ManagerID AND e.EmployeeID < m.EmployeeID;

--15
SELECT 
	o.OrderID,
	o.OrderDate,
	c.FirstName,
	c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = '2022';

--16
SELECT
	e.Name AS EmployeeName,
	e.Salary,
	d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
	WHERE d.DepartmentName = 'Sales' AND e.Salary > 60000;

--17
SELECT 
	o.OrderID,
	o.OrderDate,
	p.PaymentDate,
	p.Amount
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID;

--18
SELECT
	p.ProductID,
	p.ProductName
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
	WHERE o.OrderID IS NULL;

--19
SELECT
	e.Name,
	e.Salary
FROM Employees e
WHERE e.Salary > 
	(
	SELECT AVG(e2.Salary)
	FROM Employees e2
	WHERE e2.DepartmentID = e.DepartmentID
	);

--20
SELECT
	o.OrderID,
	o.OrderDate,
	p.PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
	WHERE p.PaymentID IS NULL AND YEAR(o.OrderDate) < 2020;

--21
SELECT 
	p.ProductID,
	p.ProductName,
	c.CategoryID
FROM Products p
LEFT JOIN Categories c ON p.Category = c.CategoryID
	AND c.CategoryID IS NULL

--22
SELECT 
	e.Name AS Employee1,
	m.Name AS Employee2,
	e.ManagerID,
	e.Salary
FROM Employees e
JOIN Employees m ON e.ManagerID = m.ManagerID AND e.EmployeeID < m.EmployeeID AND e.Salary > 60000;

--23
SELECT 
	e.Name,
	d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
	AND d.DepartmentName LIKE 'M%';

--24
SELECT
	s.SaleID,
	p.ProductName,
	s.SaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
	AND s.SaleAmount > 500;

--25
SELECT 
	s.StudentID,
	s.Name
FROM Students s
WHERE NOT EXISTS (
	SELECT 1
	FROM Enrollments e
	JOIN Courses c ON e.CourseID = c.CourseID
	WHERE e.StudentID = s.StudentID AND c.CourseName = 'Math 101' 
);

--26
SELECT
	o.OrderID,
	o.OrderDate,
	p.PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;

--27
SELECT
	p.ProductID,
	p.ProductName,
	c.CategoryName
FROM Products p
JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName = 'Electronics' OR c.CategoryName = 'Furniture';
