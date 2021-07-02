--A decade is a sequence of 10 consecutive years. For example, say in your database you have movie information starting from 1965.
-- Then the first decade is 1965, 1966, ..., 1974; the second one is 1967, 1968, ..., 1976 and so on.
-- Find the decade D with the largest number of films and the total number of films in D. 
SELECT decade, max(movie_counts)
FROM 
(
    SELECT decade, count(*) AS movie_counts
    FROM
    (
        SELECT m.year, vw.min_year, (((m.year-vw.min_year)/10)+1) AS decade FROM Movie m 
        JOIN 
        (
            SELECT min(year) AS min_year FROM Movie
        )view ON 1=1
    )inner_view
    GROUP BY decade
)outer_view;