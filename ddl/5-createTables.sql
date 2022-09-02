SET search_path TO laboratorio ;

CREATE TABLE Region(
	RegionID int NOT NULL PRIMARY KEY,
	RegionDescription varchar(50) NOT NULL
);


CREATE TABLE Territories(
	TerritoryID varchar(20) NOT NULL PRIMARY KEY,
	TerritoryDescription varchar(50) NOT NULL,
	RegionID int NOT NULL,
	CONSTRAINT FK_Region_Territories FOREIGN KEY (RegionID)  REFERENCES Region (RegionID)
);

CREATE TABLE Employees(
	EmployeeID int NOT NULL PRIMARY KEY,
	LastName varchar(20) NOT NULL,
	FirstName varchar(10) NOT NULL,
	Address varchar(60) NULL,
	City varchar(15) NULL,
	Region varchar(15) NULL,
	Country varchar(15) NULL,
	ReportsTo int NULL
);

 ALTER TABLE Employees
 ADD CONSTRAINT FK_Employees_ReportsTo FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID);

 CREATE TABLE EmployeeTerritories(
	EmployeeID int NOT NULL,
	TerritoryID varchar(20) NOT NULL,
	PRIMARY KEY(EmployeeID,TerritoryID),
	CONSTRAINT FK_Employees_EmployeeTerritories FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
	CONSTRAINT FK_Territories_EmployeeTerritories FOREIGN KEY (TerritoryID) REFERENCES Territories (TerritoryID)
);

--Tabla Adicional

CREATE TABLE Orders(
	OrderID int NOT NULL PRIMARY KEY,
	EmployeeID int NULL,
	OrderDate timestamp NULL,
	Freight money NULL,
	ShipCity varchar(15) NULL,
	ShipCountry varchar(15) NULL,
	CONSTRAINT FK_Employees_Orders FOREIGN KEY (EmployeeID)  REFERENCES Employees (EmployeeID)
);


CREATE TABLE Categories(
	CategoryID int NOT NULL PRIMARY KEY,
	CategoryName varchar (15) NOT NULL,
	Description varchar (400) NULL
);

CREATE TABLE Products(
	ProductID int NOT NULL PRIMARY KEY,
	ProductName varchar (40) NOT NULL,
	CategoryID int NULL,
	CONSTRAINT FK_Categories_Products FOREIGN KEY (CategoryID)  REFERENCES Categories (CategoryID)
);

CREATE TABLE OrderDetails(
	OrderID int NOT NULL,
	ProductID int NOT NULL,
	UnitPrice money NOT NULL,
	Quantity smallint NOT NULL,
	Discount real NOT NULL,
	PRIMARY KEY(OrderID,ProductID),
 	CONSTRAINT FK_Products_OrderDetails FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
	CONSTRAINT FK_Orders_OrderDetails FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);





