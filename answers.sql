 E-commerce Database

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS EcommerceDB;
USE EcommerceDB;


-- 2. Create Tables


-- Table: Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: Products
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL DEFAULT 0,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table: OrderItems (Many-to-Many relationship between Orders and Products)
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE(OrderID, ProductID)  -- Ensures a product appears once per order
);

-- Table: Categories (Optional: Product categories)
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT
);

-- Many-to-Many: Product-Categories relationship
CREATE TABLE ProductCategories (
    ProductID INT NOT NULL,
    CategoryID INT NOT NULL,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- 3. Example Insert Data


-- Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321');

-- Products
INSERT INTO Products (ProductName, Description, Price, StockQuantity) VALUES
('Laptop', 'High-performance laptop', 1200.00, 10),
('Mouse', 'Wireless mouse', 25.50, 50),
('Keyboard', 'Mechanical keyboard', 70.00, 30);

-- Categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Peripherals', 'Computer peripherals');

-- ProductCategories
INSERT INTO ProductCategories (ProductID, CategoryID) VALUES
(1,1),  -- Laptop -> Electronics
(2,2),  -- Mouse -> Peripherals
(3,2);  -- Keyboard -> Peripherals

-- Orders
INSERT INTO Orders (CustomerID, Status) VALUES
(1, 'Pending'),
(2, 'Shipped');

-- OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES
(1,1,1,1200.00),
(1,2,2,25.50),
(2,3,1,70.00);
