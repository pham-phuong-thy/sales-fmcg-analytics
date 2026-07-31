USE SalesFMCG;
CREATE OR REPLACE VIEW vw_sales_detail AS
SELECT
    s.SalesID,
    s.TransactionNumber,
    s.SalesDate,
    YEAR(s.SalesDate) AS SalesYear,
    MONTH(s.SalesDate) AS SalesMonth,
    MONTHNAME(s.SalesDate) AS SalesMonthName,
    QUARTER(s.SalesDate) AS SalesQuarter,
    s.CustomerID,
    s.SalesPersonID,
    s.ProductID,
    p.ProductName,
    c.CategoryName,
    p.Class,
    p.IsAllergic,
    p.VitalityDays,
    p.Price,
    s.Quantity,
    s.Discount,
    p.Price * s.Quantity AS GrossRevenue,
    p.Price * s.Quantity * (1 - s.Discount) AS Revenue
FROM sales s
JOIN products p
    ON s.ProductID = p.ProductID
JOIN categories c
    ON p.CategoryID = c.CategoryID;
CREATE OR REPLACE VIEW vw_sales_detail_clean AS
SELECT
    SalesID,
    REPLACE(TransactionNumber, '\r', '') AS TransactionNumber,
    SalesDate,
    SalesYear,
    SalesMonth,
    SalesMonthName,
    SalesQuarter,
    CustomerID,
    SalesPersonID,
    ProductID,
    ProductName,
    CategoryName,
    Class,
    IsAllergic,
    VitalityDays,
    Price,
    Quantity,
    Discount,
    GrossRevenue,
    Revenue
FROM vw_sales_detail;

SELECT
    TransactionNumber,
    LENGTH(TransactionNumber),
    HEX(TransactionNumber)
FROM vw_sales_detail_clean
LIMIT 5;
SELECT COUNT(*) AS TotalRows
FROM vw_sales_detail_clean;

