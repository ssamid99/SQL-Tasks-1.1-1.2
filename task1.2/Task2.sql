CREATE DATABASE StoreDatabase
USE StoreDatabase
CREATE TABLE Employees
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25) NOT NULL,
Surname NVARCHAR(40) NOT NULL,
FatherName NVARCHAR(25) NOT NULL,
Salary DECIMAL(18,2),
PositionId INT REFERENCES Positions(Id) NOT NULL
)
ALTER TABLE Employees
DROP CONSTRAINT CK_Salary
ALTER TABLE Employees
DROP COLUMN Salary
ALTER TABLE Employees
ADD Salary DECIMAL(18,2) NOT NULL
CREATE TABLE Positions
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL
)

CREATE TABLE Branchs
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL
)
CREATE TABLE Products
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100) NOT NULL,
BuyingPrice DECIMAL(18,2) NOT NULL,
SellingPrice DECIMAL(18,2) NOT NULL
)
CREATE TABLE Sellings
(
Id INT PRIMARY KEY IDENTITY,
BranchId INT REFERENCES Branchs(Id) NOT NULL,
EmployeeId INT REFERENCES Employees(Id) NOT NULL,
ProductId INT REFERENCES Products(Id) NOT NULL,
)
ALTER TABLE Sellings
ADD SellingHistory date DEFAULT getdate() NOT NULL

INSERT INTO Positions
VALUES
('General Manager'),
('Manager'),
('Asistance of Manager'),
('Supervisor'),
('Seller')

INSERT INTO Employees
VALUES
('James', 'Hamilton', 'David', 1, 5500),
('Emre', 'Yucelen', 'Ahmet', 2, 3550),
('Vali', 'Safarli', 'Gorkhmaz', 4, 900),
('Elkhan', 'Rasulov', 'Kamran', 5, 480)
INSERT INTO Employees
VALUES
('Ali', 'Aliyev', 'Ceyhun', 3, 1500)
INSERT INTO Employees
VALUES
('Vali', 'Valiyev', 'Rahim', 5, 480),
('Lale', 'Gozalova', 'Haydar', 5, 480),
('Rafiq', 'Gocaev', 'Aslan', 4, 1100),
('Aylin', 'Abdullayeva', 'Zohrab', 2, 2800)

INSERT INTO Branchs
VALUES
('Baku Electronics (Azadlıg / Head Office)'),
('Baku Electronics (28 May)'),
('Baku Electronics (Ahmadli)'),
('Baku Electronics (Gara Garayev)'),
('Baku Electronics (Inshaatchılar)')

INSERT INTO Products
VALUES
('Apple Watch Nike Series 7 GPS', 950, 1199),
('HUAWEI FreeBuds', 280, 449),
('ASUS ROG Delta S', 234, 459),
('Apple AirPods Max', 859, 1279),
('HUAWEI P50 PRO', 1978, 2399),
('HUAWEI NOVA 9 SE', 420, 799),
('Samsung Galaxy A73', 860, 1160),
('Samsung Galaxy A13', 210, 319),
('Abajur Zeta DivanEv', 115, 229),
('Televizor Sony KD-43X81J', 950, 1599)

INSERT INTO Sellings
VALUES
(1, 24, 10,'2022-07-01'),
(4, 23, 5, '2021-03-21'),
(3, 21, 4, '2020-09-15'),
(2, 26, 7, '2021-11-20'),
(5, 30, 1, '2022-02-15'),
(3, 27, 3, '2019-12-28'),
(1, 25, 2, '2021-09-30'),
(4, 28, 6, '2022-04-27'),
(5, 29, 8, '2021-06-16'),
(5, 30, 9, '2022-01-29')

SELECT Branchs.Name, Employees.Name, Employees.Surname, Employees.FatherName, Products.Name, Products.BuyingPrice, Products.SellingPrice 
FROM (((Sellings
INNER JOIN Branchs ON Sellings.BranchId= Branchs.Id)
INNER JOIN Employees ON Sellings.EmployeeId= Employees.Id)
INNER JOIN Products ON Sellings.ProductId= Products.Id)
