--1
SELECT 
    SaleID,
    ProductName,
    SaleDate,
    ROW_NUMBER() OVER (ORDER BY SaleDate) AS RowNum
FROM ProductSales;

--2
SELECT 
    ProductName,
    SUM(Quantity) AS TotalQuantity,
    DENSE_RANK() OVER (ORDER BY SUM(Quantity) DESC) AS ProductRank
FROM ProductSales
GROUP BY ProductName;

--3
SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY SaleAmount DESC) AS rn
    FROM ProductSales
) AS t
WHERE rn = 1;

--4
SELECT 
    SaleID,
    SaleAmount,
    LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount
FROM ProductSales;

--5
SELECT 
    SaleID,
    SaleAmount,
    LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PreviousSaleAmount
FROM ProductSales;

--6
SELECT *
FROM (
    SELECT *,LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PrevSale
    FROM ProductSales
) AS t
WHERE SaleAmount > PrevSale;

--7
SELECT 
    ProductName,
    SaleDate,
    SaleAmount,
    SaleAmount - LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS Difference
FROM ProductSales;

--8
SELECT 
    ProductName,
    SaleDate,
    SaleAmount,
    LEAD(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS NextSale,
    ROUND((LEAD(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) - SaleAmount) / SaleAmount * 100, 2
    ) AS PercentChange
FROM ProductSales;

--9
SELECT 
    ProductName,
    SaleDate,
    SaleAmount,
    ROUND(SaleAmount / LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate), 2) AS Ratio
FROM ProductSales;

--10
SELECT 
    ProductName,
    SaleDate,
    SaleAmount,
    SaleAmount - FIRST_VALUE(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS DiffFromFirst
FROM ProductSales;

--11
SELECT ProductName, SaleDate, SaleAmount
FROM (
    SELECT *,LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PrevAmount
    FROM ProductSales
) t
WHERE SaleAmount > PrevAmount;

--12
SELECT 
    ProductName,
    SaleDate,
    SaleAmount,
    SUM(SaleAmount) OVER (ORDER BY SaleDate) AS RunningTotal
FROM ProductSales;

--14
SELECT 
    SaleID,
    ProductName,
    SaleAmount,
    SaleAmount - AVG(SaleAmount) OVER () AS DiffFromAvg
FROM ProductSales;

--15
SELECT 
    Name,
    Department,
    Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees1;

--16
SELECT *
FROM (
    SELECT *, DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RankInDept
    FROM Employees1
) t
WHERE RankInDept <= 2;

--17
SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary ASC) AS rn
    FROM Employees1
) t
WHERE rn = 1;

--18
SELECT 
    Department,
    Name,
    Salary,
    SUM(Salary) OVER (PARTITION BY Department ORDER BY HireDate) AS RunningTotal
FROM Employees1;

--19
SELECT DISTINCT 
    Department,
    SUM(Salary) OVER (PARTITION BY Department) AS TotalSalary
FROM Employees1;

--20
SELECT DISTINCT 
    Department,
    AVG(Salary) OVER (PARTITION BY Department) AS AvgSalary
FROM Employees1;

--21
SELECT 
    Name,
    Department,
    Salary,
    Salary - AVG(Salary) OVER (PARTITION BY Department) AS DiffFromDeptAvg
FROM Employees1;

--22
SELECT 
    Name,
    Department,
    Salary,
    AVG(Salary) OVER (ORDER BY HireDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MovingAvg
FROM Employees1;

--23
SELECT 
    SUM(Salary) OVER (ORDER BY HireDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Last3Sum,
    *
FROM Employees1;
