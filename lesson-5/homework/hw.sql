--1
SELECT ProductName AS Name
FROM Products;
--2
SELECT * 
FROM Customers AS Client;
--3
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
--4
SELECT ProductID, ProductName, Price, Category, StockQuantity FROM Products
INTERSECT
SELECT ProductID, ProductName, Price, Category, StockQuantity FROM Products_Discounted;
--5
SELECT DISTINCT FirstName, City
FROM Customers;
--6
SELECT Price,
	case
	when Price > 1000 then 'High'
	else 'Low'
	end as PriceLevel
FROM Products;
--7
SELECT StockQuantity,
	iif(StockQuantity > 100, 'Yes', 'No') AS InStock
FROM Products_Discounted;
--8
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
--9
SELECT * FROM Products
EXCEPT
SELECT * FROM Products_Discounted;
--10
SELECT Price,
	iif(Price > 1000, 'Expensive', 'Affordable') AS PriceLevel
FROM Products;
--11
SELECT * 
FROM Employees
WHERE Age < 25 or Salary > 60000;
--12
UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR' or EmployeeID = 5;
--13
SELECT SaleAmount,
	case
	when SaleAmount > 500 then 'Top Tier'
	when SaleAmount between 200 and 500 then 'Mid Tier'
	else 'LowTier'
	end as SaleAmountLevel
FROM Sales;
--14
SELECT CustomerID FROM Customers
EXCEPT
SELECT CustomerID FROM Sales;
--15
SELECT CustomerID, Quantity,
	case
	when Quantity = 1 then '1%'
	when Quantity between 1 and 3 then '5%' 
	else '7%'
	end as 'DiscountPercentage'
FROM Orders;
