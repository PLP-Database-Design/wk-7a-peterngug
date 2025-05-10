Question 1

WITH RECURSIVE SplitProducts AS (
    SELECT 
        OrderID,
        CustomerName,
        TRIM(SUBSTRING_INDEX(Products, ',', 1)) AS Product,
        SUBSTRING(Products, LENGTH(SUBSTRING_INDEX(Products, ',', 1)) + 2) AS RemainingProducts
    FROM ProductDetail

    UNION ALL

    SELECT 
        OrderID,
        CustomerName,
        TRIM(SUBSTRING_INDEX(RemainingProducts, ',', 1)),
        SUBSTRING(RemainingProducts, LENGTH(SUBSTRING_INDEX(RemainingProducts, ',', 1)) + 2)
    FROM SplitProducts
    WHERE RemainingProducts != ''
)
SELECT OrderID, CustomerName, Product
FROM SplitProducts
ORDER BY OrderID;

Question 2
CREATE TABLE Orders AS
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;
