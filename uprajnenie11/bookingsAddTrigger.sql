CREATE TRIGGER bookings_add 
ON BOOKINGS 
AFTER INSERT 
AS
BEGIN
UPDATE FLIGHTS SET num_pass = num_pass+1 WHERE FNUMBER = (SELECT FLIGHT_NUMBER FROM inserted);
UPDATE AGENCIES SET num_book = num_book+1 WHERE NAME = (SELECT AGENCY FROM inserted);
END

