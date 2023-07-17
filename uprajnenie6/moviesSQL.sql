SELECT title, year,length
FROM movie
WHERE length > 120 OR length is NULL AND year < 2000  ;

SELECT name,gender
FROM moviestar
WHERE name LIKE 'J%' AND birthdate > 1948
ORDER BY name DESC

SELECT movie.studioname, COUNT(DISTINCT starsin.starname) AS num_actors
FROM movie JOIN starsin ON movie.title = starsin.movietitle
GROUP BY movie.studioname;

SELECT starname , COUNT(movietitle) AS num_movies
FROM starsin
GROUP BY starname;

SELECT w_t.studioname,movie.title,w_t.year 
FROM (SELECT studioname,MAX(year) AS year
FROM movie 
GROUP BY studioname) AS w_t JOIN movie ON w_t.year = movie.year
ORDER BY w_t.studioname DESC

SELECT name 
FROM moviestar
WHERE gender = 'M' AND birthdate >= ALL (SELECT birthdate FROM moviestar WHERE gender = 'M')





SELECT DISTINCT movie.studioname, starsin.starname , ww.num_movies
FROM starsin JOIN movie ON movie.TITLE = STARSIN.MOVIETITLE JOIN
(SELECT w_t.starname, MAX(w_t.num_movies) AS num_movies
FROM 
(SELECT starname , COUNT(movietitle) AS num_movies
FROM starsin
GROUP BY starname) w_t
GROUP BY w_t.starname) ww ON starsin.STARNAME = ww.STARNAME
WHERE ww.num_movies >= ALL(SELECT w_t.num_movies 
FROM (SELECT starname , COUNT(movietitle) AS num_movies
FROM starsin
GROUP BY starname) w_t)





SELECT DISTINCT starsin.movietitle, starsin.movieyear, w.num_actors
FROM (SELECT movietitle,COUNT(DISTINCT starname) AS num_actors
FROM starsin
GROUP BY movietitle) w JOIN starsin ON w.movietitle = starsin.movietitle 
WHERE num_actors>2


