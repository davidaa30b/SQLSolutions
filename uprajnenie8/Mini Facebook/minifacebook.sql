CREATE DATABASE minifacebook
use minifacebook

CREATE TABLE Users
(
id INT IDENTITY,
email VARCHAR(30),
password VARCHAR(30),
dateregistered DATETIME 
)

CREATE TABLE Friends
(
userr INT,
friend INT
)

CREATE TABLE Walls
(
numofuser INT,
numofwriter INT,
message VARCHAR(150),
dateofmessage DATETIME 
)

CREATE TABLE Groups
(
id INT IDENTITY,
name VARCHAR(20),
description VARCHAR(150) DEFAULT ''
)

CREATE TABLE GroupMembers
(
numgroup INT,
numuser INT
)

--Friends
INSERT INTO Friends(userr,friend)
VALUES(12,20)
INSERT INTO Friends(userr,friend)
VALUES(12,50)
INSERT INTO Friends(userr,friend)
VALUES(12,24)

--Walls
INSERT INTO Walls(numofuser,numofwriter,message,dateofmessage)
VALUES(12,24,'Wanna chill later ?','2023-06-12 10:34:09');
INSERT INTO Walls(numofuser,numofwriter,message,dateofmessage)
VALUES(12,24,'Yeah sure .','2023-06-12 10:35:09');
INSERT INTO Walls(numofuser,numofwriter,message,dateofmessage)
VALUES(12,50,'24 is coming. Are you too ?','2023-06-12 10:40:09');
INSERT INTO Walls(numofuser,numofwriter,message,dateofmessage)
VALUES(50,12,'Nah bro. I cannot . I have exam tommorow. Wil ya be free the next day ?','2023-06-12 10:41:09')
INSERT INTO Walls(numofuser,numofwriter,message,dateofmessage)
VALUES(12,50,'Yeah sure.','2023-06-12 10:42:09');

--GroupMembers
INSERT INTO GroupMembers(numgroup,numuser)
VALUES(1,12)
INSERT INTO GroupMembers(numgroup,numuser)
VALUES(1,24)
INSERT INTO GroupMembers(numgroup,numuser)
VALUES(2,50)

--Groups
INSERT INTO Groups(name,description)
VALUES('chilling','For going out')
INSERT INTO Groups(name,description)
VALUES('paying bills','For paying bills')



