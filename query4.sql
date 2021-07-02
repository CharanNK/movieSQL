--List all directors who directed 10 movies or more, in descending order of the number of 
--movies they directed. Return the directors' names and the number of movies each of them directed. 

SELECT p.name as director_name, COUNT(*) as numbr_of_movies FROM PERSON p
INNER JOIN M_DIRECTOR md ON p.pid = md.pid
INNER JOIN MOVIE mv ON md.mid = mv.mid
GROUP BY mv.mid
HAVING COUNT(*)>=10
ORDER BY COUNT(*) DESC;