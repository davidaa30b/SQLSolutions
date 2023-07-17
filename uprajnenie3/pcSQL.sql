SELECT DISTINCT MAKER
FROM product,pc
WHERE product.model = pc.model AND pc.speed>500

SELECT code, model, price
FROM printer
WHERE price = (SELECT TOP 1 price FROM printer ORDER BY price DESC )
ORDER BY price DESC

SELECT * 
FROM laptop
WHERE speed < ALL(SELECT speed FROM pc)


SELECT TOP 1 model, price
FROM (SELECT  model, price FROM laptop
UNION
SELECT  model, price FROM pc
UNION
SELECT  model, price FROM printer)  AS whole_table
ORDER BY whole_table.price DESC

SELECT maker
FROM product,printer
WHERE product.model = printer.model AND 
printer.color = 'y' AND
printer.price = (SELECT TOP 1 price FROM printer WHERE color = 'y' ORDER BY price ASC )

SELECT maker
FROM product
WHERE model IN 
(SELECT model from pc, 
(SELECT top 1 ram, speed from pc order by pc.ram asc, pc.speed desc ) t where pc.ram = t.ram and pc.speed = t.speed)






 