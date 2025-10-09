--1
select *, Right('0' + cast(MONTH(dt) as varchar(50)), 2) as MonthPrefixedWithZero 
from Dates;

--2
select count(distinct id) as Number, rID, sum(MaxVal) as TotalOfMaxVals
from (select id, rID, max(Vals) as MaxVal
from MyTabel
group by id, rID) as a
group by rID;

--3
select * from TestFixLengths
where len(vals) between 6 and 10;

--4
select t.id, t.Item, t.vals
from TestMaximum t
join
(select id, max(vals) as MaxValue from TestMaximum
group by id) as q on t.ID =q.ID and t.Vals = q.MaxValue;

--5
select id, sum(MaxVal) as SumofMax
from (
select distinct id, DetailedNumber, max(Vals) as MaxVal
from SumOfMax
group by id, DetailedNumber) as q
group by Id;

--6
select id, a, b,
	case when a - b <> 0 then a-b
	else 0
	end as OUTPUT
from TheZeroPuzzle;

--7
select sum(QuantitySold*UnitPrice) as TotalRevenue
from Sales;

--8
select avg(UnitPrice) as AverageUnitprice
from Sales;

--9
select count(*) as TotalTransactions
from Sales;

--10
select max(QuantitySold) as HighestUnitssold
from Sales;

--11
select Category, sum(QuantitySold) as TotalUnitsSold
from Sales
group by Category;

--12
select Region,sum(QuantitySold*UnitPrice) as TotalRevenue
from Sales
group by Region;

--13
select top 1 Product, SUM(QuantitySold*UnitPrice) as TotalRevenue
from Sales
group by Product
order by TotalRevenue desc;

--14
select SaleDate, sum(sum(QuantitySold*UnitPrice)) over (order by saledate) as RunningTotal
from Sales
group by SaleDate
ORDER BY SaleDate;

--15
select Category, sum(QuantitySold*UnitPrice) as CategoryRevenue,
cast(sum(QuantitySold*UnitPrice)/(select sum(QuantitySold*UnitPrice) from Sales)*100 as decimal(10,2)) as PercentageOfTotal
from Sales
group by Category;

--17
select s.SaleID, s.Product, s.Category, s.QuantitySold, s.UnitPrice, s.SaleDate, c.CustomerName
from Sales s
join Customers c on s.CustomerID = c.CustomerID;

--18
SELECT 
    C.CustomerID,
    C.CustomerName,
    C.Region
FROM Customers C
LEFT JOIN Sales S
    ON C.CustomerID = S.CustomerID
WHERE S.CustomerID IS NULL;

--19
SELECT 
    C.CustomerName,
    SUM(S.QuantitySold * S.UnitPrice) AS TotalRevenue
FROM Sales S
JOIN Customers C
    ON S.CustomerID = C.CustomerID
GROUP BY C.CustomerName;

--20
SELECT TOP 1 
    C.CustomerName,
    SUM(S.QuantitySold * S.UnitPrice) AS TotalRevenue
FROM Sales S
JOIN Customers C
    ON S.CustomerID = C.CustomerID
GROUP BY C.CustomerName
ORDER BY TotalRevenue DESC;

--21
select c.CustomerName, count(s.SaleID) as TotalSales
from Customers c
left join Sales s on s.CustomerID = c.CustomerID
group by c.CustomerName

--22
SELECT DISTINCT 
    P.ProductName,
    P.Category,
    P.SellingPrice
FROM Products P
JOIN Sales S
    ON P.ProductName = S.Product;

--23
select top 1 ProductName, Category, SellingPrice 
from Products
order by SellingPrice desc;

--24
SELECT 
    P.ProductName,
    P.Category,
    P.SellingPrice
FROM Products P
JOIN (
    SELECT 
        Category,
        AVG(SellingPrice) AS AvgPrice
    FROM Products
    GROUP BY Category
) AS C
    ON P.Category = C.Category
WHERE P.SellingPrice > C.AvgPrice;
