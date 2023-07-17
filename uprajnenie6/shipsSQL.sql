SELECT DISTINCT ship
FROM outcomes
WHERE ship LIKE 'C%' OR ship LIKE 'K%';


SELECT DISTINCT name , classes.country
FROM ships LEFT JOIN outcomes ON ships.name = outcomes.ship JOIN classes ON ships.class = classes.class
WHERE result != 'sunk' OR result IS NULL

SELECT country ,COUNT(result) AS num_sunk_ships
FROM classes LEFT JOIN ships ON classes.class = ships.class LEFT JOIN outcomes ON ships.name = outcomes.ship
WHERE result ='sunk' OR result is NULL
GROUP BY country


SELECT DISTINCT w.battle
FROM outcomes JOIN (
SELECT battle, COUNT(ship) as ship_count FROM outcomes GROUP BY battle) w ON outcomes.battle = w.battle 
WHERE w.ship_count > 
(SELECT COUNT(ship) as ship_count FROM outcomes WHERE battle = 'Guadalcanal' GROUP BY battle )

SELECT DISTINCT w.battle
FROM outcomes JOIN (
SELECT battle, COUNT(ship) as ship_count FROM outcomes GROUP BY battle) w ON outcomes.battle = w.battle 
WHERE w.ship_count > 
(SELECT COUNT(ship) as ship_count FROM outcomes WHERE battle = ' Surigao Strait' GROUP BY battle )

SELECT ships.name, displacement, numGuns
FROM ships JOIN classes ON ships.class = classes.class
WHERE displacement <= ALL (SELECT  displacement FROM ships JOIN classes ON ships.class = classes.class) AND
numGuns >= ALL (SELECT numGuns FROM ships JOIN classes ON ships.class = classes.class
WHERE displacement <= ALL (SELECT  displacement FROM ships JOIN classes ON ships.class = classes.class))

SELECT ship,COUNT(result) AS num_ships
FROM outcomes
WHERE result = 'damaged' OR result = 'ok'
GROUP BY ship

SELECT COUNT(DISTINCT outcomes.ship) AS num_ships
FROM outcomes JOIN
(SELECT ship,COUNT(result) AS num_ships FROM outcomes WHERE result = 'damaged' OR result = 'ok' GROUP BY ship) w
ON outcomes.ship = w.ship
WHERE w.num_ships >=2

--za da razberesh kakvo se sluchva na poslednata zaqvka
--SELECT DISTINCT w.battle , w.ship_count,outcomes.ship , outcomes.result
--FROM outcomes JOIN (
--SELECT battle, COUNT(ship) as ship_count FROM outcomes GROUP BY battle) w ON outcomes.battle = w.battle JOIN 
--(SELECT w.ship, COUNT(DISTINCT outcomes.ship) AS revived_ships
--FROM outcomes JOIN
--(SELECT ship,COUNT(result) AS num_ships FROM outcomes WHERE result = 'damaged' OR result = 'ok' GROUP BY ship) w
--ON outcomes.ship = w.ship
--WHERE w.num_ships >=2
--GROUP BY w.ship) wx ON wx.ship = outcomes.ship



SELECT DISTINCT  outcomes.ship AS ship_name
FROM outcomes JOIN (
SELECT battle, COUNT(ship) as ship_count FROM outcomes GROUP BY battle) w ON outcomes.battle = w.battle JOIN 
(SELECT w.ship, COUNT(DISTINCT outcomes.ship) AS revived_ships
FROM outcomes JOIN
(SELECT ship,COUNT(result) AS num_ships FROM outcomes WHERE result = 'damaged' OR result = 'ok' GROUP BY ship) w
ON outcomes.ship = w.ship
WHERE w.num_ships >=2
GROUP BY w.ship) wx ON wx.ship = outcomes.ship
WHERE result ='ok'








