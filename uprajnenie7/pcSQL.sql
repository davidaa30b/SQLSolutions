INSERT INTO product(model, maker,type)
VALUES ('1100','C','PC')
INSERT INTO pc(model,speed,ram,hd,cd,price,code)
VALUES ('1100',2400,2048,500,'52x',299,12)

DELETE FROM pc
WHERE model = '1100'

DELETE FROM laptop
WHERE laptop.model NOT IN (SELECT model
FROM product ml JOIN (SELECT maker
FROM product
WHERE type = 'Printer') mp ON ml.maker = mp.maker
WHERE type = 'Laptop')

UPDATE product
SET maker = 'A'
WHERE maker = 'B'

UPDATE pc
SET price = price/2 , hd = hd + 20;

UPDATE laptop
SET speed = speed + 1
WHERE laptop.model = (SELECT laptop.model FROM laptop JOIN product ON laptop.model = product.model AND product.maker='B')



