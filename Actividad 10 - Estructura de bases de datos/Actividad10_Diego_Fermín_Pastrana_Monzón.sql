CREATE DATABASE Company;
Use Company;

CREATE TABLE Products(
ProductID INT(250) PRIMARY KEY,
ProductName INT(250),
QuantityPerUnit INT(250) UNIQUE,
UnitPrice INT(250) UNIQUE,
UnitInStock INT(250) UNIQUE,
UnitOnOrder INT(250) UNIQUE,
ReorderLevel VARCHAR(250),
Discontinued VARCHAR(250)
);

CREATE TABLE OrderDetails(
OrderDetailsID INT(250) PRIMARY KEY,
ProductID INT(250),
UnitPrice INT(250) UNIQUE,
Quantity INT(250),
Discount INT(250),
FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

CREATE TABLE Suppliers(
SupplierID INT(250) PRIMARY KEY,
ProductID INT(250),
CompanyName VARCHAR(250),
ContactName VARCHAR(250),
ContacTitle VARCHAR(250),
Address VARCHAR(250),
City VARCHAR(250),
Region VARCHAR(250),
PostalCode VARCHAR(250) UNIQUE,
Country VARCHAR(250),
Phone VARCHAR(250) UNIQUE,
Fax VARCHAR(250),
HomePage VARCHAR(250),
FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

CREATE TABLE Categories(
CategoryID INT(250) PRIMARY KEY,
ProductID INT(250),
CategoryName VARCHAR(250) UNIQUE,
Description VARCHAR(250),
Picture VARCHAR(250) UNIQUE,
FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

CREATE TABLE Orders(
OrderID INT(250) PRIMARY KEY,
OrderDetailsID INT(250),
OrderDate DATE,
RequieredDate DATE, 
ShippedDate DATE,
ShipName VARCHAR(250),
ShipAddress VARCHAR(250),
ShipCity VARCHAR(250),
ShipRegion VARCHAR(250),
ShipPostalCode VARCHAR(250) UNIQUE,
ShipCountry VARCHAR(250),
Freight VARCHAR(250),
FOREIGN KEY (OrderDetailsID) REFERENCES OrderDetails (OrderDetailsID)
);

CREATE TABLE Shippers(
ShipperID INT(250) PRIMARY KEY,
OrderID INT(250), 
CompanyName VARCHAR(200),
Phone VARCHAR(200) UNIQUE,
FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);

CREATE TABLE Customers(
CustomerID INT(200) PRIMARY KEY,
OrderID INT(200),
CompanyName VARCHAR(200),
ContactName VARCHAR(200),
ContactTitle VARCHAR(200),
Address VARCHAR(200),
City VARCHAR(200),
Region VARCHAR(200),
PostalCode VARCHAR(200) UNIQUE,
Country VARCHAR(200),
Phone VARCHAR(200) UNIQUE,
Fax VARCHAR(200),
FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);

CREATE TABLE Employees( 
EmployeeID INT(200) PRIMARY KEY,
OrderID INT(200), 
LastName VARCHAR(200),
FirsttName VARCHAR(200),
Title VARCHAR(200),
TitleOfCourtesy VARCHAR(200),
BirthDate INT(200),
HireDate INT(200),
Address VARCHAR(200),
City VARCHAR(200),
Region INT(200),
PostalCode INT(200),
Country VARCHAR(200),
HomePhone INT(200), 
Extension VARCHAR(200), 
Photo VARCHAR(200),
Notes VARCHAR(200), 
ReportsTo VARCHAR(200),
FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);

CREATE INDEX Products_ProductName
ON Products (ProductName);
CREATE INDEX Suppliers_Company
ON Suppliers (CompanyName);
CREATE INDEX Suppliers_PostalCode
ON Suppliers (PostalCode);
CREATE INDEX Employees_LastName
ON Employees (LastName);
CREATE INDEX Employees_PostalCode
ON Employees (PostalCode);
CREATE INDEX Customers_CompanyName
ON Customers (CompanyName);
CREATE INDEX Customers_City
ON Customers (City);
CREATE INDEX Customers_Region
ON Customers (Region);
CREATE INDEX Customers_PostalCode
ON Customers (PostalCode);
CREATE INDEX Orders_OrderDate
ON orders (OrderDate);
CREATE INDEX Orders_ShippedDate
ON orders (ShippedDate);
CREATE INDEX Orders_ShipPostalCode
ON orders (ShipPostalCode);


