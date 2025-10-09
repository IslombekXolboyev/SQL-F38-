--1
select customer_id, customer_name, order_date,
	sum(total_amount) over (partition by customer_id order by order_date) as running_total
from sales_data;

--2
SELECT 
    product_category,
    COUNT(*) AS order_count
FROM sales_data
GROUP BY product_category;

--3
SELECT 
    product_category,
    MAX(total_amount) AS max_sale
FROM sales_data
GROUP BY product_category;

--4
SELECT 
    product_category,
    MIN(unit_price) AS min_price
FROM sales_data
GROUP BY product_category;

--5
SELECT order_date,
    AVG(total_amount) OVER (ORDER BY order_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg
FROM sales_data;

--6
select region, sum(total_amount) as total_sales
from sales_data
group by region;

--7
select customer_id, customer_name, sum(total_amount) as total_spent,
rank() over (order by sum(total_amount) desc) as rank_by_sales
from sales_data
group by customer_id, customer_name;

--8
SELECT 
    customer_id,
    customer_name,
    order_date,
    total_amount,
    total_amount - LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS difference_from_previous
FROM sales_data;

--9
SELECT *
FROM (SELECT product_category, product_name, unit_price,
RANK() OVER (PARTITION BY product_category ORDER BY unit_price DESC) AS price_rank
FROM sales_data
) AS ranked
WHERE price_rank <= 3;

--10
SELECT region, order_date,
SUM(total_amount) OVER (PARTITION BY region ORDER BY order_date) AS cumulative_sales
FROM sales_data;

--11
SELECT
    product_category,
    order_date,
    total_amount,
    SUM(total_amount) OVER (PARTITION BY product_category ORDER BY order_date) AS cumulative_revenue
FROM sales_data
ORDER BY product_category, order_date;

--12
SELECT product_category, SUM(total_amount) AS total_revenue
FROM sales_data
GROUP BY product_category;

--13
SELECT
    sale_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date) AS cumulative_sum
FROM sales_data
ORDER BY order_date;

--14
SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT product_category) AS category_count
FROM sales_data
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT product_category) > 1;

--15
SELECT
    customer_id,
    customer_name,
    region,
    SUM(total_amount) AS total_spent
FROM sales_data
GROUP BY customer_id, customer_name, region
HAVING SUM(total_amount) >
(
    SELECT AVG(total_amount)
    FROM sales_data s2
    WHERE s2.region = sales_data.region
);

--16
SELECT
    customer_id,
    customer_name,
    region,
    SUM(total_amount) AS total_spent,
    RANK() OVER (PARTITION BY region ORDER BY SUM(total_amount) DESC) AS rank_in_region
FROM sales_data
GROUP BY customer_id, customer_name, region;

--17
SELECT
    customer_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS cumulative_sales
FROM sales_data
ORDER BY customer_id, order_date;

--18
WITH MonthlySales AS (
    SELECT 
        FORMAT(order_date, 'yyyy-MM') AS Month,
        SUM(total_amount) AS total_sales
    FROM sales_data GROUP BY FORMAT(order_date, 'yyyy-MM')
)
SELECT 
    Month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY Month) AS previous_month,
    ROUND((total_sales - LAG(total_sales) OVER (ORDER BY Month)) * 100.0 /LAG(total_sales) OVER (ORDER BY Month), 2
    ) AS growth_rate
FROM MonthlySales;

--19
SELECT
    customer_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_amount
FROM sales_data
WHERE total_amount > 
      LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date);

--20
SELECT
    product_name,
    unit_price
FROM sales_data
WHERE unit_price > (SELECT AVG(unit_price) FROM sales_data);

--21
SELECT 
    Id,
    Grp,
    Val1,
    Val2,
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY Grp ORDER BY Id) = 1 
        THEN SUM(Val1 + Val2) OVER (PARTITION BY Grp)
    END AS Tot
FROM MyData;

--22
SELECT 
    ID,
    SUM(Cost) AS Cost,
    SUM(Quantity) AS Quantity
FROM TheSumPuzzle
GROUP BY ID;

--23
WITH Numbered AS (
  SELECT 
      SeatNumber,
      LAG(SeatNumber) OVER (ORDER BY SeatNumber) AS PrevSeat
  FROM Seats
)
SELECT 
    PrevSeat + 1 AS [Gap Start],
    SeatNumber - 1 AS [Gap End]
FROM Numbered
WHERE SeatNumber - PrevSeat > 1;
