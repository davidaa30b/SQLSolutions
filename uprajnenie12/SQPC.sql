SELECT maker
FROM product
WHERE type= 'Printer'
INTERSECT
SELECT maker
FROM product
WHERE type= 'Laptop'

SELECT DISTINCT maker
FROM product
WHERE maker IN (SELECT maker FROM product Where type= 'Laptop') AND
maker IN (SELECT maker FROM product Where type= 'Printer')

UPDATE pc
SET price = price - 0.05*price
WHERE model IN(
--SELECT maker,pc.price,pc.model
SELECT pc.model
FROM product JOIN pc ON product.model = pc.model
WHERE maker IN 
(SELECT maker
FROM product JOIN printer ON product.model = printer.model
GROUP BY maker
HAVING AVG(printer.price) > 280 ) )


SELECT hd,MIN(price) as min_price
FROM pc
WHERE hd>=10 AND hd<=30
GROUP BY hd