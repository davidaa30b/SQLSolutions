USE master
GO
if exists (select * from sysdatabases where name='mypcs')
	DROP DATABASE mypcs
GO

CREATE DATABASE mypcs
GO
USE mypcs
GO

CREATE TABLE Product
(
maker CHAR(1),
model CHAR(4),
type VARCHAR(7)
);

CREATE TABLE Printer
(
code INT,
model CHAR(4),
price DECIMAL(10,2)
);

--Product--data
INSERT INTO Product(maker,model,type)
VALUES ('A','1132','Laptop')
INSERT INTO Product(maker,model,type)
VALUES ('B','1202','Laptop')
INSERT INTO Product(maker,model,type)
VALUES ('C','9999','PC')
INSERT INTO Product(maker,model,type)
VALUES ('A','4521','Printer')

--Printer data
INSERT INTO Printer(code,model,price)
VALUES (1,'1132',783.21)
INSERT INTO Printer(code,model,price)
VALUES (2,'1202',1683.59)
INSERT INTO Printer(code,model,price)
VALUES (3,'9999',584.64)
INSERT INTO Printer(code,model,price)
VALUES (4,'4521',1002.08)
