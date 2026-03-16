CREATE DATABASE quanlybanhang;
USE quanlybanhang;

CREATE TABLE Customer(
cID INT PRIMARY KEY,
Name VARCHAR(25),
cAge TINYINT
);

CREATE TABLE Orders(
oID INT PRIMARY KEY,
cID INT,
oDate DATETIME,
oTotalPrice INT
);

CREATE TABLE Product(
pID INT PRIMARY KEY,
pName VARCHAR(25),
pPrice INT
);

CREATE TABLE OrderDetail(
oID INT,
pID INT,
odQTY INT,
PRIMARY KEY (oID,pID)
);
INSERT INTO Customer VALUES
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);
INSERT INTO Customer VALUES
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);
INSERT INTO Orders VALUES
(1,1,'2006-03-21',NULL),
(2,2,'2006-03-23',NULL),
(3,1,'2006-03-16',NULL);
INSERT INTO Product VALUES
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);
INSERT INTO orderdetail VALUES
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM Product;
SELECT * FROM OrderDetail;
-- 1 hiển thị hóa đơn
SELECT oID, oDate, oTotalPrice
FROM Orders;
-- 2 Khách hàng và sản phẩm họ mua
SELECT Customer.Name, Product.pName
FROM Customer
JOIN Orders ON Customer.cID = Orders.cID
JOIN OrderDetail ON Orders.oID = OrderDetail.oID
JOIN Product ON OrderDetail.pID = Product.pID;
-- 3 Khách hàng chưa mua
SELECT Name
FROM Customer
WHERE cID NOT IN (
SELECT cID FROM Orders
);
-- 4 Hóa đơn + tổng tiền
SELECT Orders.oID, Orders.oDate,
SUM(OrderDetail.odQTY * Product.pPrice) AS TotalPrice
FROM Orders
JOIN OrderDetail ON Orders.oID = OrderDetail.oID
JOIN Product ON OrderDetail.pID = Product.pID
GROUP BY Orders.oID, Orders.oDate;
SELECT DATABASE();
SELECT * FROM orderdetail;
SELECT * FROM Product;


