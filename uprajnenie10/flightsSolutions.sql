
--question??
CREATE VIEW v_Pass_count_flightsAS
SELECT DISTINCT a.NAME,pas_nums.FLIGHT_NUMBER,pas_nums.PASSENGERS_COUNT
FROM (
SELECT b.AIRLINE_CODE,b.FLIGHT_NUMBER,COUNT(DISTINCT b.CUSTOMER_ID) AS PASSENGERS_COUNT
FROM BOOKINGS as b
WHERE b.STATUS= 1
GROUP BY b.AIRLINE_CODE,FLIGHT_NUMBER) pas_nums JOIN AIRLINES a ON pas_nums.AIRLINE_CODE=a.CODE 

--question ?? tuka trqbva li da e za klient koito ima rezervacii tochno v taq angciq ili 
--izobshto 
CREATE VIEW v_number2
AS
SELECT everything.AGENCY,c.FNAME,c.LNAME
FROM
CUSTOMERS c JOIN
(
SELECT DISTINCT all_of.AGENCY,all_of.CUSTOMER_ID,all_of.RES_COUNT
FROM
(
SELECT b.AGENCY , cus_count.CUSTOMER_ID,cus_count.RES_COUNT
FROM BOOKINGS b JOIN 
(SELECT CUSTOMER_ID , COUNT(CUSTOMER_ID) AS RES_COUNT
FROM BOOKINGS
WHERE STATUS =1
GROUP BY CUSTOMER_ID) cus_count ON b.CUSTOMER_ID=cus_count.CUSTOMER_ID AND b.STATUS=1) all_of JOIN
(
SELECT b.AGENCY ,MAX(cus_count.REV_COUNT) as MAX_COUNT
FROM BOOKINGS b JOIN 
(SELECT CUSTOMER_ID , COUNT(CUSTOMER_ID) AS REV_COUNT
FROM BOOKINGS
WHERE STATUS =1
GROUP BY CUSTOMER_ID) cus_count ON b.CUSTOMER_ID=cus_count.CUSTOMER_ID AND b.STATUS=1
GROUP BY b.AGENCY ) max_of_all ON all_of.RES_COUNT=max_of_all.MAX_COUNT)everything ON c.ID=everything.CUSTOMER_ID

CREATE VIEW v_SF_Agencies
AS
SELECT *
FROM AGENCIES
WHERE CITY = 'Sofia'
WITH CHECK OPTION;

CREATE VIEW v_SF_PH_Agencies
AS
SELECT *
FROM AGENCIES
WHERE PHONE IS NULL
WITH CHECK OPTION;

----exercise 5
INSERT INTO v_SF_Agencies
VALUES('T1 Tour', 'Bulgaria', 'Sofia','+359');
INSERT INTO v_SF_PH_Agencies
VALUES('T2 Tour', 'Bulgaria', 'Sofia',null);
INSERT INTO v_SF_Agencies
VALUES('T3 Tour', 'Bulgaria', 'Varna','+359');
INSERT INTO v_SF_PH_Agencies
VALUES('T4 Tour', 'Bulgaria', 'Varna',null);
INSERT INTO v_SF_PH_Agencies
VALUES('T4 Tour', 'Bulgaria', 'Sofia','+359');
----exercise 5 end

--last exercise
DROP VIEW v_number2
DROP VIEW v_Pass_count_flights
DROP VIEW v_SF_Agencies
DROP VIEW v_SF_PH_Agencies
--last exercise end

--INDEXES
CREATE CLUSTERED INDEX idx_product_maker_model
ON product(model,maker);
DROP INDEX product.idx_product_maker_model; -- idx_product_maker_model ON product;

CREATE INDEX idx_classes_type ON classes(type);
DROP INDEX idx_classes_type ON classes;


