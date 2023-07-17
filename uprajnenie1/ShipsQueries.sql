SELECT CLASS, COUNTRY
FROM CLASSES
WHERE NUMGUNS < 10;

SELECT NAME AS SHIPNAME 
FROM SHIPS
WHERE LAUNCHED < 1918;

SELECT SHIP, BATTLE
FROM OUTCOMES
WHERE RESULT='sunk';

SELECT NAME
FROM SHIPS
WHERE NAME = CLASS;

SELECT NAME
FROM SHIPS
WHERE NAME LIKE 'R%';

SELECT NAME
FROM SHIPS
WHERE NAME LIKE '% %';