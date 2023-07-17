SELECT CONVERT(decimal(5,2),AVG(speed)) AS AvgSpeed
FROM pc

SELECT maker, AVG(laptop.screen) AS AvgScreen
FROM product JOIN laptop ON product.model = laptop.model
GROUP BY maker

SELECT CONVERT(decimal(5,2),AVG(laptop.speed)) AS AvgSpeed
FROM laptop 
WHERE price > 1000

SELECT maker ,CONVERT(decimal(5,2), AVG(pc.price)) AS AvgPrice
FROM product JOIN pc ON product.model = pc.model
GROUP BY maker
HAVING maker = 'A';


SELECT maker, AVG(w_t.price) AS AvgPrice
FROM 
(
SELECT model ,price
FROM pc
UNION ALL
SELECT model,price
FROM laptop
) AS w_t JOIN product ON w_t.model = product.model
GROUP BY maker
HAVING maker = 'B'

SELECT speed, AVG(price) AS AvgPrice
FROM pc
GROUP BY speed

SELECT maker , COUNT (pc.code) AS number_of_pc
FROM product JOIN pc ON product.model = pc.model
GROUP BY maker
HAVING COUNT (pc.code) >=3 

SELECT TOP 1 maker , MAX(price) AS price
FROM product JOIN pc ON product.model = pc.model
GROUP BY maker

SELECT speed, AVG(price) AS AvgPrice
FROM pc
GROUP BY speed
HAVING speed > 800

SELECT w_T.maker, CONVERT(decimal(4,2) , AVG(pc.hd) ) AS AvgHDD 
FROM 
(SELECT maker
FROM product JOIN pc ON product.model = pc.model 
INTERSECT
SELECT maker
FROM product JOIN printer ON product.model = printer.model) w_t 
JOIN product ON w_t.maker = product.maker
JOIN pc ON product.model = pc.model
GROUP BY w_t.maker