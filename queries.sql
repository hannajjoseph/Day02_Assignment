-- Top 10 Selling Products

SELECT
    p.ProductName,
    SUM(od.Quantity) AS Total_Quantity_Sold
FROM [Order Details] od
JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;


-- Top 10 Customers by Revenue

SELECT
    c.CompanyName,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),2) AS Revenue
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
ORDER BY Revenue DESC
LIMIT 10;


--  Monthly Sales Trends

SELECT
    strftime('%Y-%m', o.OrderDate) AS Month,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),2) AS Sales
FROM Orders o
JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY Month
ORDER BY Month;


-- Best Performing Categories

SELECT
    c.CategoryName,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)),2) AS Revenue
FROM Categories c
JOIN Products p
ON c.CategoryID = p.CategoryID
JOIN [Order Details] od
ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
ORDER BY Revenue DESC;


-- Customer Purchase Frequency

SELECT
    c.CompanyName,
    COUNT(o.OrderID) AS Total_Orders
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
ORDER BY Total_Orders DESC;