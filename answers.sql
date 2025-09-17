-- question 1
-- have 2 tables for productdetails and products and link them.

-- create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) UNIQUE
);

-- insert values in products table
INSERT INTO Products (ProductID, ProductName) VALUES
(1, 'Laptop'),
(2, 'Mouse'),
(3, 'Tablet'),
(4, 'Keyboard'),
(5, 'Phone');

-- create ProductDetails Table
CREATE TABLE ProductDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    ProductID INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- insert values in productDetails table
INSERT INTO ProductDetails (OrderID, CustomerName, ProductID) VALUES
(101, 'John Doe', 1),   -- Laptop
(101, 'John Doe', 2),   -- Mouse
(102, 'Jane Smith', 3), -- Tablet
(102, 'Jane Smith', 4), -- Keyboard
(102, 'Jane Smith', 2), -- Mouse
(103, 'Emily Clark', 5);-- Phone

-- question 2
-- have 2 tables linked the orders and orderDetails and products

-- create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- insert into orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- insert into orderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(101, 1, 2),  -- John Doe bought 2 Laptops
(101, 2, 1),  -- John Doe bought 1 Mouse
(102, 3, 3),  -- Jane Smith bought 3 Tablets
(102, 4, 1),  -- Jane Smith bought 1 Keyboard
(102, 2, 2),  -- Jane Smith bought 2 Mice
(103, 5, 1);  -- Emily Clark bought 1 Phone
