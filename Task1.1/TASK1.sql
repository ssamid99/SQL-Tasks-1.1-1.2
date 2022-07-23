CREATE DATABASE BlogWeb
USE BlogWeb
CREATE TABLE Users
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25) NOT NULL,
Surname NVARCHAR(30) NOT NULL,
Email NVARCHAR(100) CONSTRAINT CK_EMAILVALUE CHECK(LEN(Email)>4) NOT NULL UNIQUE
)
CREATE TABLE Posts
(
Id INT PRIMARY KEY IDENTITY,
LikeCount INT,
CreatedAt DATE DEFAULT GETDATE(),
Title NVARCHAR(200),
PostText NVARCHAR(500) NOT NULL,
UserId INT REFERENCES Users(Id) NOT NULL
)

INSERT INTO Users
VALUES
('Samid','Samadzada','samidms@gmail.com'),
('Abbas','Mammadli','abbasfm@gmail.com'),
('Ramin','Safarov','raminss@gmail.com'),
('Zaman','Safarli','zamanss@gmail.com'),
('Seyfi','Cafarli','seyfizc@gmail.com')

INSERT INTO Posts
VALUES
(11, '2022-07-22', 'Error', 'No row was updated.The data in row 1 was not committed. Error Source: .Net SqlClient Data Provider', 3)

INSERT INTO Posts
VALUES
(23, '2021-06-02', 'Political', 'Relating to the government or public affairs of a country.', 1),
(125, '2022-01-01', 'GreenLife', 'An international space crew discovers life on Mars. ...', 4),
(526, '2022-01-15', 'Nigeria', 'International Space Station discover a rapidly', 2),
(229, '2022-02-21', 'BakuNights', 'Life: Directed by Ted Demme. With Eddie Murphy', 5)

INSERT INTO Posts
VALUES
(1241, '2022-11-22', 'Error23', 'No row was updated .Net SqlClient Data Provider', 3),
(204, '2021-12-02', 'Political45', 'Relating to the country.', 1),
(995, '2022-05-31', 'Green', 'An international space crew discovers life on Mars. ...', 4),
(556, '2022-09-25', 'Nigeria', 'International Space Station discover a rapidly', 1),
(2229, '2022-01-21', 'BakuNights', 'Life: Directed by Ted Demme. With Eddie Murphy', 5)
