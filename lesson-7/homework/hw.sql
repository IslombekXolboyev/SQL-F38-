--1
SELECT MIN(Price) AS Min_Price FROM Products;
--2
SELECT	MAX(Salary) AS Max_Salary FROM Employees;
--3
SELECT COUNT(*) AS Total_Customers FROM Customers;
--4
SELECT COUNT(DISTINCT Category) AS Unique_Catogories FROM Products;
--5
SELECT ProductID, 
	SUM(SaleAmount) as Total_Sales_ID7
FROM Sales
GROUP BY ProductID
HAVING ProductID = 7;
--6
SELECT AVG(Age) AS Average_Age FROM Employees;
--7
SELECT DepartmentName,
	COUNT(EmployeeID) AS Number_of_Employees
FROM Employees
GROUP BY DepartmentName;
--8
SELECT Category,
	MIN(Price) AS Minimum_Price,
	MAX(Price) AS Maximum_Price
FROM Products
GROUP BY Category;
--9
SELECT CustomerID,
	SUM(SaleAmount) AS Total_Sales
FROM Sales
GROUP BY CustomerID;
--10
SELECT DepartmentName,
	COUNT(EmployeeID) AS Number_of_Employees
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(EmployeeID) > 5;
--11
SELECT ProductID,
	SUM(SaleAmount) AS Total_Sales,
	AVG(SaleAmount) AS Average_Sales
FROM Sales
GROUP BY ProductID;
--12
SELECT DepartmentName, 
	COUNT(EmployeeID) AS Number_Employees
FROM Employees
GROUP BY DepartmentName
HAVING DepartmentName = 'HR';
--13
SELECT DepartmentName,
	MIN(Salary) AS Lowest_Salary,
	MAX(Salary) AS Highest_Salary
FROM Employees
GROUP BY DepartmentName;
--14
SELECT DepartmentName,
	AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY DepartmentName;
--15
SELECT DepartmentName,
	AVG(Salary) AS Average_Salary,
	COUNT(EmployeeID) AS Number_Employees
FROM Employees
GROUP BY DepartmentName;
--16
SELECT Category,
	AVG(Price) AS Average_Price
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;
--17
SELECT 
	YEAR(SaleDate) AS Sales_Year,
	SUM(SaleAmount) AS Total_Sales
FROM Sales
GROUP BY YEAR(SaleDate)
ORDER BY Sales_Year;
--18
SELECT CustomerID,
	COUNT(Quantity) AS Number_Orders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(Quantity) >= 3;
--19
SELECT DepartmentName,
	AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000;
--20
SELECT Category,
	AVG(Price) AS Average_Price
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;
--21
SELECT CustomerID,
	SUM(SaleAmount) AS Total_Sales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500;
--22
SELECT DepartmentName,
	SUM(Salary) AS Total_Salary,
	AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000;
--23
SELECT custid,
	SUM(freight) AS Total_freight
FROM Sales.Orders
GROUP BY custid
HAVING SUM(freight) > 50;
--24
SELECT
	YEAR(OrderDate) AS Sales_Year,
	MONTH(OrderDate) AS Sales_Month,
	SUM(TotalAmount) AS Total_Sales,
	COUNT(Distinct ProductID) AS Number_Products
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(Distinct ProductID) >= 2
ORDER BY Sales_Year, Sales_Month;
--25
SELECT
	YEAR(OrderDate) AS Order_Year,
	MIN(Quantity) AS Minimum_Quantity,
	MAX(Quantity) AS Maximum_Qantity
FROM Orders
GROUP BY YEAR(OrderDate);
