--Find the film(s) with the largest cast. Return the movie title and the size of the cast. By "cast size" we mean the
-- number of distinct actors that played in that movie: if an actor played multiple roles,
-- or if it simply occurs multiple times in casts, we still count her/him only once. 

SELECT vw.mid, m.title, MAX(vw.cast_count) as cast_size from
(
    SELECT COUNT(*) as cast_count, mid from M_Cast GROUP BY mid
) vw 
INNER JOIN Movie m on m.mid = vw.mid;
