CREATE DATABASE FurnitureCompany;

CREATE TABLE CUSTOMER(
Customer_ID INT IDENTITY(1,1),
Customer_Name VARCHAR(255) NOT NULL,
Customer_Address VARCHAR(255)NOT NULL,
Customer_City VARCHAR(255) NOT NULL,
City_Code INT NOT NULL,
CONSTRAINT pk_customer PRIMARY KEY(Customer_ID) 
);

CREATE TABLE ORDER_T(
Order_ID INT,
Order_Date DATE,
Customer_ID INT,
CONSTRAINT pk_order_t PRIMARY KEY(Order_ID), 
CONSTRAINT fk_order_t_customer_id FOREIGN KEY(Customer_ID) REFERENCES CUSTOMER(Customer_ID) 
);

CREATE TABLE PRODUCT(
Product_ID INT,
Product_Description VARCHAR(255),
Product_Finish VARCHAR(255),
Standard_Price INT,
Product_Line_ID INT,
CONSTRAINT pk_product PRIMARY KEY(Product_ID),
CONSTRAINT uk_product UNIQUE (Product_Finish,Product_Line_ID) 
);

CREATE TABLE ORDER_LINE(
Order_ID INT,
Product_ID INT,
Ordered_Quantity INT,
CONSTRAINT pk_order_line PRIMARY KEY(Order_ID,Product_ID),
CONSTRAINT fk_order_line_order_id FOREIGN KEY(Order_ID) REFERENCES ORDER_T(Order_ID),
CONSTRAINT fk_order_line_product_id FOREIGN KEY(Product_ID) REFERENCES PRODUCT(Product_ID) 
);

insert into CUSTOMER values
('Иван Петров', 'ул. Лавеле 8', 'София', '1000'),
('Камелия Янева', 'ул. Иван Шишман 3', 'Бургас', '8000'),
('Васил Димитров', 'ул. Абаджийска 87', 'Пловдив', '4000'),
('Ани Милева', 'бул. Владислав Варненчик 56', 'Варна','9000');
insert into PRODUCT values
(1000, 'офис бюро', 'череша', 195, 10),
(1001, 'директорско бюро', 'червен дъб', 250, 10),
(2000, 'офис стол', 'череша', 75, 20),
(2001, 'директорски стол', 'естествен дъб', 129, 20),
(3000, 'етажерка за книги', 'естествен ясен', 85, 30),
(4000, 'настолна лампа', 'естествен ясен', 35, 40);
insert into ORDER_T values
(100, '2013-01-05', 1),
(101, '2013-12-07', 2),
(102, '2014-10-03', 3),
(103, '2014-10-08', 2),
(104, '2015-10-05', 1),
(105, '2015-10-05', 4),
(106, '2015-10-06', 2),
(107, '2016-01-06', 1);
insert into ORDER_LINE values
(100, 4000, 1),
(101, 1000, 2),
(101, 2000, 2),
(102, 3000, 1),
(102, 2000, 1),
(106, 4000, 1),
(103, 4000, 1),
(104, 4000, 1),
(105, 4000, 1),
(107, 4000, 1);