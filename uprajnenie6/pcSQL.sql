SELECT model,code,screen
FROM laptop
WHERE screen=15 OR screen=11

--izvejda nai evtiniq laptop i negoviq proizveditel
SELECT maker, cheapest_laptop.model, cheapest_laptop.price
FROM product JOIN (SELECT laptop.model,price
FROM laptop 
WHERE price <= ALL (SELECT price FROM laptop)) cheapest_laptop ON product.model = cheapest_laptop.model




SELECT DISTINCT pc.model
FROM pc JOIN product ON pc.model = product.model 
WHERE maker = (SELECT maker
FROM product JOIN (SELECT laptop.model,price
FROM laptop 
WHERE price <= ALL (SELECT price FROM laptop)) cheapest_laptop ON product.model = cheapest_laptop.model) AND 
price <= (SELECT cheapest_laptop.price
FROM product JOIN (SELECT laptop.model,price
FROM laptop 
WHERE price <= ALL (SELECT price FROM laptop)) cheapest_laptop ON product.model = cheapest_laptop.model)


SELECT avg_pcs.model,avg_pcs.avg_price
FROM product JOIN (
SELECT pc.model , AVG(price) AS avg_price 
FROM pc 
GROUP BY pc.model ) avg_pcs ON product.model = avg_pcs.model
WHERE avg_pcs.avg_price <= 
(SELECT cheapest_laptop.price 
FROM product JOIN 
(SELECT laptop.model,price FROM laptop WHERE price <= ALL (SELECT price FROM laptop)) cheapest_laptop ON
product.model = cheapest_laptop.model) AND
maker = (SELECT maker
FROM product JOIN (SELECT laptop.model,price
FROM laptop 
WHERE price <= ALL (SELECT price FROM laptop)) cheapest_laptop ON product.model = cheapest_laptop.model) 

SELECT pc.code, pc.model, prd.maker,
(SELECT COUNT(DISTINCT MODEL) FROM PC as p WHERE pc.price <= p.price ) as num_pc_higher_price
FROM PC as pc
JOIN
PRODUCT as prd
ON pc.model = prd.model









