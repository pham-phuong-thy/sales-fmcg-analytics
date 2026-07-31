USE SalesFMCG;

-- Check TotalPrice
SELECT
    MIN(TotalPrice),
    MAX(TotalPrice),
    AVG(TotalPrice)
FROM sales;

-- Sample Sales
SELECT *
FROM sales
LIMIT 5;

-- Sample Products
SELECT *
FROM products
LIMIT 10;

-- Check Discount
SELECT
    MIN(Discount),
    MAX(Discount),
    AVG(Discount)
FROM sales;

/*
Conclusion

1. TotalPrice = 0
=> Not reliable.

2. Discount ranges from 0 to 0.20
=> Discount is stored as percentage.

Revenue Formula

Price × Quantity × (1-Discount)
*/