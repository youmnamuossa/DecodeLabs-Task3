-- Question_1: Key Sales Metrics
SELECT 
    COUNT(OrderID) AS Total_Transactions,
    SUM(TotalPrice) AS Gross_Revenue,
    ROUND(AVG(TotalPrice), 2) AS Avg_Value
FROM dbo.Dataset;

--------------------------------------------------------
-------------------------------------------------------
-- Question_2: Product Performance
SELECT 
    Product, 
    SUM(Quantity) AS Total_Units_Sold, 
    SUM(TotalPrice) AS Total_Revenue
FROM dbo.Dataset
GROUP BY Product
ORDER BY Total_Revenue DESC;

---------------------------------------------------------------
---------------------------------------------------------------
-- Question_3: Marketing Channel ROI
SELECT 
    ReferralSource, 
    COUNT(OrderID) AS Total_Orders,
    ROUND(AVG(UnitPrice), 2) AS Avg_Unit_Price,
    SUM(TotalPrice) AS Total_Revenue
FROM dbo.Dataset
GROUP BY ReferralSource
ORDER BY Total_Orders DESC;
------------------------------------------------------------------------
------------------------------------------------------------------------
-- Question_4: Order Status Breakdown
SELECT 
    OrderStatus, 
    COUNT(OrderID) AS Order_Count
FROM dbo.Dataset
GROUP BY OrderStatus
ORDER BY Order_Count DESC;

------------------------------------------------------------------------------------------
-----------------------------------------------------------------------
-- Question_5: Top 5 High-Value Orders
SELECT TOP 5
    OrderID, CustomerID, Product, TotalPrice, OrderStatus
FROM dbo.Dataset
WHERE TotalPrice > 2000 AND OrderStatus IN ('Shipped', 'Delivered')
ORDER BY TotalPrice DESC;