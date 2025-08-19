--1
SELECT Category,
	COUNT(ProductID) AS NumberofProducts	
FROM Products
GROUP BY Category;
--2
SELECT Category,
	AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category
HAVING Category = 'Electronics';
--3
SELECT *
FROM Customers
WHERE City LIKE 'L%';
--4
SELECT *
FROM Products
WHERE ProductName LIKE '%er';
--5
SELECT *
FROM Customers
WHERE Country LIKE '%a';
--6
SELECT	MAX(Price) AS 'HighestPrice'
FROM Products;
--7
SELECT *,
	CASE
		WHEN StockQuantity < 30 THEN 'LowStock'
		ELSE 'Sufficient'
	END AS 'Status'
FROM Products;
--8
SELECT Country,
	COUNT(CustomerID) AS TotalNumberCustomers
FROM Customers
GROUP BY Country;
--9
SELECT 
	MIN(Quantity) AS MinimumQuantity,
	MAX(Quantity) AS MaximumQuantity
FROM Orders;
--10
SELECT DISTINCT o.CustomerID
FROM Orders o
LEFT JOIN Invoices i on o.CustomerID = i.CustomerID
WHERE OrderDate >= '2023-01-01' AND OrderDate < '2023-02-01' AND InvoiceID IS NULL;
--11
SELECT ProductName
FROM Products
UNION ALL
SELECT ProductName
FROM Products_Discounted;
--12
SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted;
--13
SELECT 
	YEAR(OrderDate) AS OrderYear,
	AVG(TotalAmount) AS AverageAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
--14
SELECT ProductName,
	CASE
		WHEN Price < 100 THEN 'Low'
		WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
		ELSE 'High'
	END AS Status
FROM Products;
--15
SELECT district_name, [2012], [2013]
FROM city_population
PIVOT 
	(SUM(population) FOR year in ([2012], [2013])
	) AS PivotTable;
--16
SELECT ProductID,
	SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;
--17
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';
--18
SELECT year, [Bektemir], [Chilonzor], [Yakkasaroy] INTO Population_Each_City
FROM city_population
PIVOT
	(SUM(population) FOR district_name in ([Bektemir], [Chilonzor], [Yakkasaroy])
	) AS PivotTable;
--19
SELECT TOP 3 CustomerID,
	SUM(TotalAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;
--20
SELECT *
FROM Population_Each_City
SELECT year, district_name, Population 
FROM Population_Each_City
UNPIVOT 
	(
		Population FOR district_name in ([Bektemir], [Chilonzor], [Yakkasaroy])
	) AS UnpivotTable;

--21
select * from Products
select * from Sales

SELECT p.ProductName,
	COUNT(s.SaleID) AS TimeSold
FROM Products p
JOIN Sales s
	ON p.ProductID = s.ProductID
GROUP BY p.ProductName;

--22
SELECT year, district_name, Population INTO City_Population
FROM Population_Each_City
UNPIVOT 
	(
		Population FOR district_name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
	) AS UnpivotTable;
