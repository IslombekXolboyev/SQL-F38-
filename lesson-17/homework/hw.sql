--1
with DistinctRegions as (
	select distinct Region
	from #RegionSales
),
DistinctDistributors as (
	select distinct Distributor
	from #RegionSales
)
select r.Region, d.Distributor, ISNULL(s.Sales, 0) as Sales
from DistinctRegions r
cross join DistinctDistributors d
left join #RegionSales s on r.Region = s.Region and d.Distributor = s.Distributor
order by r.Region, d.Distributor;

--2
SELECT m.name
FROM Employee e
JOIN Employee m
    ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(*) >= 5;

--3
SELECT p.product_name,
       SUM(o.unit) AS unit
FROM Orders o
JOIN Products p 
    ON o.product_id = p.product_id
WHERE YEAR(o.order_date) = 2020
  AND MONTH(o.order_date) = 2
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;

--4
WITH VendorCounts AS (
    SELECT 
        CustomerID,
        Vendor,
        COUNT(*) AS OrderCount,
        ROW_NUMBER() OVER (PARTITION BY CustomerID 
                           ORDER BY COUNT(*) DESC) AS rn
    FROM Orders
    GROUP BY CustomerID, Vendor
)
SELECT CustomerID, Vendor
FROM VendorCounts
WHERE rn = 1;

--6
WITH LocationCounts AS (
    SELECT 
        Device_id,
        Locations,
        COUNT(*) AS signal_count
    FROM Device
    GROUP BY Device_id, Locations
),
Ranked AS (
    SELECT 
        Device_id,
        Locations,
        signal_count,
        ROW_NUMBER() OVER (
            PARTITION BY Device_id 
            ORDER BY signal_count DESC
        ) AS rn
    FROM LocationCounts
)
SELECT 
    d.Device_id,
    COUNT(DISTINCT d.Locations) AS no_of_location,
    MAX(CASE WHEN r.rn = 1 THEN r.Locations END) AS max_signal_location,
    COUNT(*) AS no_of_signals
FROM Device d
JOIN Ranked r 
    ON d.Device_id = r.Device_id
GROUP BY d.Device_id;

--7
SELECT e.EmpID, e.EmpName, e.Salary
FROM Employee e
JOIN (
    SELECT DeptID, AVG(Salary) AS AvgSalary
    FROM Employee
    GROUP BY DeptID
) d
    ON e.DeptID = d.DeptID
WHERE e.Salary > d.AvgSalary;

--8
WITH TicketMatches AS (
    SELECT 
        t.TicketID,
        COUNT(DISTINCT t.Number) AS total_ticket_numbers,
        COUNT(DISTINCT n.Number) AS matched_numbers
    FROM Tickets t
    LEFT JOIN Numbers n
        ON t.Number = n.Number
    GROUP BY t.TicketID
),
TicketResults AS (
    SELECT 
        TicketID,
        CASE 
            WHEN matched_numbers = (SELECT COUNT(*) FROM Numbers) 
                 AND matched_numbers > 0 
            THEN 100
            WHEN matched_numbers > 0 
                 AND matched_numbers < (SELECT COUNT(*) FROM Numbers) 
            THEN 10
            ELSE 0
        END AS Prize
    FROM TicketMatches
)
SELECT SUM(Prize) AS Total_Winnings
FROM TicketResults;

--9
WITH UserPlatform AS (
    SELECT 
        Spend_date,
        User_id,
        SUM(CASE WHEN Platform = 'Mobile' THEN Amount ELSE 0 END) AS MobileAmount,
        SUM(CASE WHEN Platform = 'Desktop' THEN Amount ELSE 0 END) AS DesktopAmount
    FROM Spending
    GROUP BY Spend_date, User_id
),
UserCategory AS (
    SELECT
        Spend_date,
        User_id,
        CASE 
            WHEN MobileAmount > 0 AND DesktopAmount > 0 THEN 'Both'
            WHEN MobileAmount > 0 THEN 'Mobile'
            WHEN DesktopAmount > 0 THEN 'Desktop'
        END AS Platform,
        (MobileAmount + DesktopAmount) AS TotalAmount
    FROM UserPlatform
)
SELECT
    ROW_NUMBER() OVER (ORDER BY Spend_date, 
                       CASE Platform 
                           WHEN 'Mobile' THEN 1 
                           WHEN 'Desktop' THEN 2 
                           WHEN 'Both' THEN 3 END) AS Row,
    Spend_date,
    Platform,
    SUM(TotalAmount) AS Total_Amount,
    COUNT(DISTINCT User_id) AS Total_users
FROM UserCategory
GROUP BY Spend_date, Platform
ORDER BY Spend_date, Row;

--10
WITH RECURSIVE Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < (SELECT MAX(Quantity) FROM Grouped)
)
SELECT g.Product, 1 AS Quantity
FROM Grouped g
JOIN Numbers n ON n <= g.Quantity
ORDER BY g.Product;
