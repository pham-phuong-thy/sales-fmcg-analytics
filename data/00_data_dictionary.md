# Data Dictionary

## Overview

The FMCG Sales Database contains transactional sales data and supporting dimension tables for analyzing sales performance, product performance, customer behavior, and employee effectiveness.

The database consists of 7 main tables:

- `categories`: Product category information
- `cities`: City-level geographical information
- `countries`: Country-level geographical information
- `customers`: Customer information
- `employees`: Employee information
- `products`: Product master data
- `sales`: Transaction-level sales records

---

# Table: categories

**Description:**  
Stores product category information.

| Column | Data Type | Key | Description |
|---|---|---|---|
| CategoryID | INT | PK | Unique identifier for each product category. |
| CategoryName | VARCHAR(45) | - | Name of the product category (industry group). |

---

# Table: cities

**Description:**  
Stores city-level geographical information.

| Column | Data Type | Key | Description |
|---|---|---|---|
| CityID | INT | PK | Unique identifier for each city. |
| CityName | VARCHAR(45) | - | Name of the city. |
| Zipcode | DECIMAL(5,0) | - | Postal code or geographical reference code of the city. |
| CountryID | INT | FK | Foreign key linking the city to the countries table. |

---

# Table: countries

**Description:**  
Stores country-level geographical information.

| Column | Data Type | Key | Description |
|---|---|---|---|
| CountryID | INT | PK | Unique identifier for each country. |
| CountryName | VARCHAR(45) | - | Name of the country. |
| CountryCode | VARCHAR(2) | - | Standard two-character country code. |

---

# Table: customers

**Description:**  
Contains customer information used for customer behavior analysis.

| Column | Data Type | Key | Description |
|---|---|---|---|
| CustomerID | INT | PK | Unique identifier for each customer. |
| FirstName | VARCHAR(45) | - | Customer first name. |
| MiddleInitial | VARCHAR(1) | - | Customer middle initial. |
| LastName | VARCHAR(45) | - | Customer last name. |
| CityID | INT | FK | Customer's residential city linked to the cities table. |
| Address | VARCHAR(90) | - | Customer residential address. |

---

# Table: employees

**Description:**  
Contains employee information for salesperson performance analysis.

| Column | Data Type | Key | Description |
|---|---|---|---|
| EmployeeID | INT | PK | Unique identifier for each employee. |
| FirstName | VARCHAR(45) | - | Employee first name. |
| MiddleInitial | VARCHAR(1) | - | Employee middle initial. |
| LastName | VARCHAR(45) | - | Employee last name. |
| BirthDate | DATE | - | Employee date of birth. |
| Gender | VARCHAR(10) | - | Employee gender. |
| CityID | INT | FK | Employee location linked to the cities table. |
| HireDate | DATE | - | Official employment start date. |

---

# Table: products

**Description:**  
Contains product master information, including pricing, category, and product characteristics.

| Column | Data Type | Key | Description |
|---|---|---|---|
| ProductID | INT | PK | Unique identifier for each product. |
| ProductName | VARCHAR(45) | - | Name of the product. |
| Price | DECIMAL(4,0) | - | Listed unit price of the product. |
| CategoryID | INT | FK | Product category linked to the categories table. |
| Class | VARCHAR(15) | - | Product classification or segment. |
| ModifyDate | DATE | - | Date when product information was last updated. |
| Resistant | VARCHAR(15) | - | Product storage condition or resistance classification. |
| IsAllergic | VARCHAR | - | Indicates whether the product contains allergen information. |
| VitalityDays | DECIMAL(3,0) | - | Product shelf-life duration in days. |

---

# Table: sales

**Description:**  
Stores transaction-level sales records containing customer purchases, products sold, and transaction details.

| Column | Data Type | Key | Description |
|---|---|---|---|
| SalesID | INT | PK | Unique identifier for each sales transaction. |
| SalesPersonID | INT | FK | Salesperson responsible for the transaction. |
| CustomerID | INT | FK | Customer who purchased the product. |
| ProductID | INT | FK | Product sold in the transaction. |
| Quantity | INT | - | Number of product units sold. |
| Discount | DECIMAL(10,2) | - | Discount rate applied to the transaction. |
| TotalPrice | DECIMAL(10,2) | - | Final transaction value after discount. |
| SalesDate | DATETIME | - | Date and time of the transaction. |
| TransactionNumber | VARCHAR(25) | - | Unique transaction or invoice identifier. |

---

# Analytical View

## vw_sales_detail_clean

**Description:**  
A cleaned analytical dataset created by joining transaction data with product and category information. This view is used as the primary data source for Tableau dashboards.

| Column | Description |
|---|---|
| SalesID | Transaction identifier |
| TransactionNumber | Cleaned transaction reference number |
| SalesDate | Transaction date |
| SalesYear | Extracted year from sales date |
| SalesMonth | Extracted month number |
| SalesMonthName | Month name for trend analysis |
| SalesQuarter | Quarter information |
| CustomerID | Customer identifier |
| SalesPersonID | Salesperson identifier |
| ProductID | Product identifier |
| ProductName | Product name |
| CategoryName | Product category |
| Price | Unit price |
| Quantity | Units sold |
| Discount | Discount rate |
| GrossRevenue | Revenue before discount |
| Revenue | Net revenue after discount |
