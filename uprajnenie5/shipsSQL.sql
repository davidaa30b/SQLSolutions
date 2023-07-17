SELECT COUNT( DISTINCT CLASSES.CLASS) AS NO_Classes
FROM CLASSES  
WHERE TYPE = 'bb';

SELECT CLASS, AVG(NUMGUNS) AS avgGuns
FROM CLASSES
WHERE CLASSES.TYPE = 'bb'
GROUP BY CLASS

SELECT AVG(NUMGUNS)AS avgGuns
FROM CLASSES
WHERE TYPE = 'bb'

SELECT CLASS , MIN(LAUNCHED) AS FirstYear, MAX(LAUNCHED) AS LastYear
FROM SHIPS
GROUP BY CLASS

SELECT CLASS , COUNT (RESULT) AS No_Sunk 
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE RESULT = 'sunk' AND 2<=ANY(SELECT COUNT(SHIPS.NAME)FROM SHIPS GROUP BY SHIPS.CLASS)
GROUP BY CLASS

SELECT CLASS , COUNT (RESULT) AS No_Sunk 
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE RESULT = 'sunk' 
GROUP BY CLASS



SELECT country , CONVERT(decimal(4,2),AVG (ISNULL(BORE,0) )) as avg_bore
FROM CLASSES 
GROUP BY COUNTRY


