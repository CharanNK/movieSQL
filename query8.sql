--Find the actors that were never unemployed for more than 3 years at a stretch. (Assume 
--that the actors remain unemployed between two consecutive movies). 

SELECT vw.*, (vw.next_year - vw.year) AS gap  
FROM
(
    SELECT i_vw.pid, i_vw.name, i_vw.title, i_vw.year, 
        LEAD(i_vw.year, 1, 0) OVER (PARTITION BY i_vw.name ORDER BY i_vw.year ASC) AS next_year
        FROM 
        (
            (
                SELECT DISTINCT trim(pid) AS pid, trim(name) AS name FROM Person 
            )p
            JOIN
            (
                SELECT DISTINCT trim(mid) AS mid, trim(pid) AS pid FROM M_CASt
            )mc on p.pid = mc.pid 
            join
            (
                SELECT trim(mid) AS mid, trim(title) AS title, trim(year) AS year FROM Movie
            ) m on m.mid = mc.mid;
        )
)
WHERE vw.next_year > 0 AND gap<3;