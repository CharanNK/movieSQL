--Find all the actors that made more movies with Yash Chopra than any other director. 

SELECT a.*, b.Yash_Chopra_Directed_Movies 
FROM 
(
    SELECT DISTINCT p.pid AS Actor_Id, 
    p.name AS Actor_Name,   
    COUNT(DISTINCT m.mid) AS NON_Yash_Chopra_Directed_Movies 
    FROM PersON p 
    JOIN M_Cast mc ON trim(mc.pid) = p.pid 
    JOIN Movie m ON m.mid = mc.mid 
    JOIN M_Director md ON md.mid = m.mid 
    JOIN PersON p1 ON p1.pid = trim(md.pid)
    WHERE trim(p1.name) != \\'Yash Chopra\\'
    GROUP BY trim(p.pid)
) a
LEFT JOIN
(
    select distinct trim(p.pid) as Actor_Id, 
    trim(p.name) as Actor_Name,  
    trim(p1.name) as Director_Name, 
    count(distinct m.mid) as Yash_Chopra_Directed_Movies 
    from PersON p 
    JOIN M_Cast mc ON trim(mc.pid) = p.pid 
    JOIN Movie m ON m.mid = mc.mid 
    JOIN M_Director md ON md.mid = m.mid 
    JOIN PersON p1 ON p1.pid = trim(md.pid)
    WHERE trim(p1.name) = \\'Yash Chopra\\'
    GROUP BY trim(p.pid)
) b 
ON a.Actor_Id = b.Actor_Id
WHERE b.Yash_Chopra_Directed_Movies > a.NON_Yash_Chopra_Directed_Movies;