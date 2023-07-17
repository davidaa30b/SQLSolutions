SELECT p.maker,p.model,p.type 
FROM product p JOIN
(SELECT model
FROM product 
EXCEPT
(SELECT model 
FROM pc)
EXCEPT 
(SELECT model
FROM laptop)
EXCEPT
(SELECT model
FROM printer)) w_t ON p.model = w_t.model

SELECT maker
FROM product JOIN printer ON product.model=printer.model 
INTERSECT
SELECT maker
FROM product JOIN laptop ON product.model = laptop.model

SELECT hd
FROM laptop 
GROUP BY hd
HAVING COUNT( hd) >1;


SELECT p.model,p.maker
FROM product p LEFT JOIN pc ON p.model = pc.model 
WHERE p.maker IS NULL




