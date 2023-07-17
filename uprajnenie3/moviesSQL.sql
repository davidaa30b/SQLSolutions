SELECT name
FROM MOVIESTAR
WHERE GENDER = 'F'
INTERSECT
SELECT name FROM  MOVIEEXEC WHERE NETWORTH > 10000000;

SELECT name
FROM MOVIESTAR
EXCEPT
SELECT name
FROM MOVIEEXEC

SELECT TITLE
FROM MOVIE
WHERE LENGTH > (SELECT LENGTH FROM MOVIE WHERE TITLE = 'Star Wars');

SELECT TITLE, NAME
FROM MOVIE,MOVIEEXEC
WHERE MOVIE.PRODUCERC# = MOVIEEXEC.CERT# AND
MOVIEEXEC.NETWORTH > (SELECT NETWORTH FROM MOVIEEXEC WHERE NAME = 'Merv Griffin');



