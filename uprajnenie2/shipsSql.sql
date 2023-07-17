SELECT ships.NAME
FROM ships, CLASSES
WHERE ships.CLASS = CLASSES.CLASS AND DISPLACEMENT >= 50000;

SELECT SHIPS.NAME AS name, DISPLACEMENT AS displacement, NUMGUNS AS numguns
FROM CLASSES,SHIPS,OUTCOMES,BATTLES
WHERE SHIPS.CLASS = CLASSES.CLASS AND SHIPS.NAME = OUTCOMES.SHIP AND OUTCOMES.BATTLE = BATTLES.NAME AND BATTLES.NAME = 'Guadalcanal';

(SELECT COUNTRY AS country
FROM CLASSES
WHERE TYPE = 'bb')
UNION
(SELECT COUNTRY AS country
FROM CLASSES
WHERE TYPE = 'bc');

(SELECT SHIP AS ship
FROM OUTCOMES
WHERE RESULT = 'damaged')
INTERSECT
(SELECT SHIP
FROM OUTCOMES
WHERE RESULT = 'ok');