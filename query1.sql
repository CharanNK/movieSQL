--List all the directors who directed a 'Comedy' movie in a leap year. 
--(You need to check that the genre is 'Comedy’ and year is a leap year)
-- Your query should return director name, the movie name, and the year. 
SELECT p.name as director_name FROM PERSON p
INNER JOIN M_DIRECTOR md ON p.pid = md.pid
INNER JOIN MOVIE mv ON mv.mid = md.mid
INNER JOIN M_GENRE mg ON mv.mid = mg.mid
INNER JOIN GENRE g ON mg.gid = g.gid
WHERE g.name = 'Comedy' and m.year%4 = 0;   