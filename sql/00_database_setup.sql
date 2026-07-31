CREATE DATABASE SalesFMCG
DEFAULT CHARACTER SET utf8mb4;
USE SalesFMCG;
SELECT DATABASE();
CREATE TABLE countries (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(45),
    CountryCode VARCHAR(2)
);
CREATE TABLE cities (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(45),
    Zipcode DECIMAL(5,0),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES countries(CountryID)
);
CREATE TABLE categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(45)
);
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    MiddleInitial VARCHAR(1),
    LastName VARCHAR(45),
    CityID INT,
    Address VARCHAR(90),
    FOREIGN KEY (CityID) REFERENCES cities(CityID)
);
CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    MiddleInitial VARCHAR(1),
    LastName VARCHAR(45),
    BirthDate DATE,
    Gender VARCHAR(10),
    CityID INT,
    HireDate DATE,
    FOREIGN KEY (CityID) REFERENCES cities(CityID)
);
CREATE TABLE products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(45),
    Price DECIMAL(4,0),
    CategoryID INT,
    Class VARCHAR(15),
    ModifyDate DATE,
    Resistant VARCHAR(15),
    IsAllergic VARCHAR(10),
    VitalityDays DECIMAL(3,0),
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);
CREATE TABLE sales (
    SalesID INT PRIMARY KEY,
    SalesPersonID INT,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    Discount DECIMAL(10,2),
    TotalPrice DECIMAL(10,2),
    SalesDate DATETIME,
    TransactionNumber VARCHAR(25),
    FOREIGN KEY (SalesPersonID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);
USE SalesFMCG;

LOAD DATA LOCAL INFILE '/Volumes/DATA/INTERN/Sales of FMCG Stores/countries.csv'
INTO TABLE countries
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
USE SalesFMCG;
SELECT COUNT(*) FROM countries;
USE SalesFMCG;

LOAD DATA LOCAL INFILE '/Volumes/DATA/INTERN/Sales of FMCG Stores/cities.csv'
INTO TABLE cities
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
USE SalesFMCG;

LOAD DATA LOCAL INFILE '/Volumes/DATA/INTERN/Sales of FMCG Stores/categories.csv'
INTO TABLE categories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

USE SalesFMCG;

LOAD DATA LOCAL INFILE '/Volumes/DATA/INTERN/Sales of FMCG Stores/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Volumes/DATA/INTERN/Sales of FMCG Stores/employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Volumes/DATA/INTERN/Sales of FMCG Stores/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Volumes/DATA/INTERN/Sales of FMCG Stores/sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

USE SalesFMCG;
SELECT 'countries' AS TableName, COUNT(*) AS TotalRows FROM countries
UNION ALL
SELECT 'cities', COUNT(*) FROM cities
UNION ALL
SELECT 'categories', COUNT(*) FROM categories
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'employees', COUNT(*) FROM employees
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sales', COUNT(*) FROM sales;

SELECT
    s.TransactionNumber,
    c.FirstName,
    c.LastName,
    p.ProductName,
    s.Quantity,
    s.TotalPrice
FROM sales s
JOIN customers c
    ON s.CustomerID = c.CustomerID
JOIN products p
    ON s.ProductID = p.ProductID
LIMIT 10;