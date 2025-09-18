--1
CREATE TABLE #MonthlySales (
    ProductID INT,
    TotalQuantity INT,
    TotalRevenue DECIMAL(10,2)
);
INSERT INTO #MonthlySales (ProductID, TotalQuantity, TotalRevenue)
SELECT 
    s.ProductID,
    SUM(s.Quantity) AS TotalQuantity,
    SUM(s.Quantity * p.Price) AS TotalRevenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE MONTH(s.SaleDate) = MONTH(GETDATE())
  AND YEAR(s.SaleDate) = YEAR(GETDATE())
GROUP BY s.ProductID;
SELECT * FROM #MonthlySales;

--2
CREATE VIEW vw_ProductSalesSummary AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    ISNULL(SUM(s.Quantity), 0) AS TotalQuantitySold
FROM Products p
LEFT JOIN Sales s 
    ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;
SELECT * FROM vw_ProductSalesSummary;

--3
CREATE FUNCTION fn_GetTotalRevenueForProduct (@ProductID INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(18,2);

    SELECT @TotalRevenue = SUM(s.Quantity * p.Price)
    FROM Sales s
    INNER JOIN Products p ON s.ProductID = p.ProductID
    WHERE s.ProductID = @ProductID;
	    RETURN ISNULL(@TotalRevenue, 0);
END;
SELECT dbo.fn_GetTotalRevenueForProduct(1) AS TotalRevenue;

--4
CREATE FUNCTION fn_GetSalesByCategory (@Category VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.ProductName,
        ISNULL(SUM(s.Quantity), 0) AS TotalQuantity,
        ISNULL(SUM(s.Quantity * p.Price), 0) AS TotalRevenue
    FROM Products p
    LEFT JOIN Sales s 
        ON p.ProductID = s.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName
);
SELECT * FROM dbo.fn_GetSalesByCategory('Electronics');

--5
CREATE FUNCTION dbo.fn_IsPrime (@Number INT)
RETURNS VARCHAR(3)
AS
BEGIN
    DECLARE @i INT = 2;
    DECLARE @Result VARCHAR(3);
    IF @Number <= 1
    RETURN 'No';
    BEGIN
    IF @Number % @i = 0
    RETURN 'No';
    SET @i = @i + 1;
    END
	RETURN 'Yes';
END;
SELECT dbo.fn_IsPrime(2) AS Result;   -- Yes
SELECT dbo.fn_IsPrime(4) AS Result;   -- No
SELECT dbo.fn_IsPrime(17) AS Result;  -- Yes
SELECT dbo.fn_IsPrime(1) AS Result;   -- No

--7
CREATE FUNCTION getNthHighestSalary(@N INT)
RETURNS INT
AS
BEGIN
    RETURN (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    OFFSET (@N - 1) ROWS FETCH NEXT 1 ROWS ONLY
    );
END;
SELECT getNthHighestSalary AS Result;

--8
create table RequestAccepted (requester_id int, accepter_id int, accept_date date);
INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date)
VALUES (1, 2, '2016/06/03'), (1, 3, '2016/06/08'), (2, 3, '2016/06/08'), (3, 4, '2016/06/09');

SELECT TOP 1
    id,
    COUNT(*) AS num
FROM (
       SELECT requester_id AS id, accepter_id AS friend
    FROM RequestAccepted
    UNION ALL
        SELECT accepter_id AS id, requester_id AS friend
    FROM RequestAccepted
) AS all_friends
GROUP BY id
ORDER BY COUNT(*) DESC;

--9
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);

CREATE VIEW vw_CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    ISNULL(SUM(o.amount), 0) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM Customers c
LEFT JOIN Orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;
SELECT * FROM vw_CustomerOrderSummary;

--10
DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)

SELECT 
    RowNumber,
        MAX(TestCase) OVER (
        ORDER BY RowNumber
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Workflow
FROM Gaps
ORDER BY RowNumber;
