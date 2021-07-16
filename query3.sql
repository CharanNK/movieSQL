--List all the actors who acted in a film before 1970 and in a film after 1990. (That is: < 1970 
--and > 1990.) 

SELECT DISTINCT p.name from PERSON p
INNER JOIN M_CAST mc ON mc.pid = p.pid
INNER JOIN MOVIE mv ON mv.mid = mc.mid
where CAST(SUBSTR(mv.year,-4) AS Integer)>1990 and CAST(SUBSTR(mv.year,-4) AS Integer)>1990;