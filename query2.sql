--List the names of all the actors who played in the movie 'Anand' (1971)

SELECT DISTINCT p.name from PERSON p 
INNER JOIN M_CAST mc ON mc.pid = p.pid
INNER JOIN MOVIE mv ON mc.mid = mv.mid
WHERE mv.title = 'Anand' AND mv.year = 1971;