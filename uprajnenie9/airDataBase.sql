USE master;
CREATE DATABASE air;

USE air;

CREATE TABLE AIRLINE(
code VARCHAR(2) CONSTRAINT pk_airline PRIMARY KEY,
name VARCHAR(100) UNIQUE,
country VARCHAR(100)
);


CREATE TABLE AIRPORT(
code VARCHAR(3) CONSTRAINT pk_airport PRIMARY KEY,
name VARCHAR(100) UNIQUE,
country VARCHAR(100),
town VARCHAR(100)
);

CREATE TABLE AIRPLANE(
code VARCHAR(10) CONSTRAINT pk_airplane PRIMARY KEY,
type VARCHAR(50),
seats INTEGER,
year SMALLINT,
CHECK (seats > 0)
);

CREATE TABLE FLIGHT(
fnumber VARCHAR(10) CONSTRAINT pk_flight PRIMARY KEY,
airline_operator VARCHAR(2) NOT NULL,
dep_airport VARCHAR(3) NOT NULL,
arr_airport VARCHAR(3) NOT NULL,
flight_time TIME NOT NULL,
flight_duration SMALLINT NOT NULL,
airplane VARCHAR(10) NOT NULL,
CONSTRAINT fk_flightdep_airport FOREIGN KEY (dep_airport) REFERENCES AIRPORT(code),
CONSTRAINT fk_flightarr_airport FOREIGN KEY (arr_airport) REFERENCES AIRPORT(code)
);

ALTER TABLE FLIGHT ADD CONSTRAINT fk_flight_airline FOREIGN KEY (airline_operator) REFERENCES AIRLINE(code);
ALTER TABLE FLIGHT ADD CONSTRAINT fk_flight_airplane FOREIGN KEY (airplane) REFERENCES AIRPLANE(code);


CREATE TABLE CUSTOMER(
id INT CONSTRAINT pk_customer PRIMARY KEY,
fname VARCHAR(20) NOT NULL,
lname VARCHAR(20),
email VARCHAR(255),
CHECK (email LIKE '%@%.%' AND DATALENGTH(email) > 6)
);

CREATE TABLE AGENCY(
name VARCHAR(100) CONSTRAINT pk_agency PRIMARY KEY,
country VARCHAR(100),
city VARCHAR(100),
phone VARCHAR(20)
);

CREATE TABLE BOOKING(
code VARCHAR(10) CONSTRAINT pk_booking PRIMARY KEY,
agency VARCHAR(100) NOT NULL,
airline_code VARCHAR(2) NOT NULL,
flight_number VARCHAR(10) NOT NULL,
customer_id INT NOT NULL,
booking_date DATE NOT NULL,
flight_date DATE NOT NULL,
price INTEGER NOT NULL,
status TINYINT NOT NULL CHECK (status IN (0, 1)),
CONSTRAINT fk_booking_agency FOREIGN KEY (agency) REFERENCES AGENCY (name),
CHECK (booking_date < flight_date),
);

ALTER TABLE BOOKING ADD CONSTRAINT fk_booking_airline FOREIGN KEY (airline_code) REFERENCES AIRLINE(code);
ALTER TABLE BOOKING ADD CONSTRAINT fk_booking_flight FOREIGN KEY (flight_number) REFERENCES FLIGHT(fnumber);
ALTER TABLE BOOKING ADD CONSTRAINT fk_booking_customer FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id);